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
%token AND OR
%token EOL

%type <num> exp bitwise factor term

%left OR
%left AND
%left ADD SUB
%left MUL DIV
%right ABS
%%
calclist:
      /* vacío */
 | calclist exp EOL   { printf("= %d (0x%X)\n", $2, $2); 
    for(int i=31; i>=0; i--){
      if(i%4==3 && i!=31) printf(" ");
      printf("%d", ($2 >> i) & 1);
    }
    printf(")\n");
  }
 | calclist EOL
 ;

exp: bitwise
 ;

bitwise: factor
 | bitwise OR factor   { $$ = $1 | $3; }
 | bitwise AND factor  { $$ = $1 & $3; }
 ;
factor: term
 | factor ADD term { $$ = $1 + $3; }
 | factor SUB term { $$ = $1 - $3; }
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
 | ABS term ABS { $$ = $2 >= 0 ? $2 : -$2; }
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
