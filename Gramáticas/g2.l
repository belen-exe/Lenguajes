%{
#include <stdio.h>
#include <string.h>

// S -> 0S0 | 1S1 | 0 | 1
int pg(const char *ca) 
{
    int len = strlen(ca);
    

    if (strcmp(ca, "S") == 0) return 1;
    if (strcmp(ca, "A") == 0) return 1;
    
    if (len == 1) {
        return (ca[0] == 'b');
    }
    
    int vb = 0;
    for (int i = 0; i < len; i++) {
        if (ca[i] == 'b') vb = 1;
        if (vb && ca[i] == 'a') return 0;
    }
    
    if (ca[0] == 'a' && ca[len - 1] == 'b'){
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
        "b",
        "abb",
        "aabbb",
        "ab",
        "abab",
        "S",
        "A",
        "$",
        "bba"
    };

    int n = sizeof(prue) / sizeof(prue[0]);

    for (int i = 0; i < n; i++) {
        YY_BUFFER_STATE buffer = yy_scan_string(prue[i]);
        yylex();
        yy_delete_buffer(buffer);
    }
    return 0;
}

