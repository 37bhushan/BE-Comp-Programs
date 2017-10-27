%{

#include "y.tab.h"
#include<stdio.h>

%}

%%

[\t ]+ {printf("%s",yytext);}

[aA] {return A ; }

[bB] {return B ; }

\n return 0;

%%

int yywrap()
{
  return 1;
}

void yyerror()
{
  printf("Invalid String");
  exit(0);
}
