flex sourcev2.l
bison -d -v src_v2.y
gcc lex.yy.c y.tab.c -o hello.exe