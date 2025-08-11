%{
#include "ejer2.tab.h" 
#include <stdlib.h>  
#include <stdio.h>
%}
%%
0[xX][a-fA-F0-9]+ { yylval.num = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+ { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
\n  { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }
%%

int yywrap(void){return 1;}
