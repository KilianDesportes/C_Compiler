
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     tINT = 258,
     tMAIN = 259,
     tCONST = 260,
     tPARFERM = 261,
     tPAROUVR = 262,
     tCROFERM = 263,
     tCROOUVR = 264,
     tACOFERM = 265,
     tACOOUVR = 266,
     tCHAR = 267,
     tMUL = 268,
     tNEWLINE = 269,
     tTAB = 270,
     tBACKSPACE = 271,
     tPLUS = 272,
     tMOINS = 273,
     tPRINTF = 274,
     tDIVISER = 275,
     tEGAL = 276,
     tPTVIRGULE = 277,
     tESPACE = 278,
     tVIRGULE = 279,
     tPOINT = 280,
     tNBR = 281,
     tVAR = 282
   };
#endif
/* Tokens.  */
#define tINT 258
#define tMAIN 259
#define tCONST 260
#define tPARFERM 261
#define tPAROUVR 262
#define tCROFERM 263
#define tCROOUVR 264
#define tACOFERM 265
#define tACOOUVR 266
#define tCHAR 267
#define tMUL 268
#define tNEWLINE 269
#define tTAB 270
#define tBACKSPACE 271
#define tPLUS 272
#define tMOINS 273
#define tPRINTF 274
#define tDIVISER 275
#define tEGAL 276
#define tPTVIRGULE 277
#define tESPACE 278
#define tVIRGULE 279
#define tPOINT 280
#define tNBR 281
#define tVAR 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 146 "src_v2.y"

  int nb; 
  char var[50];



/* Line 1676 of yacc.c  */
#line 113 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


