%{
#include<stdio.h>
#include<stdlib.h>
%}

%token FOR INT VAR NUM OPR BREAK


%%
E1: FOR'('E')'  
;

E : INT VAR OPR NUM ';' VAR OPR NUM ';' VAR OPR 

 |  INT VAR OPR VAR ';' VAR OPR NUM ';' VAR OPR

 |  VAR OPR VAR ';' VAR OPR NUM ';' VAR OPR 
 
 |  VAR OPR VAR ';' VAR OPR VAR ';' VAR OPR 
 
 |  VAR OPR NUM ';' VAR OPR NUM ';' VAR OPR 
 
 |  VAR OPR NUM ';' VAR OPR VAR ';' VAR OPR 

;

%%

int main()
{
  

  yyparse();
   printf("\n\tValid For Loop Statement\n" );  
  return 0;
}

/*
bhushan@ubuntu:~/Desktop/CL1 B58/Intermediate Code Generation$ lex icg.l
bhushan@ubuntu:~/Desktop/CL1 B58/Intermediate Code Generation$ yacc -d icg.y
bhushan@ubuntu:~/Desktop/CL1 B58/Intermediate Code Generation$ cc lex.yy.c y.tab.c -ll -ly
icg.y: In function ‘threeaddress’:
icg.y:76:3: warning: zero-length gnu_printf format string [-Wformat-zero-length]
   printf("");
   ^
bhushan@ubuntu:~/Desktop/CL1 B58/Intermediate Code Generation$ ./a.out
 Enter The Expression : 
 2+3+8*8-3

Error syntax error

The three address code is: 
B:=	2	+	3	
C:=	8	*	8	
D:=	B	+	C	
E:=	D	-	3	

The quadruple format is: 
Operator	Arg1	Arg2	Result
+		2	3	B	
*		8	8	C	
+		B	C	D	
-		D	3	E	

The triple format is: 
Arg1	Arg2	Operator
B	B	+	
B	B	*	
0	1	+	
2	B	-	
bhushan@ubuntu:~/Desktop/CL1 B58/Intermediate Code Generation$ 








bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ lex for.lbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ yacc -d for.ybhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ cc lex.yy.c y.tab.c -ll -ly
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ ./a.out
for(int i=0;i<10;i++)
for(int i=0;i<10;i++)
	Valid For Loop Statement
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ ./a.out
for(int i=n;i<n+50;i++)
for(int i=n;i<n
	syntax errorbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ ./a.out
for(int i=0;i>10 i++)     
for(int i=0;i>10 i
	syntax errorbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/For loop$ 




*/
