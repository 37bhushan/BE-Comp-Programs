%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	
	char add(char,char,char);
	int search(char);
	
	struct node{
		char op;	//operator1
		char op1;	//arg 1
		char op2;	// arg 2
		char res;	// result
	}code[20];

	int index1 = 0;
%}

%union{char p;}

%token<p> Letter;
%token<p> Digit;
%type<p> expr
%left '+' '-'
%left '*' '/'

%%

stat:	Letter '=' expr ';'	{add((char)$1,(char)$3,'=');}
	| expr ';'
	;
expr:	expr '+' expr {$$=add((char)$1,(char)$3,'+');}	
	| expr '-' expr {$$=add((char)$1,(char)$3,'-');}
	| expr '*' expr {$$=add((char)$1,(char)$3,'*');}
	| expr '/' expr {$$=add((char)$1,(char)$3,'/');}
	| '('expr')' {$$=(char)$2;}
	| Digit {$$=(char)$1;}
	| Letter {$$=(char)$1;}
	;

%%

int yywrap()
{
	return 1;
}

yyerror(char *stat)
{
 printf("\nError %s\n",stat);
}


char temp = 'A';

char add(char op1, char op2, char op)
{
	temp ++;
	code[index1].op1 = op1;
	code[index1].op2 = op2;
	code[index1].op = op;
	code[index1].res = temp;
	index1 ++;
	return temp;
}

void threeAdd()
{
	int cnt = 0;
	char temp = 'A';
	temp ++;
	printf("Three Address Code is-\n");
	while(cnt<index1)
	{
		printf("%c:\t %c\t %c\t %c\t",temp,code[cnt].op1,code[cnt].op,code[cnt].op2);
		temp ++;
		cnt ++;
		printf("\n");
	}	
}

void quadruple()
{
	int cnt = 0;
	char temp = 'A';
	temp ++;
	printf("Quadruple form is -\n");
	while(cnt < index1)
	{
		printf("%c\t %c\t %c\t %c\t",code[cnt].op, code[cnt].op1, code[cnt].op2, code[cnt].res);
		cnt ++;
		temp ++;	
		printf("\n");
	}
}


void triple()
{
	int cnt = 0;
	char temp = 'A';
	int flag;
	temp ++;
	printf("triple form is -\n");
	while(cnt<index1)
	{
		if(isalpha(code[cnt].op1) && isupper(code[cnt].op1) )
		{
			flag = search(code[cnt].op1);
			printf("%d\t",flag);			
		}
		else if( isalpha(code[cnt].op1))
		{
			printf("%c\t",code[cnt].op1);
		}
		else 	
		{
			printf("%c\t",temp);
		}

		if(isalpha(code[cnt].op2) && isupper(code[cnt].op2) )
		{
			flag = search(code[cnt].op2);
			printf("%d\t",flag);			
		}
		else if( isalpha(code[cnt].op2))
		{
			printf("%c\t",code[cnt].op2);
		}
		else 	
		{
			printf("%c\t",temp);
			printf("%c\t",code[cnt].op);
			printf("\n");
			cnt ++;
			//temp ++;
		}
	}
}

int search(char find)
{
	int i;
	for(i =0;i<index1;i++)
	{
		if(code[i].res == find)
		{
			return(i);
		}
	}
	return 0;
}





int main()
{
	printf("Enter the Expression\n");
	yyparse();
	threeAdd();
	quadruple();
	triple();	
	return 0;
}















