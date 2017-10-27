%{

#include<stdio.h>
FILE *inputFilePointer;
int wordCount = 0, charCount = 0, specialSymbolCount = 0;
int digitCount = 0, lineCount = 0, spaceCount = 0;    

%}

word [a-zA-z]+
specialSymbol ['!'|'@'|'#'|'$'|'%'|'^'|'&'] 
digit [0-9]
line "\n"
space " "

%%

{word}  {
            wordCount++;
            charCount += yyleng;
        }
{specialSymbol} {specialSymbolCount++;}
{digit} {digitCount++;}
{line}  {lineCount++;}
{space} {spaceCount++;}

%%

int main()
{
    inputFilePointer = fopen("input.txt","r+");
    yyin = inputFilePointer;
    yylex();

    printf("Word Count - %d \n",wordCount);
    printf("Character Count - %d \n",charCount);
    printf("Special Symbol Count - %d \n",specialSymbolCount);    
    printf("Space Count - %d \n",spaceCount);
    printf("Digit Count - %d \n",digitCount);
    printf("Line Count - %d \n",lineCount);

    return 0;
}

