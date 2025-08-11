%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int chars = 0;
int words = 0;
int lines = 0;

clock_t start, end;
double cpu_time_used;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. { chars++; }
%%

int main(int argc, char **argv) {
    start = clock();

    yylex();

    end = clock();
    cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

    printf("%8d%8d%8d\n", lines, words, chars);
    printf("Tiempo de ejecución: %f segundos\n", cpu_time_used);

    return 0;
}

