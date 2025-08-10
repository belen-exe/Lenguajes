/* simplest version of calculator */
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}
/* declare tokens */
%union {
    int num;
}

%token <num> NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%type <num> exp factor term

%%
calclist:
      /* vacío */
 | calclist exp EOL   { printf("= %d (0x%X)\n", $2, $2); }
 | calclist EOL
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;
factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term
 	{
 	 if ($3 == 0) {
		 yyerror("División por cero");
		 $$ = 0;
	     } 
	     else {
		 $$ = $1 / $3;
	     }
 	}
 ;
term: NUMBER
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
;
%%
int main(int argc, char **argv)
{
 yyparse();
}
int yyerror(const char *s)
{
 fprintf(stderr, "error: %s\n", s);
}
