%{
#include <stdio.h>
extern FILE *yyin;
%}

%%
[a-zA-Z][a-zA-Z0-9]*$ { printf("Acepta: %s\n", yytext); } // \n { /* salto de linea*/; }
.* { printf("No acepta: %s\n", yytext); }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
    }
    yylex();
    return 0;
}
