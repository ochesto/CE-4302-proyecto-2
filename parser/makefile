y.tab.c: myscanner.y
	yacc -d myscanner.y

lex.yy.c: y.tab.c myscanner.l
	lex myscanner.l

myscanner: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o myscanner 

program:
	python2 parser.py 

open:
	cat program.txt

all: lex.yy.c y.tab.c myscanner.l
	gcc -g lex.yy.c y.tab.c -o myscanner
	python2 parser.py 
	cat program.txt


clean:
	rm -rf lex.yy.c y.tab.c y.tab.h myscanner myscanner.dSYM
