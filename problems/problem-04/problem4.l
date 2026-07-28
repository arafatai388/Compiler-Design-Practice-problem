%{
#include<stdio.h>
#include<string.h>
%}

%%

int|float|char|double|if|else|for|while|return      { printf("%s : KEYWORD\n", yytext); }

[0-9]+                                               { printf("%s : NUMBER\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*                               {
                                                        if(strlen(yytext)>31)
                                                            printf("%s : IDENTIFIER (ERROR: Too Long)\n", yytext);
                                                        else
                                                            printf("%s : IDENTIFIER\n", yytext);
                                                     }

"=="|"!="|">="|"<="|"="|">"|"<"|"+"|"-"|"*"|"/"|"%"  { printf("%s : OPERATOR\n", yytext); }

";"|","|"("|")"|"{"|"}"|"["|"]"                      { printf("%s : PUNCTUATION\n", yytext); }

[ \t\n]+                                             { }

.                                                    { }

%%

int main()
{
    freopen("input4.txt","r",stdin);
    freopen("output4.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}