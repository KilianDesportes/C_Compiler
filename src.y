%{

#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
extern FILE *yyout;

int yylex(void);

void yyerror (char const *s) {
    fprintf (stderr, "%s\n", s);
}

%}

%token tINT tMAIN tCONST tPARFERM tPAROUVR tCROFERM tCROOUVR tACOFERM tACOOUVR tCHAR tMUL tNEWLINE tTAB tBACKSPACE;
%token tPLUS tMOINS tPRINTF tDIVISER tEGAL tPTVIRGULE tESPACE tVIRGULE tPOINT;

%union 
{
  int nb; 
  char * var;
};

%token <nb> tNBR;
%token <var> tVAR;

%%

start : tINT { fprintf(yyout,"int "); } 
        rMAIN 
      | rMAIN 
      | rBODY
      ;

rMAIN : tMAIN { fprintf(yyout,"main "); } 
        tPAROUVR { fprintf(yyout,"parouvr "); } 
        tPARFERM { fprintf(yyout,"parferm "); } 
        tACOOUVR { fprintf(yyout,"acoouvr "); } 
        rBODY 
        tACOFERM { fprintf(yyout,"acoferm "); } 
      ;

rBODY : rEXPR 
      | 
      ;

rEXPR : rDECL rEXPR 
      | rAFFECT rEXPR 
      | rPRINTF rEXPR 
      | 
      ;

rINT : tINT { fprintf(yyout,"int "); } 
     | tCONST { fprintf(yyout,"const");}
       tINT { fprintf(yyout,"int "); } 
     ;

rDECL : rINT 
        tVAR { fprintf(yyout,"%s\n",$2);}
        tPTVIRGULE 
      | rINT 
        tVAR { fprintf(yyout,"%d",$2); } 
        rMULTIPLEVAR 
        tPTVIRGULE { fprintf(yyout,";\n"); } 
      ;

rAFFECT : rINT 
          tVAR { fprintf(yyout,"var");} 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";");} 
        | tVAR { fprintf(yyout,"var");} 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";");} 
        | rINT 
          tVAR { fprintf(yyout,"var");} 
          rMULTIPLEVAR 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";\n");} 
        | tVAR { fprintf(yyout,"var");} 
          rMULTIPLEVAR 
          tEGAL  { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";");} 
        ;

rMULTIPLEVAR : tVIRGULE 
               tVAR { fprintf(yyout,",%d",$2); } 
               rMULTIPLEVAR 
             | 
             ;

rPRINTF : tPRINTF { fprintf(yyout,"printf"); } 
          tPAROUVR { fprintf(yyout,"parouvr"); } 
          rTEXTE { fprintf(yyout,"texte"); }
          tPARFERM { fprintf(yyout,"parferm"); } 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        ;

rNBR : tVAR { fprintf(yyout,"var");}
      | tNBR { fprintf(yyout,"nbr");}
      | rNBR 
        rOPERATOR 
        rNBR 
      | tPAROUVR  { fprintf(yyout,"parouvr"); } 
        rNBR 
        tPARFERM { fprintf(yyout,"parferm"); } 
      ;

rOPERATOR : tPLUS { fprintf(yyout,"+"); } 
          | tMOINS { fprintf(yyout,"-"); } 
          | tMUL { fprintf(yyout,"*"); } 
          | tDIVISER { fprintf(yyout,"/"); }  
          ; 

rTEXTE : tVAR { fprintf(yyout,"var");}
         rTEXTE 
       | tVAR { fprintf(yyout,"var");}
       ;

%% 

int main(int argc, char *argv[]) {
  if (argc == 3) {

   yyout = fopen(argv[2],"w");
   yyin = fopen(argv[1], "r");
   yyparse();
   fclose(yyin);
   fclose(yyout);
  }
  else {
    printf("Wrong usage !\n");
  }

  return 0;
}