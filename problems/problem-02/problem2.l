%{
#include<stdio.h>

int word = 0;
int line = 0;
int ch = 0;

%}

%%

\n                  { line++; ch++; }

[ \t]+              { ch += yyleng; }

[^ \t\n]+           {word++;ch += yyleng;}

%%

int main()
{
    freopen("input2.txt", "r", stdin);
    freopen("output2.txt", "w", stdout);

    yylex();

    printf("Total Words      : %d\n", word);
    printf("Total Lines      : %d\n", line + 1);
    printf("Total Characters : %d\n", ch);

    return 0;
}

int yywrap()
{
    return 1;
}