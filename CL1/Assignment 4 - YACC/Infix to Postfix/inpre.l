%{
#include "y.tab.h"
%}

%%
[0-9]+ {yylval.dval=atoi(yytext);
return num;}
.	{ return yytext[0];}
\n return 0;
%%

int yywrap(void)
{
return 1;
}

int main()
{
	yyparse();	
	return 0;
}
