%{
#include <stdio.h>
%}

%%

/* Rules */

%%

int main()
{
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}