			%{
				#include <stdio.h>
				#include <math.h>
				#define var 180
			    #define pi  3.1416
				#include<stdlib.h>
				#include<string.h>
				typedef struct entry {
			    		char *str;
			    		int n;
					}array;
				array store[1000],sym[1000];
				void enter (array *p, char *s, int n);
				int count=1,count1=1;
				int if_flag =1;
				int if_else_flag = 1;
				int check = 1;
				int total,counter;
			%}

			%union 
			{
			        int number;
			        char *string;
			}


			%token <string> VARIABLE
			%type <number> expression
			%type <string> statement basement base cases defaultvalue
			%token <number> NUMBER 

	
			


			%token <string> MAIN INT FLOAT CHAR DOUBLE
			%token <string> TOPOWER ADDITION SUBTRACTION MULTIPLICATION DIVISION UNIARYPLUS UNIARYMINUS
			%token <string> GREATERTHAN GREATERTHANOREQUAL LESSTHAN LESSTHANOREQUAL EQUALTO NOTEQUALTO ASSIGN 
			%token <string> AND OR NOT
			%token <string> SEMICOLON COLON DOT COMMA 
			%token <string> WHILE IF ELSE ELSEX
			%token <string> FOR SWITCH BREAK CASE CONTINUES DEFAULT
			%token <string> SINE COS TAN LN FACTORIAL PRIME ODDEVEN
			%token <string> OUTPUT INPUT
			%token <string> FBO FBC SBO SBC

			%nonassoc IFX
			%nonassoc ELSEX
			%nonassoc ELSE
			%nonassoc FOR


			%left GREATERTHAN GREATERTHANOREQUAL LESSTHAN LESSTHANOREQUAL
			%left ADDITION SUBTRACTION
			%left MULTIPLICATIN DIVISION
			%left MODULATION
			%left TOPOWER
			%left SINE COS TAN LN 
			%left ODDEVEN
			%left FACTORIAL PRIME
			%%


			program: MAIN fbs fbe sbs mainprogram sbe {
						printf("Program End.\n");
					}
				 ;
			mainprogram: 
				| mainprogram fstatement
				;
				
			fstatement: /* empty */

				| fstatement statement
				
				| declaration
				;
						
			declaration: TYPE ID1 SEMICOLON
						;
						
			TYPE : INT 
				   | FLOAT 
				   | CHAR 
				   | DOUBLE
				 ;

			ID1  : ID1 COMMA VARIABLE {
						if(symboltable($3))
						{
							printf("\nERROR:Multiple Declaration Of (%s) \n", $3 );
						}
						else
						{
							enter(&store[count],$3, count);
							count++;
							
						}
						}

				 |VARIABLE {
							if(symboltable($1))
								{
									printf("\nERROR:Multiple Declaration Of (%s) \n", $1 );
								}
								else
								{
									enter(&store[count],$1, count);
											count++;
								}
						}
				 ;	 
			statement:SEMICOLON
				|OUTPUT expression SEMICOLON
				| VARIABLE ASSIGN expression
				| VARIABLE ASSIGN expression SEMICOLON 		
				{
						if(symboltable($1)){
								int i = symboltable2($1);	
								if (!i){
									enter(&sym[count1], $1, $3);
									printf("\n(%s)Value of the Variable === %d\t\n",$1,$3);
									total= $3;
									count1++;
								}else{
									sym[i].n = $3;
									printf("\n(%s)Value of the Variable %s === %d\t\n",$1,$3);
								}
							}
							else {
								printf("\nERROR:(%s) not declared yet(First Time Use In This Function)\n",$1);
							}
							}
				| IF fbs expression fbe expression SEMICOLON {
											if(!$3){
												printf("Value of Exp : %d \n",$5);
											}
											else {
												printf("Invalid If.\n");
											}
										}
				| IF fbs expression fbe expression SEMICOLON ELSE  expression SEMICOLON {
											if($3){
												printf("Value of If condition : %d \n" , $5);
											}
											else{
												printf("Value of else condition : %d \n", $8);
											}
										}
				      
				| IF fbs expression fbe statement %prec IFX  {
								if($3 && if_flag == 1)
								{
									printf("\nonly if true");
									//printf("\nvalue of expression in IF: %d\n",$5);
									if_else_flag = 0;
									if_flag = 0;
								}
								else
								{
									if(if_flag == 1)
									{
										printf("condition value zero in IF block\n");
										if_flag = 0;
										if_else_flag = 0;
									}
								}
							}

				| IF fbs expression fbe statement ELSE statement {
								 	if($3)
									{
										if_flag = 0;
										if_else_flag = 1;
										printf("\nonly else if true");
										//printf("\nvalue of expression in IF: %d\n",$5);
									}
									else
									{	
										if(if_else_flag == 1)
										{
											if_flag = 0;
											if_else_flag = 0;
											printf("\nonly else else true");
											//printf("\nvalue of expression in ELSE: %d\n",$7);
										}
									}
							}
					| IF fbs expression fbe sbs IF fbs expression fbe sbs expression SEMICOLON sbe ELSE sbs expression SEMICOLON sbe expression SEMICOLON sbe ELSE sbs expression SEMICOLON sbe {
								 	if($3)
									{
										if($8)
											printf("\nvalue of expression middle IF: %d\n",$11);
										else
											printf("\nvalue of expression middle ELSE: %d\n",$16);
										printf("\nvalue of expression in first IF: %d\n",$19);
									}
									else
									{
										printf("\nvalue of expression in else: %d\n",$24);
									}
								   }
					| IF fbs expression fbe sbs expression SEMICOLON sbe ELSEX fbs expression fbe sbs expression SEMICOLON sbe ELSE sbs expression SEMICOLON sbe {
								 	if($3)
									{
										printf("\nvalue of expression in IF: %d\n",$6);
									}
									else if($11)
									{
										printf("\nvalue of expression in ELSE_IF: %d\n",$14);
									}
									else
									{
										printf("\nvalue of expression in ELSE: %d\n",$19);
									}
								   }	
				| FOR fbs VARIABLE ASSIGN expression SEMICOLON expression LESSTHAN expression SEMICOLON expression fbe SEMICOLON{
										printf("Single For Loop.\n");
										
				}
				|FOR fbs NUMBER COLON NUMBER fbe sbs expression sbe     {
				   int i=0;
				   printf("For Loop\n");
				   for(i=$3;i<$5;i++){
				   printf("Print %d \n",i);
				   }
				}
				| FOR fbs VARIABLE ASSIGN expression SEMICOLON expression LESSTHAN expression SEMICOLON expression fbe sbs statement sbe {
										printf("For Loop...This for loop will works for LESSTHAN expression\n");
										int i;
										for(i=$5;i<$9;i++)
										{
											printf("Result %d \n",i);
										}
										printf("\n");
										
				}
				| FOR fbs VARIABLE ASSIGN expression SEMICOLON expression GREATERTHAN expression SEMICOLON expression fbe sbs statement sbe {
										printf("For Loop...This for loop will works for GREATERTHAN expression\n");
										int i;
										for(i=$5;i>$9;i--)
										{
											printf("Result %d \n",i);
										}
										printf("\n");
										
				}
				| WHILE fbs expression LESSTHAN NUMBER fbe sbs statement sbe  {
											int i;
										printf("While LOOP: ");
										for(i=$3;i<$5;i++)
										{
											printf("%d ",i);
										}
										printf("\n");
										
				} 
				| SWITCH fbs expression fbe sbs basement sbe 
				
				;
			basement : base
				| base defaultvalue
				 ;

			base  : /*NULL*/
				 | base cases
				 ;

			cases    : CASE NUMBER COLON expression SEMICOLON BREAK SEMICOLON {
						if(total==$2){
							  counter=1;
							  printf("\nCase No. : %d  and Result : %d \n",$2,$4);
						}
					}
				 ;

			defaultvalue    : DEFAULT COLON expression SEMICOLON BREAK SEMICOLON {
						if(counter==0){
							printf("\nResult in default Value is :  %d \n",$3);
						}
					}
				;

  

			expression: NUMBER 			{$$=$1;}
				| VARIABLE 								{
																int i = symboltable2($1); 
																 $$ = sym[i].n; 
																 //printf("\nValue of the Variable=== %d\n",$$)
														}
				| expression ASSIGN expression 			{
																int i = symboltable2($3); 
																$$ = sym[i].n;
																//printf("\nValue of the Expression=== %d\n",$$)
														}
				| expression UNIARYPLUS           		{$$ = $1++ ;}
				| expression UNIARYMINUS           		{$$ = $1-- ;}
				| expression ADDITION expression		{$$ = $1 + $3;}
				| expression SUBTRACTION expression		{$$ = $1 - $3;}
				| expression MULTIPLICATION expression	{$$ = $1 * $3;}
				| expression DIVISION expression		{
																if($3) $$ = $1 / $3;
																else printf("\nDivision By Zero\n"); 
														}
				| SINE fbs expression fbe { $$=sin($3 * pi / var); printf(" Sine value of %d is %.10g\n",$3,$$); }
				| COS fbs expression fbe { $$=cos($3 *pi / var); printf(" Cos value of %d is %.10g\n",$3,$$); }
				| TAN fbs expression fbe { $$=tan($3 *pi / var); printf(" Tan value of %d is %.10g\n",$3,$$); }
				| LN fbs expression fbe { $$=log($3); printf(" ln value of %d is %.10g\n",$3,$$); }	

			    | expression FACTORIAL {
									int mult=1 ,i;
										for(i=$1;i>0;i--)
										{
											mult=mult*i;
										}
										$$=mult;
									printf("Factorial value of %d is %d\n",$1,$$); 
								 }	
				| expression PRIME {
									
									    int n, i, flag = 0;

									    for(i = 2; i < $1; ++i)
									    {
									        // condition for nonprime number
									        if($1%i == 0)
									        {
									            flag = 1;
									            break;
									        }
									    }

									    if ($1 == 1) 
									    {
									      printf("1 is neither a prime nor a composite number\n");
									    }
									    else 
									    {
									        if (flag == 0)
									          printf("%d is a prime number\n", $1);
									        else
									          printf("%d is not a prime number\n", $1);
									    }
									    
								 }	
				|expression ODDEVEN		{

										    if($1 % 2 == 0)
										        printf("%d is a even number\n", $1);
										    else
										        printf("%d is odd number\n", $1);

											}

				
				| expression TOPOWER expression			{
																$$ = pow($1,$3);
															    printf("\nPower value %d\n",$$); 
														}
				| expression LESSTHAN expression 		{$$ = $1 < $3;}
				| expression GREATERTHAN expression 	{$$ = $1 > $3;}
				| fbs expression fbe 					{$$ = $2;}
			
				;
			fbs: FBO
			;
			fbe: FBC
			;
			sbs: SBO
			;
			sbe: SBC
			;
		
			%%


			void enter(array *p, char *s, int n)
				{
				  p->str = s;
				  p->n = n;
				}

				int symboltable(char *key)
				{
				    int i = 1;
				    char *name = store[i].str;
				    while (name) {
				        if (strcmp(name, key) == 0)
				            return i;
				        name = store[++i].str;
				    }
				    return 0;
				}

				int symboltable2(char *key)
				{
				    int i = 1;
				    char *name = sym[i].str;
				    while (name) {
				        if (strcmp(name, key) == 0)
				            return i;
				        name = sym[++i].str;
				    }
				    return 0;
				}

			yyerror(char *s) /* called by yyparse on error */
			{
				printf("%s\n",s);
				return (0);
			}
