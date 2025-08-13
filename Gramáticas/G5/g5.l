%{
#include <stdio.h>
#include <string.h>

// S -> 0S0 | 1S1 | 0 | 1
int pg(const char *ca) 
{
    int len = strlen(ca);
    
    if (len == 2) {
        
        int vb = 0;
	return (ca[0] == 'b' || ca[0]=='a');
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
        printf("Acepta");
    else
        printf("No acepta");
}
%%

int main(void) 
{
    yylex();
    return 0;
}

