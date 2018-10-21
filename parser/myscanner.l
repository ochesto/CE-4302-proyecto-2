%{
#include "y.tab.h"
extern int yylex();
extern int yylineno;
extern char* yytext;

int yylex();
%}


%option nounput yylineno

%%
"add"			{return INSTRUCCIONR;}
"addv"			{return INSTRUCCIONR;}
"sub"			{return INSTRUCCIONR;}
"subv"			{return INSTRUCCIONR;}
"xor"			{return INSTRUCCIONR;}
"xorv"			{return INSTRUCCIONR;}

"lw"			{return INSTRUCCIONR;}
"sw"			{return INSTRUCCIONR;}
"lwv"			{return INSTRUCCIONR;}
"swv"			{return INSTRUCCIONR;}
"mult"			{return INSTRUCCIONR;}

"addi"			{return INSTRUCCIONI;}
"subi"			{return INSTRUCCIONI;}
"xori"			{return INSTRUCCIONI;}


"beq"			{return INSTRUCCIONI;}

"move"			{return INSTRUCCIONI;}
"j" 			{return INSTRUCCIONJ;}

"slv"			{return INSTRUCCIONR;}
"srv"			{return INSTRUCCIONR;}
"sclv"			{return INSTRUCCIONR;}
"scrv"			{return INSTRUCCIONR;}
"nop"			{return INSTRUCCION;}

"$t0"			{return OPERANDO;}
"$t1"			{return OPERANDO;}
"$t2"			{return OPERANDO;}
"$t3"			{return OPERANDO;}
"$t4"			{return OPERANDO;}
"$t5"			{return OPERANDO;}
"$t6"			{return OPERANDO;}
"$t7"			{return OPERANDO;}


"$s0"			{return OPERANDO;}
"$s1"			{return OPERANDO;}
"$s2"			{return OPERANDO;}
"$s3"			{return OPERANDO;}
"$s4"			{return OPERANDO;}
"$s5"			{return OPERANDO;}
"$s6"			{return OPERANDO;}
"$s7"			{return OPERANDO;}
[ \t\n]					;
,				{return COMMA;}

[0-7]		{return SHIFT;}
[1-9][0-9]* {return INMEDIATO;}



[$][1-9][0-9]* {return DIRECCION;}

. 					{printf("Syntax error in line %d,  %s is not correct\n", yylineno, yytext);}

%%

int yywrap(void)
{
	return 1;
}

