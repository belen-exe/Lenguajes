ejer2: ejer2.tab.c lex.yy.c
	cc -o $@ ejer2.tab.c lex.yy.c -lfl

ejer2.tab.c ejer2.tab.h: ejer2.y
	bison -d ejer2.y

lex.yy.c: ejer2.l ejer2.tab.h
	flex ejer2.l

clean:
	rm -f ejer2 ejer2.tab.c ejer2.tab.h lex.yy.c
