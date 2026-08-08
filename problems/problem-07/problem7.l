%{
#include<stdio.h>
%}

%%

abb         { printf("%s : Pattern abb\n", yytext); }

(ab)*      { printf("%s : Pattern (ab)*\n", yytext); }

a*b+        { printf("%s : Pattern a*b+\n", yytext); }

a*         { printf("%s : Pattern a*\n", yytext); }

[ \t\n]+    { }

[a-zA-Z]+   { printf("%s : No Match\n", yytext); }

%%

int main()
{
    freopen("input7.txt","r",stdin);
    freopen("output7.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}