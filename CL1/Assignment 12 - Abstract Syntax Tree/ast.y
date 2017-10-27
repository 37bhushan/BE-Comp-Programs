%{
	#include<stdlib.h>
	#include<stdio.h>
	#include<string.h>
	
	typedef struct node
	{
		struct	node *left;
		struct	node *right;
		char *token;
	}node;
	
	node *mknode(node *left, node *right, char *token);
	void printTree(node *tree);

	#define YYSTYPE struct node *
%}

%start lines	

%token NUMBER PLUS MINUS TIMES DIVIDE 
%token POWER 
%token LEFT_PARANTHESIS RIGHT_PARANTHESIS END

%left PLUS MINUS
%left TIMES DIVIDE
%right POWER

%%

lines : |
	lines line 

line :	exp END		{printTree($1);printf("\n");}
	;		

exp :	term 		{$$ = $1;}
	| exp PLUS exp	{$$ = mknode($1, $3, "+" );}
	| exp MINUS exp	{$$ = mknode($1, $3, "-" );}
	;

term:	factor			{$$ = $1;}
	| term TIMES factor	{$$ = mknode($1, $3, "*");}
	;

factor:	NUMBER		{$$ = mknode(0,0,(char *)yylval);}							
	| LEFT_PARANTHESIS exp RIGHT_PARANTHESIS	{$$ = $2;}
	;


%%


int main()
{
	yyparse();
	exit(0);
	return 0;
}


node *mknode(node *left, node *right, char *token)
{
	node *newNode = (node *)malloc(sizeof(node));
	char *newString = (char *)malloc(strlen(token)+1);
	strcpy(newString,token);
	newNode->left = left;
	newNode->right = right;
	newNode->token = newString;
	return (newNode);
}

void printTree(node *tree)
{
	if(tree->left || tree->right)
	{
		printf(" ( ");
	}

	printf(" %s ",tree->token);
	
	if(tree->left)
	{
		printTree(tree->left);
	}
	if(tree->right)
	{
		printTree(tree->right);
	}
	if(tree->left || tree->right)
	{
		printf(" ) ");
	}
}	

int yyerror(char *s)
{printf ("%s\n", s);}


	



























