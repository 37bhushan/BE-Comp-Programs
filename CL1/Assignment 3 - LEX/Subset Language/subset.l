
/*
ASSIGNMENT NO:
TITLE:
NAME: 
CLASS:BE-B
BATCH:B3
ROLL NO:
*/


%{
#include<stdio.h>
FILE *fp;
int pre=0,sys=0,fun=0,key=0;
%}

pre #.*
sp " "
eol "\n"
sys_call main"(".*")"|clrscr"()"|getch"(".*")"
user_fun_call [a-zA-Z][a-zA-Z0-9]*"(".*");"
keyword [if|else|int|char|do|while|switch|void|boolean]

%%
{pre} {pre++;}

{sys_call} {sys++;}

{user_fun_call} {fun++;}

{keyword} {key++;}

%%
int main(int argc, char argv[])
{
	fp=fopen("lex.yy.c","r");
	yyin=fp;
	yylex();
	printf("\nPreProcessor Directives Count = %d",pre);
	printf("\nSystem Call Count = %d",sys);
	printf("\nUser Functions Count = %d",fun);
	printf("\nKeywords Count = %d",key);
	return 0;
}









/*
------------------OUTPUT------------------
prjlab@prjlab-HP-202-G1-MT:~$ lex subset.l
prjlab@prjlab-HP-202-G1-MT:~$ cc lex.yy.c -ll -ly
prjlab@prjlab-HP-202-G1-MT:~$ ./a.out

PreProcessor Directives Count = 211
System Call Count = 1
User Functions Count = 72
Keywords Count = 15194
prjlab@prjlab-HP-202-G1-MT:~$ 
*/

