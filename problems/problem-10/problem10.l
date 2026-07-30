%{
#include<stdio.h>
#include<string.h>

char name[100][30];
char value[100][30];
int count = 0;
%}

%%

"#define"[ \t]+[a-zA-Z_][a-zA-Z0-9_]*[ \t]+[^\n]+ {
    sscanf(yytext,"#define %s %s",name[count],value[count]);
    count++;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    int i, found = 0;

    for(i=0;i<count;i++)
    {
        if(strcmp(yytext,name[i])==0)
        {
            printf("%s",value[i]);
            found = 1;
            break;
        }
    }

    if(!found)
        printf("%s",yytext);
}

\n {
    printf("\n");
}

[ \t]+ {
    printf("%s",yytext);
}

. {
    printf("%s",yytext);
}

%%

int main()
{
    freopen("input10.txt","r",stdin);
    freopen("output10.txt","w",stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}