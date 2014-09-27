#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>

typedef long int word;

extern word globals_head[];
extern word globals_tail;
extern word* _p_stack_top;
extern word* _p_stack_bottom;
extern word* _p_heap_start;
extern word* _p_heap_current;
extern word* _p_heap_end;
extern word* _p_alloc_ptr;
extern word  _p_alloc_wanted;
extern word  _p_allocd_size;
extern word  _p_allocd_obj;
extern word  _p_allocd_pair;

typedef struct scm_obj {
  word size;
  word type;
  word data[];
} scm_obj;



word words_moved;

void gc_copy_object(scm_obj* obj,
                    int obj_tag,
                    char** copy){
  int obj_size = obj->size;
  int obj_type = obj->type;
  words_moved += obj->size/sizeof(word)+2;
  memcpy(*copy,obj,2*sizeof(word)+obj->size);
  obj->size = -1; // broken heart
  obj->type = (word)(*copy + 2*sizeof(word) + obj_tag); // the address of the new object 
  // is stored in the second word
  scm_obj* asd = (scm_obj*)*copy;
  *copy += 2*sizeof(word)+obj_size;
}

word* _heap_start;

void gc_attempt_copy(word* data,int i,char** copy){
  //printf("gac %p %d %ld %lx %ld\n",data,i,(word*)data[i]-_heap_start,data[i],data[i]/4);
  int obj_tag = (data[i] & 3);
  if ( obj_tag == 1 || obj_tag == 2){ // it's a pointer or a pair
    scm_obj* obj = (scm_obj*)((char*) data[i]-16-obj_tag);
    // make sure the object is in the heap
    if ( (word*)obj < _p_heap_end && (word*)obj >= _p_heap_start){
      // the new object is going to be at this address, so we 
      // change the pointer:
      //printf("%d %d\n", obj->size, obj->type);
      if (obj->size == -1){ // broken heart
        //printf("BH  %p %p\n",obj,(void*)obj->type);
        data[i] = obj->type;
      }else{
        data[i] = (word)(*copy+16+obj_tag);
        gc_copy_object(obj,obj_tag,copy);
      }
    }
    else{
      //printf("object not in heap? %p\n",data[i]);
    }
  }
}

int first_gc = 0;

void examine_raw(word s){
  int obj_tag = (s & 3);
  if ( obj_tag == 1 || obj_tag == 2){ // it's a pointer or a pair
    scm_obj* p = (scm_obj*)((char*) s-16-obj_tag);
    printf("type:%ld size:%ld\n",p->type,p->size);
  }else{
    printf("Not a pointer %p\n",(void*)s);
  }
}

void _gc_routine(){
  //printf("Allocs: %ld pairs (%ld bytes) %ld objs (%ld bytes)\n",_p_allocd_pair,_p_allocd_pair*32,
  //       _p_allocd_obj,_p_allocd_size);
  word n_globals = &globals_tail-globals_head;
  word n_stack = _p_stack_top-_p_stack_bottom;
  unsigned int heap_size = _p_heap_end - _p_heap_start;
  int heap_region = _p_alloc_ptr < _p_heap_start + heap_size/2 ? 0 : 1;
  char* copy = (char*)(_p_heap_start + (1-heap_region)*heap_size/2);
  char* scan = copy;
  _p_heap_current = (word*)copy;
  _heap_start = _p_heap_current;
  int i;
  words_moved = 0;
  _p_allocd_pair=_p_allocd_obj=_p_allocd_size = 0;

  if (first_gc){
    printf("globals: %ld (%p)\n",n_globals,globals_head);
    printf("stack span: %p-%p (size: %ld words)\n",
           _p_stack_top,_p_stack_bottom,
           n_stack);
    printf("Heap span : %p-%p (size: 0x%lx bytes, 0x%lx words, %d)\n",
           _p_heap_start,_p_heap_end,
           (_p_heap_end-_p_heap_start)*sizeof(word),
           _p_heap_end-_p_heap_start,
           heap_size);
    first_gc = 0;
  }
  if (0){
    printf("Current Heap region : %d\n", heap_region);
    printf("Copying to region: %p\n", copy);
  }

  // copy globally pointed objects
  for (i=0;i<n_globals;i++){
    gc_attempt_copy(globals_head,i,&copy);
  }

  // copy stack pointed objects
  for (i=0;i<n_stack;i++){
    gc_attempt_copy(_p_stack_bottom,i,&copy);
  }

  //printf("Copy: %p    Scan: %p\n",copy,scan);
  // copy phase
  while (copy != scan){
    scm_obj* obj = (scm_obj*)scan;
    int scan_start = 0;
    int scan_end = 0;
    //printf("Scanning %p %ld %ld\n",obj,obj->size,obj->type);
    scan += 2*sizeof(word)+obj->size;
    word obj_type = obj->type;
    if (obj_type == 2){ // pair
      scan_end = 2; // scan first and second words
    } else if (obj_type >= 42 && obj_type <= 44){ // string, symbol, char
      // nothing to do
    } else if (obj_type == 45){ // vector
      scan_end = obj->size / sizeof(word);
    } else if (obj_type == 96){ // closure
      scan_start = 1;
      scan_end = obj->size / sizeof(word);
    } else if (obj_type == 97){ // machine code block
      // end of the meta data containing pairs of values and positions
      // within the code of where the value is referenced
      word* meta_data = (obj->data)+obj->size/sizeof(word)-2;
      word value = *meta_data;
      word position = *(meta_data+1);
      while (value != 0){
        gc_attempt_copy(meta_data,0,&copy);
        int* label_ptr = (int*)(((char*)obj->data)+position);
        value = *meta_data; // refresh the updated address
        // update the reference to the value
        *label_ptr = (int)(value-(((word)obj->data)+position+4));
        meta_data -= 2;
        value = *meta_data;
        position = *(meta_data+1);
        }
    } else{
      printf("Copying without collecting %ld\n",obj_type);
    }
    for (;scan_start<scan_end;scan_start++){
      gc_attempt_copy(obj->data,scan_start,&copy);
    }
  }
  /*gettimeofday(&tv, NULL);
  time = (tv.tv_sec) * 1000 + (tv.tv_usec) / 1000. ;
  printf("moved %d words, space left: %d/%d words\n",
         words_moved,(_p_heap_current+heap_size)-(word*)copy,heap_size);
  // printf("%p %p %p %p %p\n",copy,_p_heap_start,_p_heap_current,_p_heap_current+heap_size,_p_heap_end);
  */
  word freespace = (_p_heap_current+heap_size/2)-(word*)copy;
  if (_p_alloc_wanted/sizeof(word)>freespace){

    printf("stack span: %p-%p (size: %ld words)\n",
           _p_stack_top,_p_stack_bottom,
           n_stack);
    printf("Heap span : %p-%p (size: 0x%lx bytes, 0x%lx words, %d)\n",
           _p_heap_start,_p_heap_end,
           (_p_heap_end-_p_heap_start)*sizeof(word),
           _p_heap_end-_p_heap_start,
           heap_size);
    printf("*** ERROR Out of memory.\n");
    exit(1);
  }
  if (0){
    printf("GC (gt: %ld, free: %ld, occ:%ld, stack:%ld)\n",_p_alloc_wanted/sizeof(word),
           freespace,
           words_moved,n_stack);}
  //printf("GC end %f\n\n",time);
  fflush(stdout);
  // this should crash/0-ify any access to the old data
  //memset(_p_heap_start + heap_region*heap_size/2,0,heap_size/2);
  _p_alloc_ptr = (word*)copy;
  //printf("leaving %%alloc* %p\n",_p_alloc_ptr);
}


/*
    //printf("%d : %lx\n",i,globals_head[i]);
    int obj_tag = (globals_head[i] & 3);
    if ( obj_tag == 1 || obj_tag == 2){ // it's a pointer or a pair
      scm_obj* obj = (scm_obj*)((char*) globals_head[i]-16-obj_tag);
      if ( (word*)obj < _p_heap_end && (word*)obj >= _p_heap_start){
        // the new object is going to be at this address:
        globals_head[i] = (word)(copy+16+obj_tag);
        gc_copy_object(obj,obj_tag,&copy);
      }else{
        //printf("Unknown non-heap object: %lx\n",globals_head[i]);
      }
    }
    else{
      //printf("Non-object %lx\n",globals_head[i]);
      }*/
