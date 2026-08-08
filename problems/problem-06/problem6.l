%{
#include<stdio.h>
%}

%%

\"([^\"\\\n]|\\[nt\"\\])*\"       { printf("%s : STRING\n", yytext); }

\'([^\'\\\n]|\\[nt'\\])\'        { printf("%s : CHARACTER\n", yytext); }

\"([^\"\\\n]|\\[nt\"\\])*         { printf("ERROR : Unterminated String\n"); }

\'([^\'\\\n]|\\[nt'\\])            { printf("ERROR : Unterminated Character\n"); }

[ \t\n]+                           { }

.                                  { }

%%

int main()
{
    freopen("input6.txt","r",stdin);
    freopen("output6.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}