 

%%

"int" printf("trouvé int\n");
"main" printf ("trouvé main\n");
"const" printf ("trouvé const\n");
"(" printf ("trouvé (\n");
")" printf ("trouvé )\n");
"[" printf ("trouvé [\n");
"]" printf ("trouvé  ]\n");
"}" printf ("trouvé }\n");
"{" printf ("trouvé  {\n");
"char" printf ("trouvé char\n");
"&" printf ("trouvé &\n");
"*" printf ("trouvé *\n");
\n printf("trouvé newline\n");
\t printf("trouvé TAB\n");
\b printf("trouvé backspace\n");
"+" printf ("trouvé +\n");
"-" printf ("trouvé -\n");
"printf" printf ("trouvé printf\n");
"/" printf ("trouvé /\n");
"=" printf ("trouvé =\n");
";" printf ("trouvé ;\n");
" " printf ("trouvé espace\n");
"," printf ("trouvé ,\n");
"." printf ("trouvé .\n");
[a-zA-Z][a-zA-Z0-9_]* printf("trouvé var : %s\n", yytext) ;
[0-9]+$ printf("trouvé nombre : %s\n", yytext) ;
"_" printf ("trouvé tiret du 8\n");

%%

int yywrap(void){}

int main(void){
    printf("Debut\n");
    yylex();
    return 0;
}