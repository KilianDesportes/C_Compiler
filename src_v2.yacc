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

int nb_line_asm = 0;


/* PRINCIPE POUR IF/ELSE ---->

FAIRE UN TABLEAU DINSTRUCTION 
AJOUTER PETIT A PETIT LES instructions
ET POUR LE IF/ELSE ON AJOUTE JMP ET JMPF A LA LIGNE SOUHAITEE
ET ON DECALE TOUT LE RESTE DANS LE TABLEAU
*/

int line_test_while;

char last_variable[50];

int get_nb_line_asm(){
  return nb_line_asm;
}

void printTab(){

  fprintf(yyout,"Size is : %d\n",index_tab_symbol-1);

  int index = 0;
  while(index < index_tab_symbol){
    fprintf(yyout,"SymbolTab : INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
    index++;
  }

}

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


void patchJMPF(int pos, int test, int to){

  fseek(yyout,pos,SEEK_SET);
  fprintf(yyout,"JMPF %3d %3d\n",test,to);
  fseek(yyout,0,SEEK_END);

}

void patchJMP(int pos, int to){

  fseek(yyout,pos,SEEK_SET);
  fprintf(yyout,"JMP %3d\n",to);
  fseek(yyout,0,SEEK_END);

}


%}

%token tINT tMAIN tCONST tPARFERM tPAROUVR tCROFERM tCROOUVR tACOFERM tACOOUVR tCHAR tMUL tNEWLINE tTAB tBACKSPACE;
%token tPLUS tMOINS tPRINTF tDIVISER tEGAL tPTVIRGULE tESPACE tVIRGULE tPOINT tELSE tINF tSUP;

%union 
{
  int nb; 
  char var[50];
};

%token <nb> tNBR;
%token <var> tVAR;
%token <nb> tIF;
%token <nb> tWHILE;

%type <nb> rEXPR;
%type <nb> rEXPR_COMP;
%type <nb> rIF_ELSE;
%type <nb> rWHILE;

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
      | rIF_ELSE rBODY;
      | rWHILE rBODY;
      |
      ;


rIF_ELSE : tIF 
      tPAROUVR 
      rEXPR_COMP 
      tPARFERM 
      tACOOUVR {
        int line = get_nb_line_asm();
        $1 = ftell(yyout);
        fprintf(yyout,"            \n");
        nb_line_asm++;
      }
      rBODY {
        int current = get_nb_line_asm();

        patchJMPF($1,$3,current+2);
        
        $1 = ftell(yyout);
        fprintf(yyout,"       \n");

        nb_line_asm++;
      }
      tACOFERM
      tELSE
      tACOOUVR
      rBODY 
      {
        int current = get_nb_line_asm() ; 

			  patchJMP($1,current+1);
        
        nb_line_asm++;
        $1 = nb_line_asm;
      }
      tACOFERM
      ;

rWHILE : tWHILE 
      tPAROUVR 
      rEXPR_COMP 
      tPARFERM 
      tACOOUVR {
        int line = get_nb_line_asm();
        line_test_while = line;
        $1 = ftell(yyout);
        fprintf(yyout,"            \n");
        nb_line_asm++;
      }
      rBODY {
        int current = get_nb_line_asm();

        patchJMPF($1,$3,current+2);

        nb_line_asm++;

        fprintf(yyout,"JMP %d\n",line_test_while);

        nb_line_asm++;

      }
      tACOFERM
      ;

rEXPR_COMP : 
        rEXPR tEGAL tEGAL rEXPR 
        {
          fprintf(yyout,"EQU %d %d %d\n",$1,$1,$4);
          $$ = $1;
          nb_line_asm++;
        }
        | 
        rEXPR tINF rEXPR 
        {
          fprintf(yyout,"INF %d %d %d\n",$1,$1,$3);
          $$ = $1;
          nb_line_asm++;
        }
        | 
        rEXPR tSUP rEXPR 
        {
          fprintf(yyout,"SUP %d %d %d\n",$1,$1,$3);
          $$ = $1;
          nb_line_asm++;
        }
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
              | tPTVIRGULE
;

rAFFECT : tVAR  
          tEGAL 
          rEXPR         
          {
          int adr_var = find_symbol($1);
          int adr_expr = get_last_symbol();
          fprintf(yyout,"COP %d %d\n",adr_var,adr_expr);
          nb_line_asm++;
          pop();
          }
          tPTVIRGULE
        ;

rAFFECT_DECL : tEGAL
          rEXPR
          {
            int adr_var = find_symbol(last_variable);
            int adr_expr = get_last_symbol();
            fprintf(yyout,"COP %d %d\n",adr_var,adr_expr);
            nb_line_asm++;
            pop();
          }
          |
          ;

rPRINTF : tPRINTF
          tPAROUVR
          tVAR {
            int index = find_symbol($3);
            fprintf(yyout,"PRI %d\n",index);
            nb_line_asm++;
          }
          tPARFERM
          tPTVIRGULE
        ;

rEXPR : tVAR { 
          push("$",1); 
          int adr_var = find_symbol($1);
          int adr_expr = get_last_symbol();
          fprintf(yyout,"COP %d %d\n",adr_expr,adr_var);
          nb_line_asm++;
          $$ = adr_var;
        } 
      | tNBR { 
          push("$",1);   
          int adr_expr = get_last_symbol();
          fprintf(yyout,"AFC %d %d\n",adr_expr,$1);
          nb_line_asm++;
          $$ = adr_expr;
        }
      | rEXPR 
        tPLUS 
        rEXPR { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"ADD %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rEXPR 
        tMOINS 
        rEXPR  
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"SOU %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rEXPR  
        tMUL
        rEXPR 
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"MUL %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rEXPR  
        tDIVISER
        rEXPR
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"DIV %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | tPAROUVR
        rEXPR
        tPARFERM
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