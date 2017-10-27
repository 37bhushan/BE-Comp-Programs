%{
#include<stdio.h>
#include<stdlib.h>
 
%}

%token A B

%%

S: E ;

E: A E B | A B ;

%%

int main()
{
  yyparse();
  printf("\nValid String \n" );  
  return 0;
}


bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ lex anbn.lbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ yacc -d anbn.ybhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ cc lex.yy.c y.tab.c -ll -ly
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ ./a.outaaabbb

Valid String 
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ ./a.out
aab
Invalid Stringbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-YACC/A^nB^n$ 