
SOURCE = *.scm utils/*.scm


all: roc 

check: roc py_tests 

roc: main.c
	gsc -o roc -exe main.c
main.c: $(SOURCE) 
	gsc -c main.scm
#gsc -exe -o roc main.scm

clean:
	rm -f roc main.c

py_tests:
	python test.py

