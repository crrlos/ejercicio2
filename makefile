bool: y.tab.c lex.yy.c main.c head.h
	gcc y.tab.c lex.yy.c main.c -o bool
	
y.tab.c: bool.y
	yacc -d bool.y -o y.tab.c
	
lex.yy.c: bool.l
	lex bool.l
	
clean:
	rm bool
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h