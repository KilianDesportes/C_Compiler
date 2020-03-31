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
  int initialized;
}t_symbol;

// DEBUT DU TABLEAU : -> nom de la variable / constante ou non
// FIN DU TABLEAU (temporaire) : -> index du début du tableau / valeur

#define size 256

t_symbol tab_symbol[size];
int index_tab_symbol = 0;

void add_temp(int index_val, int val){

  int index_tab_temp = size - 1 - index_val;

  int bool_const = tab_symbol[index_val].constant;

  if(tab_symbol[index_val].initialized == 0 || bool_const != 0){

    itoa(index_val,tab_symbol[index_tab_temp].name,50);
    tab_symbol[index_tab_temp].constant = val;
    tab_symbol[index_val].initialized = 1;

  }else if(bool_const==0){

      yyerror("Compilation error - Modified CONST INT\n");

  }

  char name[50];
  strcpy(name,tab_symbol[index_val].name);
 
  fprintf(yyout,"Ajout var temporaire %s d'index %d avec la valeur %d\n",name,index_val,val);

}

int get_value_temp(int index_val){


  int index_temp = size - 1  - index_val;
  int value = tab_symbol[index_temp].constant;
  char name[50];
  strcpy(name,tab_symbol[index_val].name);
  fprintf(yyout,"Index pour la variable : %s d'index %d , temporaire : %d - valeur %d\n",name,index_val,index_temp,value);

  return value;

}


int get_adr(char * str_nom){

    int adr=-1;
    int index_tmp = 0;

    int bool_trouve = 0;

    while(index_tmp < index_tab_symbol && !bool_trouve){

      if(strcmp(tab_symbol[index_tmp].name,str_nom)==0){

        adr = index_tmp;

        bool_trouve = 1;

      } else {
      
        index_tmp++;

      }

    }

    return adr;
}


void add_symbol(char * str_nom, int const_bool){

  int index_tmp = 0;
  int bool_already_in = 0;
  while((index_tmp < index_tab_symbol) && !bool_already_in){
    if(strcmp(tab_symbol[index_tmp].name,str_nom)==0){
      bool_already_in = 1;
    }
    index_tmp++;
  }
  if(bool_already_in == 0){
    strcpy(tab_symbol[index_tab_symbol].name, str_nom);
    tab_symbol[index_tab_symbol].constant = const_bool;
    index_tab_symbol++;
  }

}

void printTabSymbol(){

  int index = 0;
  while(index < index_tab_symbol){
    fprintf(yyout,"SymbolTab : INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
    index++;
  }

}

void printTabTemp(){

  int index_tab_temp = 255 - index_tab_symbol;


  int index = 255;
  while(index > index_tab_temp){
    fprintf(yyout,"TempTab : INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
    index--;
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

%type <nb> rNBR;
%type <nb> rAFFECT_DECL;
%type <nb> rDECL;

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
        tVAR { 
          add_symbol($2,1);
          int adr = get_adr($2);
          fprintf(yyout,"DECL ajout INT %s à l'index %d\n",$2,adr); 
        }
        rAFFECT_DECL
        {
          int adr = get_adr($2);
            if(adr == -1){
              yyerror("Compilation error - Unknow variable\n");
            }else{
              add_temp(adr,$4);
            }
        }
        rMULTIPLEVAR
      | tCONST tINT 
        tVAR { 
          add_symbol($3,0);
          int adr = get_adr($3);
          fprintf(yyout,"DECL ajout INT %s à l'index %d\n",$3,adr); 

        }
        rAFFECT_DECL
        {
          int adr = get_adr($3);
            if(adr == -1){
              yyerror("Compilation error - Unknow variable\n");
            }else{
              add_temp(adr,$5);
            }
        }
        rMULTIPLEVAR
      ;

rMULTIPLEVAR :  tVIRGULE 
                tVAR { fprintf(yyout,"MULTIPLE ajout INT %s \n",$2); } 
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tCONST
                tVIRGULE 
                tVAR { fprintf(yyout,"MULTIPLE ajout INT %s \n",$3); } 
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tPTVIRGULE { fprintf(yyout,"\n"); } 
;

rAFFECT : tVAR  
          tEGAL 
          rNBR { 
            int adr = get_adr($1);
            if(adr == -1){
              yyerror("Compilation error - Unknow variable\n");
            }else{
              add_temp(adr,$3);
            }
          } 
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rAFFECT_DECL : tEGAL
          rNBR { $$ = $2; }
          |
          ;

rPRINTF : tPRINTF { fprintf(yyout,"printf "); } 
          tPAROUVR
          tVAR { fprintf(yyout,"%s",$4); } 
          tPARFERM
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rNBR : tVAR { 
    
        int adr = get_adr($1);
          if(adr == -1){
            yyerror("Compilation error - Unknow variable\n");
          }else{
            $$ = get_value_temp(adr);
          }

        } 
      | tNBR { $$=$1; } 
      | rNBR 
        tPLUS 
        rNBR  { $$=$1+$3; } 
      | rNBR 
        tMOINS 
        rNBR  { $$=$1-$3; } 
      | rNBR  
        tMUL
        rNBR  { $$=$1*$3; } 
      | rNBR  
        tDIVISER
        rNBR  { $$=$1/$3; } 
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