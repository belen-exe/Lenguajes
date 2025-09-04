%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *s);
int yylex(void);
extern FILE *yyin;
%}

%union {
    double fval;
}

%token <fval> NUM
%token SQRT
%type <fval> expr

%%

input:
      /* vacío */
    | input line
    ;

line:
      expr '\n'   { printf("= %lf\n", $1); }
    | '\n'        /* línea vacía */
    ;

expr:
      NUM               { $$ = $1; }
    | SQRT '(' expr ')' { $$ = sqrt($3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <archivo_entrada>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    yyparse();
    fclose(yyin);
    return 0;
}

