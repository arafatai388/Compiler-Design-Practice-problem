%{
#include<stdio.h>

int line = 1;
int column = 1;
%}

%%

int|float|char|double|if|else|for|while|return  { printf("%s : KEYWORD (Line %d, Column %d)\n", yytext, line, column); column += yyleng; }

[a-zA-Z_][a-zA-Z0-9_]*  { printf("%s : IDENTIFIER (Line %d, Column %d)\n", yytext, line, column); column += yyleng; }

[0-9]+  { printf("%s : NUMBER (Line %d, Column %d)\n", yytext, line, column); column += yyleng; }

"=="|"!="|">="|"<="|"="|">"|"<"|"+"|"-"|"*"|"/"|"%"  { printf("%s : OPERATOR (Line %d, Column %d)\n", yytext, line, column); column += yyleng; }

";"|","|"("|")"|"{"|"}"|"["|"]"  { printf("%s : PUNCTUATION (Line %d, Column %d)\n", yytext, line, column); column += yyleng; }

[ \t]+  { column += yyleng; }

\n  { line++; column = 1; }

.  { column += yyleng; }

%%

int main()
{
    freopen("input9.txt","r",stdin);
    freopen("output9.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}