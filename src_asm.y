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

typedef struct{
  char name[50];
  int constant;
}t_symbol;

t_symbol tab_symbol[5000];
int index_tab_symbol = 0;
int index_tab_temp = 0;
int tab_temp[5000];

void test(char str_nom[50], int const_bool){

  strcpy(tab_symbol[0].name, str_nom);
  tab_symbol[0].constant = 44;

  fprintf(yyout,"| TEST %s |",tab_symbol[0].name);
  fprintf(yyout,"| TEST %d |",tab_symbol[0].constant);

}

void add_symbol(char * str_nom, int const_bool){
  
  strcpy(tab_symbol[index_tab_symbol].name, str_nom);
  tab_symbol[index_tab_symbol].constant = const_bool;
  index_tab_symbol++;

}

void printTabSymbol(){

  int index = 0;
  while(index < index_tab_symbol){
    fprintf(yyout,"INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
    index++;
  }

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
        tVAR { fprintf(yyout,"DECL ajout INT %s ",$2); 
          add_symbol($2,1);
          printTabSymbol();

        }
        rAFFECT_DECL
        rMULTIPLEVAR
      | tCONST tINT 
        tVAR { fprintf(yyout,"DECL ajout INT %s ",$3); 
          add_symbol($3,0);
          printTabSymbol();
        }
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