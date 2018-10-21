%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>

extern int yylex();
extern int yylineno;
extern char* yytext;

%}

%union {int num; char id;}         /* Yacc definitions */
%start line
%token INSTRUCCIONR
%token INSTRUCCIONI
%token INSTRUCCIONJ
%token INSTRUCCION
%token OPERANDO
%token COMMA
%token INMEDIATO
%token DIRECCION
%token SHIFT



%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : INSTRUCCIONR   OPERANDO COMMA OPERANDO COMMA OPERANDO 	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCIONR   OPERANDO COMMA OPERANDO COMMA OPERANDO 	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCIONR   OPERANDO COMMA OPERANDO COMMA SHIFT 	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCIONI   OPERANDO COMMA OPERANDO COMMA INMEDIATO 	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCIONI   OPERANDO COMMA OPERANDO COMMA DIRECCION 	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCIONJ   DIRECCION  	{printf("Line %d compiled \n", yylineno);}
		| line INSTRUCCION  {printf("Line %d compiled \n", yylineno);}
		| INSTRUCCIONI   OPERANDO COMMA OPERANDO COMMA INMEDIATO 	{printf("Line %d compiled \n", yylineno);}
		| INSTRUCCIONJ   DIRECCION  	{printf("Line %d compiled \n", yylineno);}
		| INSTRUCCIONR   OPERANDO COMMA OPERANDO COMMA SHIFT 	{printf("Line %d compiled \n", yylineno);}
		| INSTRUCCIONI   OPERANDO COMMA OPERANDO COMMA DIRECCION 	{printf("Line %d compiled \n", yylineno);}
		| INSTRUCCION 	{printf("Line %d compiled \n", yylineno);}

	

%%                     /* C code */


/* returns the value of a given symbol */


int main (void) {

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 