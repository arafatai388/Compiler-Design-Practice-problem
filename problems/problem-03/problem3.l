%{
#include<stdio.h>
%}

%%

int|float|char|double|if|else|for|while|return      { printf("%s : KEYWORD\n", yytext); }

[0-9]+                                               { printf("%s : NUMBER\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*                               { printf("%s : IDENTIFIER\n", yytext); }

"=="|"!="|">="|"<="|"="|">"|"<"|"+"|"-"|"*"|"/"|"%"  { printf("%s : OPERATOR\n", yytext); }

";"|","|"("|")"|"{"|"}"|"["|"]"                      { printf("%s : PUNCTUATION\n", yytext); }

[ \t\n]+                                             { }

.                                                    { }

%%

int main()
{
    freopen("input3.txt","r",stdin);
    freopen("output3.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}