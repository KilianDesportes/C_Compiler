flex sourcev2.l
bison -dy -v src_v2.yacc
gcc lex.yy.c y.tab.c -o hello.exe