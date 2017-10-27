
%{
#include<stdio.h>
FILE *inputFIlePointer;
int systemFunctionCount=0,preprocessorDirectiveCount=0, specialSymbolCount =0, commentCount =0;
int identifierCount =0, keywordCount = 0, stringCount =0, userdefinedFunctionsCount =0, operatorCount =0;
%}

keyword int|char|boolean|short|long|void|if|else|while|do|for|switch|new|struct|union|static|final
identifier [a-zA-Z].[A-Za-z0-9]*
systemFunction  main"(".*")"|clrscr"()"|getch"(".*")"|printf"(".*")"|scanf"(".*")"|exit"(".*")"|return"(".*")"
preprocessorDirective #.*
string \"[0-9A-Za-z]*\"
specialSymbol ";"|","|"&"|"%"|"#"|"?"|"*"
comment "/*"[0-9A-Za-z ]*"*/"|"//"[0-9A-Za-z ]*
userdefinedFunctions [a-zA-Z][a-zA-Z0-9]*"(".*")" 
operator "+"|"-"|"*"|"/"|"="|"^"|"<"|">"|"||"|"&&"|"!"

%%
{systemFunction}	{printf("\n%s : System function recognized",yytext);systemFunctionCount++;}
{preprocessorDirective} 	{ printf("\n%s : Preprocessor directive recognized",yytext);preprocessorDirectiveCount++;}
"{"|"}" {printf("\n%s : Curly brace recognized",yytext);}
"("|")" {printf("\n%s : Round braces recognized",yytext);}
{keyword} {printf("\n%s : Keyword recognized",yytext); keywordCount++;}
{identifier}	{printf("\n%s : Identifier recognized",yytext);identifierCount++; }
{string}	{printf("\n%s : String recognized",yytext);stringCount++;}
{specialSymbol}	{printf("\n%s : Special symbol recognized",yytext);specialSymbolCount++;}
{comment}	{printf("\n%s : Comment recognized",yytext);commentCount++;}
{userdefinedFunctions}	{printf("\n%s : User function is recognized",yytext);userdefinedFunctionsCount++;}
{operator}	{printf("\n%s : Operator is recognized",yytext);operatorCount++;}
%%
int main()
{
	inputFIlePointer=fopen("example.c","r");
	yyin=inputFIlePointer;
	yylex();
	yywrap();


	printf("Printing Counts -\n");
	printf("System function Count - %d \n",systemFunctionCount);
	printf("Preprocessor Directive Count - %d \n",preprocessorDirectiveCount);
	printf("Keyword Count - %d \n",keywordCount);
	printf("Identifiers Count - %d \n",identifierCount);
	printf("Comment Count - %d \n",commentCount);
	printf("User Defined function Count - %d \n",userdefinedFunctionsCount);				
	printf("Operator Count - %d \n",operatorCount);
}



/*
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Subset Language$ lex language.lbhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Subset Language$ cc lex.yy.c -ll -ly
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Subset Language$ ./a.out

#include <stdio.h> : Preprocessor directive recognized


int : Keyword recognized 
main() : System function recognized

{ : Curly brace recognized
	
/ : Operator is recognized
* : Special symbol recognized
	
multiline : Identifier recognized 
comm : Identifier recognized
	
* : Special symbol recognized
/ : Operator is recognized
	
int : Keyword recognized 
a,b : Identifier recognized
, : Special symbol recognized
c; : Identifier recognized
	
c  : Identifier recognized
= : Operator is recognized 
a  : Identifier recognized
* : Special symbol recognized 
b; : Identifier recognized
	
printf("Hello Hi! Product = %d",c) : System function recognized
; : Special symbol recognized

} : Curly brace recognized


void : Keyword recognized 
func() : User function is recognized

{ : Curly brace recognized
	
//single line comm : Comment recognized
	
printf("User defined function") : System function recognized
; : Special symbol recognized

} : Curly brace recognized
Printing Counts -
System function Count - 3 
Preprocessor Directive Count - 1 
Keyword Count - 3 
Identifiers Count - 7 
Comment Count - 1 
User Defined function Count - 1 
Operator Count - 3 
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Subset Language$ 

*/

