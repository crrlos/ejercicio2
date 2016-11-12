%{
	
 	#include "head.h"
    void yyerror(char *);
    int yylex(void);
    
%}

%token NUMBER
%start program
%%
	program
		:program expr  ';' {{printf("%s", $2? "verdadero": "falso");}}
		|
		;
	expr
		:NUMBER 
		|expr '>' expr {$$ = $1 > $3;}
		|expr '<' expr {$$ = $1 < $3;}
		|expr '=' expr {$$ = $1 == $3;}
		|expr "<=" expr {$$ = $1 <= $3;}
		|expr ">=" expr {$$ = $1 >= $3;}
		
		;
	
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
  exit(1);
}

