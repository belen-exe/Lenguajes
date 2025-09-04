%{
#include "Ejer3.tab.h"
#include <math.h>
%}

%%

-?[0-9]+(\.[0-9]+)?   { yylval.fval = atof(yytext); return NUM; }
"sqrt"              { return SQRT; }
[ \t\r]+            ;   // ignorar espacios y tabulaciones
\n                  { return '\n'; }
.                   { return yytext[0]; }

%%

int yywrap() { return 1; }

