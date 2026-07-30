%{
#include "problem23.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[0-9]+              { yylval.num = atoi(yytext); return NUMBER; }

[a-zA-Z][a-zA-Z0-9]* {
    strcpy(yylval.id, yytext);
    return ID;
}

"+"                 return '+';
"-"                 return '-';
"*"                 return '*';
"/"                 return '/';
"="                 return '=';
";"                 return ';';
"("                 return '(';
")"                 return ')';

[ \t\n]+            ;

.                   ;

%%

int yywrap()
{
    return 1;
}