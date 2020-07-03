
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
     VARIABLE = 258,
     NUMBER = 259,
     MAIN = 260,
     INT = 261,
     FLOAT = 262,
     CHAR = 263,
     DOUBLE = 264,
     TOPOWER = 265,
     ADDITION = 266,
     SUBTRACTION = 267,
     MULTIPLICATION = 268,
     DIVISION = 269,
     UNIARYPLUS = 270,
     UNIARYMINUS = 271,
     GREATERTHAN = 272,
     GREATERTHANOREQUAL = 273,
     LESSTHAN = 274,
     LESSTHANOREQUAL = 275,
     EQUALTO = 276,
     NOTEQUALTO = 277,
     ASSIGN = 278,
     AND = 279,
     OR = 280,
     NOT = 281,
     SEMICOLON = 282,
     COLON = 283,
     DOT = 284,
     COMMA = 285,
     WHILE = 286,
     IF = 287,
     ELSE = 288,
     ELSEX = 289,
     FOR = 290,
     SWITCH = 291,
     BREAK = 292,
     CASE = 293,
     CONTINUES = 294,
     DEFAULT = 295,
     SINE = 296,
     COS = 297,
     TAN = 298,
     LN = 299,
     FACTORIAL = 300,
     PRIME = 301,
     ODDEVEN = 302,
     OUTPUT = 303,
     INPUT = 304,
     FBO = 305,
     FBC = 306,
     SBO = 307,
     SBC = 308,
     IFX = 309,
     MULTIPLICATIN = 310,
     MODULATION = 311
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 22 "compiler1.y"

			        int number;
			        char *string;
			


/* Line 1676 of yacc.c  */
#line 115 "compiler1.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


