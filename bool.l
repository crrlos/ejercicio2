%{
	#include "head.h"
    #include "y.tab.h"
    void yyerror(char *);
%}
ID [a-zA-Z_]+
NUMBER [0-9]+
%%
{NUMBER}	{yylval = atoi(yytext); return NUMBER;}
[;=<>()_/*-]			return *yytext;
[ \t\n]		;
. ;
%%
int yywrap(void) {
    return 1;
}
