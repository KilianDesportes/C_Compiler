%{
#include <stdio.h>

 
yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

%}
%token tINT tMAIN tCONST tPARFERM tPAROUVR tCROFERM tCROOUVR tACOFERM tACOOUVR tCHAR tMUL tNEWLINE tTAB tBACKSPACE tPLUS tMOINS tPRINTF tDIVISER tEGAL tPTVIRGULE tESPACE tVIRGULE tPOINT tVAR tNBR

%%

start : tINT rMAIN 
      | rMAIN 
      | rBODY
      ;

rMAIN : tMAIN tPAROUVR tPARFERM tACOOUVR rBODY tACOFERM 
      ;

rBODY : rEXPR 
      | 
      ;

rEXPR : rDECL rEXPR 
      | rAFFECT rEXPR 
      | rPRINTF rEXPR 
      | 
      ;

rINT : tINT 
     | tCONST tINT 
     ;

rDECL : rINT tVAR tPTVIRGULE 
      | rINT tVAR rMULTIPLEVAR tPTVIRGULE 
      ;

rAFFECT : rINT tVAR tEGAL rNBR tPTVIRGULE 
        | tVAR tEGAL rNBR tPTVIRGULE 
        | rINT tVAR rMULTIPLEVAR tEGAL rNBR tPTVIRGULE
        | tVAR rMULTIPLEVAR tEGAL rNBR tPTVIRGULE
        ;

rMULTIPLEVAR : tVIRGULE tVAR rMULTIPLEVAR 
             | 
             ;

rPRINTF : tPRINTF tPAROUVR rTEXTE tPARFERM tPTVIRGULE { printf("%d\n",$3); }
        ;

rNBR : tVAR 
      | tNBR 
      | rNBR rOPERATOR rNBR 
      | tPAROUVR rNBR tPARFERM 
      ;

rOPERATOR : tPLUS 
          | tMOINS 
          | tMUL 
          | tDIVISER 
          ; 

rTEXTE : tVAR rTEXTE 
       | tVAR 
       ;

%% 

int main(){
    yyparse();
}
