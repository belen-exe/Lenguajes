%{
#include <stdio.h>
#include <string.h>

// S -> 0S0 | 1S1 | 0 | 1
int pg(const char *ca) 
{
    int len = strlen(ca);
    
    // Caso base: S -> 0 o S -> 1
    if (len == 1) {
        return (ca[0] == '0' || ca[0] == '1');
    }

    // Producción S -> 0 S 0
    if (ca[0] == '0' && ca[len - 1] == '0') {
        char sub[len - 1];
        strncpy(sub, ca + 1, len - 2);
        sub[len - 2] = '\0';
        return pg(sub);
    }

    // Producción S -> 1 S 1
    if (ca[0] == '1' && ca[len - 1] == '1') {
        char sub[len - 1];
        strncpy(sub, ca + 1, len - 2);
        sub[len - 2] = '\0';
        return pg(sub);
    }

    return 0;
}
%}

%%
.* {
    if (pg(yytext))
        printf("Acepta");
    else
        printf("No acepta");
}
%%

int main(int argc, char **argv) 
{
	yylex();
    return 0;
}

