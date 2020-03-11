%{
#include <stdio.h>
#include <stdlib.h>
extern FILE* yyin;
extern FILE* yyout;
 
yyerror (int s)
{
  fprintf (stderr, "%s\n", s);
}

%}

%token tINT tMAIN tCONST tPARFERM tPAROUVR tCROFERM tCROOUVR tACOFERM tACOOUVR tCHAR tMUL tNEWLINE tTAB tBACKSPACE tPLUS tMOINS tPRINTF tDIVISER tEGAL tPTVIRGULE tESPACE tVIRGULE tPOINT tVAR tNBR

%%

start : tINT { printf("int "); } 
        rMAIN 
      | rMAIN 
      | rBODY
      ;

rMAIN : tMAIN { printf("main "); } 
        tPAROUVR { printf("parouvr "); } 
        tPARFERM { printf("parferm "); } 
        tACOOUVR { printf("acoouvr "); } 
        rBODY 
        tACOFERM { printf("acoferm "); } 
      ;

rBODY : rEXPR 
      | 
      ;

rEXPR : rDECL rEXPR 
      | rAFFECT rEXPR 
      | rPRINTF rEXPR 
      | 
      ;

rINT : tINT { printf("int "); } 
     | tCONST {printf("const");}
       tINT { printf("int"); } 
     ;

rDECL : rINT 
        tVAR {printf("%d",$1);}
        tPTVIRGULE 
      | rINT 
        tVAR { printf("%d",$2); } 
        rMULTIPLEVAR 
        tPTVIRGULE { printf(";\n"); } 
      ;

rAFFECT : rINT 
          tVAR {printf("var");} 
          tEGAL {printf("=");} 
          rNBR 
          tPTVIRGULE {printf(";");} 
        | tVAR {printf("var");} 
          tEGAL {printf("=");} 
          rNBR 
          tPTVIRGULE {printf(";");} 
        | rINT 
          tVAR {printf("var");} 
          rMULTIPLEVAR 
          tEGAL {printf("=");} 
          rNBR 
          tPTVIRGULE {printf(";");} 
        | tVAR {printf("var");} 
          rMULTIPLEVAR 
          tEGAL  {printf("=");} 
          rNBR 
          tPTVIRGULE {printf(";");} 
        ;

rMULTIPLEVAR : tVIRGULE 
               tVAR { printf(",%d",$2); } 
               rMULTIPLEVAR 
             | 
             ;

rPRINTF : tPRINTF { printf("printf"); } 
          tPAROUVR { printf("parouvr"); } 
          rTEXTE { printf("texte"); }
          tPARFERM { printf("parferm"); } 
          tPTVIRGULE { printf(";\n"); } 
        ;

rNBR : tVAR {printf("var");}
      | tNBR {printf("nbr");}
      | rNBR 
        rOPERATOR 
        rNBR 
      | tPAROUVR  { printf("parouvr"); } 
        rNBR 
        tPARFERM { printf("parferm"); } 
      ;

rOPERATOR : tPLUS { printf("+"); } 
          | tMOINS { printf("-"); } 
          | tMUL { printf("*"); } 
          | tDIVISER { printf("/"); }  
          ; 

rTEXTE : tVAR {printf("var");}
         rTEXTE 
       | tVAR {printf("var");}
       ;

%% 

int main(int argc, char* argv){
    yyparse();
}
