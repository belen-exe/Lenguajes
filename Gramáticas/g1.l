%{
#include <stdio.h>
#include <string.h>

// S -> 0S0 | 1S1 | 0 | 1
int pg(const char *ca) 
{
    int len = strlen(ca);
    
    if (strcmp(ca, "S") == 0) return 1;
    
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
        printf("Acepta\n");
    else
        printf("No acepta\n");
}
%%

int main(void) 
{
    char *prue[] = 
    {
        "S",
        "0",
        "1",
        "101",
        "00100",
        "#/",
        "S",
        "100101001",
        "101",
        "0110",
        "abc"
    };

    int n = sizeof(prue) / sizeof(prue[0]);

    for (int i = 0; i < n; i++) {
        YY_BUFFER_STATE buffer = yy_scan_string(prue[i]);
        yylex();
        yy_delete_buffer(buffer);
    }
    return 0;
}

