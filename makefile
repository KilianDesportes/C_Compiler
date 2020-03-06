all: comp

comp: y.tab.o lex.yy.o
	gcc -Wall y.tab.o lex.yy.o -o comp

y.tab.c: src.y
	yacc -d src.y

lex.yy.c: sourcev2
	lex sourcev2

