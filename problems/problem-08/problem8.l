%{
#include<stdio.h>
%}

%%

"+*"|"=+"|"*+"|"/+"|"&+"|"|="  { printf("%s : INVALID OPERATOR\n", yytext); }

"=="|"!="|"<="|">="|"&&"|"||"|"++"|"--"|"+="|"-="|"*="|"/="|"+"|"-"|"*"|"/"|"="|"<"|">"  { printf("%s : VALID OPERATOR\n", yytext); }

[ \t\n]+  { }

.  { }

%%

int main()
{
    freopen("input8.txt","r",stdin);
    freopen("output8.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}