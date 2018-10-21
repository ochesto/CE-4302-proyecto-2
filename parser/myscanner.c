#include <stdio.h>


extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "lw"};

int main(void) 
{

	int ntoken, vtoken;

	ntoken = yylex();
	while(ntoken) {
		printf("%d\n", ntoken);
		vtoken = yylex();
		switch (ntoken) {
		case INSTRUCCION:
		case OPERANDO:
		/*case INSTRUCCION:
			if(vtoken != IDENTIFIER) {
				printf("Syntax error in line %d, Expected an identifier but found %s\n", yylineno, yytext);
				return 1;
			}
			printf("%s is set to %s\n", names[ntoken], yytext);
			break;
		case PORT:
			if(vtoken != INTEGER) {
				printf("Syntax error in line %d, Expected an integer but found %s\n", yylineno, yytext);
				return 1;
			}
			printf("%s is set to %s\n", names[ntoken], yytext);
			break;
			*/
		default:
			
		}
		ntoken = yylex();
	}
	return 0;
}
