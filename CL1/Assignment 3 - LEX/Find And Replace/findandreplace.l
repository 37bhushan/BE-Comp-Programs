%{
    #include<stdio.h>
    #include<string.h>

    FILE *writeFilePointer, *readFilePointer;
    char array0[20], array1[20];
%}

word [a-zA-Z0-9]+
specialSymbol ['!'|'@'|'#'|'$'|'%'|'^'|'&'|'?']
endOfLine "\n"
whiteSpace " "

%%

{word}  {
            if(strcmp(array0,yytext)==0)
                fprintf(writeFilePointer,"%s",array1);
            else
                fprintf(writeFilePointer,"%s",yytext);
        }
{specialSymbol} {
                    if(strcmp(array0,yytext)==0)
                        fprintf(writeFilePointer,"%s",array1);
                    else
                        fprintf(writeFilePointer,"%s",yytext);
                }
{endOfLine} {
                fprintf(writeFilePointer,"%s",yytext);;               
            }
.   {fprintf(writeFilePointer,"%s",yytext);}
        
%%

int main()
{

    printf("Enter the Word to find");
    scanf("%s",array0);
    printf("Enter the Replacement Word");
    scanf("%s",array1);
    writeFilePointer = fopen("output.txt","w");
    readFilePointer = fopen("input.txt","r+");
    yyin = readFilePointer;
    yyout = writeFilePointer;
    yylex();
    return 0;
}




bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Find And Replace$ lex findandreplace.l
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Find And Replace$ cc lex.yy.c -ll -ly
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Find And Replace$ ./a.outEnter the Word to findhello
Enter the Replacement Wordworld
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Find And Replace$ ./a.out
Enter the Word to findHello
Enter the Replacement WordWorld
bhushan@ubuntu:~/Desktop/CL1 B58/Assignment-LEX/Find And Replace$ 


            

