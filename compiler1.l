%{
	#include <stdio.h>
	#include <string.h>
	#include <math.h>
	#include "compiler1.tab.h"
	char multichar[100][100];
	char str[100];
	int i=0;
	int cnt=0;
	
	
%}
identifier t[a-zA-Z]+
header	"adding"[ ].*[.h]
single_com [$].*			{printf("This ia single line comment\n");}
multiple_com [!$*].*[*$!]			{printf("This ia Multi line comment\n");}
real_num  -?[0-9]+"."[0-9]+
integer_num -?[0-9]+

%%
{header}  			{printf("Header file.\n");}
"program start"	    {return MAIN; }
{identifier} {
	 yylval.string=strdup(yytext);
         return VARIABLE;} 	
{real_num}	    			{yylval.number= atoi(yytext); return NUMBER; }
{integer_num}	    			{yylval.number= atoi(yytext); return NUMBER; }
"pinteger"		{return INT;}	
"pfloat"		{return FLOAT;}
"pcharacter"		{return CHAR;}
"pdouble"		{return DOUBLE;}


"^pow^"			{return TOPOWER;}
"+add+" 		{return ADDITION;}
"-sub-" 		{return SUBTRACTION;}
"*mul*" 		{return MULTIPLICATION;}
"/div/"			{return DIVISION;}
"%mod%"			{return MODULATION;}
"+++"			{return UNIARYPLUS;}
"---"			{return UNIARYMINUS;}


">>gt>>"    	{return GREATERTHAN;}
"=>>gte>>="		{return GREATERTHANOREQUAL;}
"<<lt<<"   		{return LESSTHAN;} 
"=<<lte<<="		{return LESSTHANOREQUAL;}
"==eq=="        {return EQUALTO;}
"!==neq==!"		{return NOTEQUALTO;}
"=assign="		{return ASSIGN;}


"&&and&&" 		{return AND;}
"||or||" 		{return OR;}
"!!not!!" 		{return NOT;}


";semicom;" 	{return SEMICOLON;}
".dot." 		{return DOT;}
",comma,"  		{return COMMA;}
":colon:"		{return COLON;}



"forcircle"     {return FOR;}
"whilecircle"   {return WHILE;}
"either"      	{return IF;}
"or"            {return ELSE;}
"either_or"	{ return ELSEX; }


"switchon"      {return SWITCH;}
"switchoff"     {return BREAK;}
"switchnumber"  {return CASE;}
"switchdefault" {return DEFAULT;}


"SINETRI"    	{return SINE;}
"COSTRI"    	{return COS;}
"TANTRI"    	{return TAN;}
"LNTRI"    		{return LN;}
"!FACTORIALFUN!"  {return FACTORIAL;}
"PRIMEFUN"		{return PRIME;}
"ODDEVENFUN"		{return ODDEVEN;}




"write" 		{return OUTPUT;}
"scan"  		{return INPUT;}
						


"((fbo(("		{return FBO;}
"))fbc))"	 	{return FBC;}
"{{sbo{{"		{return SBO;}
"}}sbc}}"	 	{return SBC;}



[ \t\n]*

%%

int yywrap()
{
	return 1;
}

int main()
{
		yyin = freopen("input.txt", "r",stdin);
		freopen("resulttt.txt","w",stdout);
		yyparse();
}