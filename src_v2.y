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

// NOTE : faire un tableau de char* pour retourner les instructions, pas faire de fprintf a chaque fois

t_symbol tab_symbol[256];
int index_tab_symbol = 0;

char last_variable[50];

void push(char * str_variable_name, int bool_is_constant){

  int bool_symbol_exist = find_symbol(str_variable_name);
  int bool_is_temp = (strcmp(str_variable_name,"$")==0);

  if(bool_symbol_exist == -1 || bool_is_temp){
    strcpy(tab_symbol[index_tab_symbol].name, str_variable_name);
    tab_symbol[index_tab_symbol].constant = bool_is_constant;
    index_tab_symbol++;
  }

}

int find_symbol(char * str_nom){

    int index_counter = 0;
    int bool_trouve = 0;

    while(index_counter < index_tab_symbol && !bool_trouve){
      if(strcmp(tab_symbol[index_counter].name,str_nom)==0){
        bool_trouve = 1;
      } else {
        index_counter++;
      }
    }

    if(bool_trouve==0){
      index_counter = -1;
    }

    return index_counter;
}

void pop(){
  index_tab_symbol--;
}


int get_last_symbol(){
  return index_tab_symbol-1;
}

void printTab(){

  fprintf(yyout,"Size is : %d\n",index_tab_symbol-1);

  int index = 0;
  while(index < index_tab_symbol){
    fprintf(yyout,"SymbolTab : INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
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
          push($2,0);
          strcpy(last_variable,$2);
        }
        rAFFECT_DECL
        rMULTIPLEVAR
      | tCONST tINT 
        tVAR { 
          push($3,1);
          strcpy(last_variable,$3);
        }
        rAFFECT_DECL
        rMULTIPLEVAR
      ;

rMULTIPLEVAR :  tVIRGULE 
                tVAR { 
                  push($2,0);
                  strcpy(last_variable,$2);
                }
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tCONST
                tVIRGULE 
                tVAR { 
                  push($3,1);
                  strcpy(last_variable,$3);
                }
                rAFFECT_DECL
                rMULTIPLEVAR 
              | tPTVIRGULE { fprintf(yyout,"\n"); } 
;

rAFFECT : tVAR  
          tEGAL 
          rNBR         
          {
          int adr_var = find_symbol($1);
          int adr_expr = get_last_symbol();
          fprintf(yyout,"COP %d %d\n",adr_var,adr_expr);
          pop();
          }
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rAFFECT_DECL : tEGAL
          rNBR
          {
            int adr_var = find_symbol(last_variable);
            int adr_expr = get_last_symbol();
            fprintf(yyout,"COP %d %d\n",adr_var,adr_expr);
            pop();
          }
          |
          ;

rPRINTF : tPRINTF { fprintf(yyout,"printf "); } 
          tPAROUVR
          tVAR { fprintf(yyout,"%s",$4); } 
          tPARFERM
          tPTVIRGULE { fprintf(yyout,"\n"); } 
        ;

rNBR : tVAR { 
          push("$",1); 
          int adr_var = find_symbol($1);
          int adr_expr = get_last_symbol();
          fprintf(yyout,"COP %d %d\n",adr_expr,adr_var);
        } 
      | tNBR { 
          push("$",1);   
          printTab();
          int adr_expr = get_last_symbol();
          fprintf(yyout,"AFC %d %d\n",adr_expr,$1);
        }
      | rNBR 
        tPLUS 
        rNBR { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"ADD %d %d %d\n",first_operand,first_operand,second_operand);
        pop(); }
      | rNBR 
        tMOINS 
        rNBR  
      | rNBR  
        tMUL
        rNBR 
      | rNBR  
        tDIVISER
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