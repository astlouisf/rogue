#include <stdio.h>
#include <string.h>

typedef long int word;

word c_test(void* rsp){
  printf("C-test! %p\n",rsp);
  return 42*4;
}


extern word _p_argc;
extern char** _p_argv;

word io_get_argc(word* rsp){
  rsp[0] = _p_argc<<2;
  return 0;
}

word io_get_argvi_len(word* rsp){
  word i = rsp[0] >> 2;
  rsp[1] = strlen(_p_argv[i]) << 2;
  return 0;
}

word io_fill_argv(word* rsp){
  typedef struct pair{
    word car;
    word cdr;
  } pair;
  pair* p = (pair*)(rsp[0]-2);
  int i;
  for (i=0;i<_p_argc;i++){
    char* s = (char*)(p->car-1);
    int j;
    int len = strlen(_p_argv[i])+1;
    for (j=0;j<len;j++){
      s[j] = _p_argv[i][j];
    }
    p = (pair*)(p->cdr-2);
  }
  return 0;
}

word io_open_input_file(word* rsp){
  char* path = ((char*)rsp[0])-1;
  FILE* fp = fopen(path,"r");
  if (fp == 0){
    printf("Opening File '%.32s' failed.\n",path);
  }
  rsp[1] = ((word)fp)<<2;
  return 0;
}

word io_open_output_file(word* rsp){
  char* path = ((char*)rsp[0])-1;
  FILE* fp = fopen(path,"w");
  if (fp == 0){
    printf("Opening File '%.32s' failed.\n",path);
  }
  rsp[1] = ((word)fp)<<2;
  return 0;
}


word io_close_file(word* rsp){
  FILE* fp = (FILE*)(rsp[0]>>2);
  fclose(fp);
  return 0;
}

word io_read_char(word* rsp){
  FILE* fp = (FILE*)(rsp[0]>>2);
  word c = fgetc(fp);
  rsp[1] = c*4;
  return 0;
}

word io_write_char(word* rsp){
  FILE* fp = (FILE*)(rsp[0]>>2);
  int c = rsp[1]>>2;
  fputc(c,fp);
  return 0;
}

word io_popen(word* rsp){
  char* path = ((char*)rsp[0])-1;
  FILE* fp = popen(path,"r");
  rsp[1] = ((word)fp)<<2;
  return 0;
}

// taken from stackoverflow:
int fpeek(FILE *stream)
{
    int c;

    c = fgetc(stream);
    ungetc(c, stream);

    return c;
}

word io_peek_char(word* rsp){
  FILE* fp = (FILE*)(rsp[0]>>2);
  word c = fpeek(fp);
  rsp[1] = c*4;
  return 0;
}
