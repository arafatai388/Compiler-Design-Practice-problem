%{
#include<stdio.h>
%}

%%

"//".*              { }

"/*"(.|\n)*"*/"     { }

[ \t\n]+            { printf(" "); }

.                   { printf("%s", yytext); }

%%

int main()
{
    freopen("input1.txt","r",stdin);
    freopen("output.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}