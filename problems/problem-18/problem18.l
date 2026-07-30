%{
#include<stdio.h>
#include<string.h>

char symbol[100][50];
int count = 0;
int declare = 0;

int search(char str[])
{
    int i;

    for(i=0; i<count; i++)
    {
        if(strcmp(symbol[i], str) == 0)
            return 1;
    }

    return 0;
}

void insert(char str[])
{
    strcpy(symbol[count], str);
    count++;
}

%}

%%

int|float|char|double  {
    declare = 1;
    printf("%s : KEYWORD\n", yytext);
}

if|else|for|while|return  {
    printf("%s : KEYWORD\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    if(declare)
    {
        if(search(yytext))
            printf("%s : Duplicate Declaration\n", yytext);

        else
        {
            insert(yytext);
            printf("%s : Inserted into Symbol Table\n", yytext);
        }

        declare = 0;
    }
    else
    {
        if(search(yytext))
            printf("%s : Used\n", yytext);
        else
            printf("%s : Undeclared Identifier\n", yytext);
    }
}

[0-9]+      { }

[ \t\n]+    { }

.           { }

%%

int main()
{
    freopen("input18.txt","r",stdin);
    freopen("output18.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}