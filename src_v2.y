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

int labels[50];

char last_variable[50];

int get_nb_line_asm(){
  return nb_line_asm;
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

void printTab(){

  fprintf(yyout,"Size is : %d\n",index_tab_symbol-1);

  int index = 0;
  while(index < index_tab_symbol){
    fprintf(yyout,"SymbolTab : INDEX : %d - NAME : %s - CONSTANT : %d\n",index,tab_symbol[index].name,tab_symbol[index].constant);
    index++;
  }

}

void patch(int from, int to){
  labels[from] = to;
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
      | rIF rBODY
      | 
      ;

rIF : tIF 
      tPAROUVR 
      rEXPR_COMP 
      tPARFERM 
      tACOOUVR {
        int line = get_nb_line_asm();
        fprintf(yyout,"LINE : %d\n",line);
        $1 = line;
        nb_line_asm++;
      }
      rBODY {
        int current = get_nb_line_asm();
        fprintf(yyout,"LINE : %d\n",current);
        patch($1,current+2);
        fprintf(yyout,"JMPF %d\n",labels[$1]);
        nb_line_asm++;
        $1 = nb_line_asm;
      }
      tACOFERM
      tELSE
      tACOOUVR
      rBODY 
      {
        int current = get_nb_line_asm() ; 
			  patch($1, current + 1) ;
        fprintf(yyout,"JMP %d\n",labels[$1]);
      }
      tACOFERM
      ;

rEXPR_COMP : 
        rNBR tEGAL tEGAL rNBR 
        {
          int result = 0;
          if($1 == $4){
            result = 1;
          }
          fprintf(yyout,"EQU %d %d %d\n",result,$1,$4);
          nb_line_asm++;
        }
        | 
        rNBR tINF rNBR 
        {
          int result = 0;
          if($1 < $3){
            result = 1;
          }
          fprintf(yyout,"INF %d %d %d\n",result,$1,$3);
          nb_line_asm++;
        }
        | 
        rNBR tSUP rNBR 
        {
          int result = 0;
          if($1 > $3){
            result = 1;
          }
          fprintf(yyout,"SUP %d %d %d\n",result,$1,$3);
          nb_line_asm++;
        }
        | 
        tNBR
        {
          int result = 0;
          if($1 > 0){
            result = 1;
          }
          fprintf(yyout,"SUP %d %d %d\n",result,$1,0);
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
              | tPTVIRGULE { fprintf(yyout,"\n"); } 
;

rAFFECT : tVAR  
          tEGAL 
          rNBR         
          {
          int adr_var = find_symbol($1);
          int adr_expr = get_last_symbol();
          fprintf(yyout,"COP %d %d\n",adr_var,adr_expr);
          nb_line_asm++;
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
            nb_line_asm++;
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
          nb_line_asm++;

        } 
      | tNBR { 
          push("$",1);   
          int adr_expr = get_last_symbol();
          fprintf(yyout,"AFC %d %d\n",adr_expr,$1);
          nb_line_asm++;
        }
      | rNBR 
        tPLUS 
        rNBR { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"ADD %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rNBR 
        tMOINS 
        rNBR  
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"SOU %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rNBR  
        tMUL
        rNBR 
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"MUL %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | rNBR  
        tDIVISER
        rNBR
        { int first_operand = get_last_symbol()-1;
        int second_operand = get_last_symbol();
        fprintf(yyout,"DIV %d %d %d\n",first_operand,first_operand,second_operand);
        nb_line_asm++;
        pop(); }
      | tPAROUVR
        rNBR 
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