%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
extern FILE *yyout;

int yydebug = 1;

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
  char var[50];
};

%token <nb> tNBR;
%token <var> tVAR;

%right tEGAL
%left tPLUS tMOINS
%left tMUL tDIVISER

%start start

%%

start : tINT 
        tMAIN 
        tPAROUVR 
        tPARFERM 
        tACOOUVR 
        rBODY 
        tACOFERM 
        ;

rBODY : rDECL rBODY 
      | rAFFECT rBODY 
      | rPRINTF rBODY 
      | 
      ;

rDECL : tINT 
        tVAR { fprintf(yyout,"DECL ajout INT %s ",$2); }
        rAFFECT_DECL
        rMULTIPLEVAR
      | tCONST tINT 
        tVAR { fprintf(yyout,"DECL ajout INT %s ",$3); }
        rAFFECT_DECL
        rMULTIPLEVAR
      ;

rMULTIPLEVAR :  tVIRGULE 
                tVAR { fprintf(yyout,"MULTIPLE ajout INT %s ",$2); } 
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tCONST
                tVIRGULE 
                tVAR { fprintf(yyout,"MULTIPLE ajout INT %s ",$3); } 
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tPTVIRGULE { fprintf(yyout,"\n"); } 
;

rAFFECT : tVAR { fprintf(yyout,"%s",$1); } 
          tEGAL { fprintf(yyout,"=");} 
          rNBR 
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rAFFECT_DECL : tEGAL { fprintf(yyout,"=");} 
          rNBR 
          |
          ;

rPRINTF : tPRINTF { fprintf(yyout,"printf "); } 
          tPAROUVR
          tVAR { fprintf(yyout,"%s",$4); } 
          tPARFERM
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rNBR : tVAR { fprintf(yyout,"%s",$1); } 
      | tNBR { fprintf(yyout,"%d",$1); } 
      | rNBR 
        tPLUS { fprintf(yyout," + "); } 
        rNBR
      | rNBR 
        tMOINS { fprintf(yyout," - "); } 
        rNBR
      | rNBR  
        tMUL { fprintf(yyout," * "); } 
        rNBR
      | rNBR  
        tDIVISER { fprintf(yyout," / "); } 
        rNBR
      | tPAROUVR  { fprintf(yyout,"("); } 
        rNBR 
        tPARFERM { fprintf(yyout,")"); } 
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