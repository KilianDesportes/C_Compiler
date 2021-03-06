%{
#include "y.tab.h"
#include <string.h>
%}


%%

"int" return tINT;
"main" return tMAIN;
"const" return tCONST;
")" return tPARFERM;
"(" return tPAROUVR;
"]" return tCROFERM;
"[" return tCROOUVR;
"}" return tACOFERM;
"{" return tACOOUVR;
"char" return tCHAR;
"*" return tMUL;
\n {}
\t {}
\b {}
"+" return tPLUS;
"-" return tMOINS;
"printf" return tPRINTF;
"/" return tDIVISER;
"=" return tEGAL;
";" return tPTVIRGULE;
" " {}
"," return tVIRGULE;
"." return tPOINT;
"if" return tIF;
"else" return tELSE;
"while" return tWHILE;
"<" return tINF;
">" return tSUP;
[a-zA-Z][a-zA-Z0-9_]* {
    strcpy(yylval.var,yytext);
    return tVAR;
};
[0-9]+ { 
    yylval.nb = atoi(yytext) ; 
    return tNBR;
};

%%

int yywrap(void){}
