%{
	#include<stdio.h>
%}

%union{int dval;}
%type<dval>E
%token<dval>num
%left'+''-'
%left'*''/'

%%
S:E {printf("%d",$1);
E:num
E:E'+'E
{$$=$1+$3;}
E:E'-'E
{$$=$1-$3;}
E:E'*'E
{$$=$1*$3;}
E:E'/'E 
{$$=$1/$3;};
%%

void yyerror (char *s)
{
printf("%s",s);
}

/*
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Calculator$ lex calculator.l
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Calculator$ yacc -d calculator.y
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Calculator$ cc lex.yy.c y.tab.c -ll -ly
3+5/2-2
3bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Calculator$ 

*/
