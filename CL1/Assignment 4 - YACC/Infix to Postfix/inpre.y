%{
	#include<stdio.h>
%}

%union{int dval;}
%type<dval>E
%token<dval>num
%left'+''-'
%left'*''/'

%%
S:E
E:num { printf("%d", $1);}
E:E'+'E
{printf("+");}
E:E'-'E
{printf("-");}
E:E'*'E
{printf("*");}
E:E'/'E 
{printf("/");}
%%

void yyerror (char *s)
{
printf("%s",s);
}


/*
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Infix to Postfix$ lex inpre.lbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Infix to Postfix$ yacc -d inpre.y
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Infix to Postfix$ cc lex.yy.c y.tab.c -ll -ly
inpre.y:24:6: warning: conflicting types for ‘yyerror’ [enabled by default]
 void yyerror (char *s)
      ^
y.tab.c:1281:7: note: previous implicit declaration of ‘yyerror’ was here
       yyerror (YY_("syntax error"));
       ^
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Infix to Postfix$ ./a.out245/8*6+3
2458/6*3+bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/Infix to Postfix$ 

*/
