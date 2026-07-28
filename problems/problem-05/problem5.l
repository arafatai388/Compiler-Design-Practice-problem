%{
#include<stdio.h>
%}

%%

[0-9]+"."[0-9]+"."[0-9]+      {
                                printf("%s : INVALID NUMBER\n", yytext);
                              }

[0-9]+"."[0-9]+([eE][+-]?[0-9]+)? {
                                    printf("%s : FLOAT\n", yytext);
                                  }

[0-9]+([eE][+-]?[0-9]+) {
                            printf("%s : FLOAT\n", yytext);
                        }

[0-9]+ {
            printf("%s : INTEGER\n", yytext);
        }

[ \t\n]+ { }

. { }

%%

int main()
{
    freopen("input5.txt","r",stdin);
    freopen("output5.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}