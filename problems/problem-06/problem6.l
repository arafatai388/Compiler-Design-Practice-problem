%{
#include<stdio.h>
%}

%%

\".*\"          { printf("%s : STRING\n", yytext); }

\'.\'           { printf("%s : CHARACTER\n", yytext); }

\".*            { printf("ERROR : Unterminated String\n"); }

[ \t\n]+        { }

.               { }

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