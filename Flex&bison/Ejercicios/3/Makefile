ejer3: ejer3.tab.c lex.yy.c
        cc -o $@ ejer3.tab.c lex.yy.c -lfl

ejer3.tab.c ejer3.tab.h: ejer3.y
        bison -d ejer3.y

lex.yy.c: ejer3.l ejer3.tab.h
        flex ejer3.l

clean:
        rm -f ejer3 ejer3.tab.c ejer3.tab.h lex.yy.c
