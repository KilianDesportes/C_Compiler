%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
extern FILE *yyout;

int yylex(void);

void yyerror (char const *s) {
    fprintf (stderr, "%s\n", s);
}

struct symbol{
  char * name;
  int constant;
};

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

rMAIN : tMAIN { fprintf(yyout,"main"); } 
        tPAROUVR { fprintf(yyout,"("); } 
        tPARFERM { fprintf(yyout,")"); } 
        tACOOUVR { fprintf(yyout,"{\n"); } 
        rBODY 
        tACOFERM { fprintf(yyout,"}"); } 
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
     | tCONST { fprintf(yyout,"const ");}
       tINT { fprintf(yyout,"int "); } 
     ;

rDECL : rINT 
        tVAR { fprintf(yyout,"%s\n",$2);}
        tPTVIRGULE 
      | rINT 
        tVAR { fprintf(yyout,"%s",$2); } 
        rMULTIPLEVAR 
        tPTVIRGULE { fprintf(yyout,";\n"); } 
      ;

rAFFECT : rINT 
          tVAR { fprintf(yyout,"%s",$2); } 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        | tVAR { fprintf(yyout,"%s",$1); } 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        | rINT 
          tVAR { fprintf(yyout,"%s",$2); } 
          rMULTIPLEVAR 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        | tVAR { fprintf(yyout,"%s",$1); } 
          rMULTIPLEVAR 
          tEGAL  { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        ;

rMULTIPLEVAR : tVIRGULE 
               tVAR { fprintf(yyout,",%s",$2); } 
               rMULTIPLEVAR 
             | 
             ;

rPRINTF : tPRINTF { fprintf(yyout,"printf"); } 
          tPAROUVR { fprintf(yyout,"("); } 
          rTEXTE 
          tPARFERM { fprintf(yyout,")"); } 
          tPTVIRGULE { fprintf(yyout,";\n"); } 
        ;

rNBR : tVAR { fprintf(yyout,"%s",$1); } 
      | tNBR { fprintf(yyout,"%d",$1); } 
      | rNBR 
        rOPERATOR 
        rNBR 
      | tPAROUVR  { fprintf(yyout,"("); } 
        rNBR 
        tPARFERM { fprintf(yyout,")"); } 
      ;

rOPERATOR : tPLUS { fprintf(yyout,"+"); } 
          | tMOINS { fprintf(yyout,"-"); } 
          | tMUL { fprintf(yyout,"*"); } 
          | tDIVISER { fprintf(yyout,"/"); }  
          ; 

rTEXTE : tVAR { fprintf(yyout,"%s",$1); } 
         rTEXTE 
       | tVAR { fprintf(yyout,"%s",$1); } 
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