%{

#include<stdio.h>
FILE *inputFilePointer;
int vowelCount = 0;

%}

vowel ['a'|'e'|'i'|'o'|'u'|'A'|'E'|'I'|'O'|'U']
word [a-zA-Z]+

%%

{vowel} { vowelCount++; }

%%

int main()
{
    inputFilePointer = fopen("input.txt","r");
    yyin = inputFilePointer;
    yylex();
    printf("\nVowel Count - %d \n",vowelCount);
    return 0;
}

bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Vowel Count$ lex vowelcount.l
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Vowel Count$ cc lex.yy.c -ll -lybhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Vowel Count$ ./a.outn
Vowel Count - 5 
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Vowel Count$ 