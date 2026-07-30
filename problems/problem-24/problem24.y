%{
#include<stdio.h>
#include<string.h>

int yylex();
void yyerror(char *s);

struct
{
    char name[20];
    int value;
} symbol[100];

int count=0;

int search(char str[])
{
    int i;

    for(i=0;i<count;i++)
    {
        if(strcmp(symbol[i].name,str)==0)
            return i;
    }

    return -1;
}

void insert(char str[],int val)
{
    strcpy(symbol[count].name,str);
    symbol[count].value=val;
    count++;
}

%}

%union
{
    int num;
    char id[20];
}

%token <num> NUMBER
%token <id> ID

%type <num> expr

%left '+' '-'
%left '*' '/'

%%

program:

        program statement
      |
      ;

statement:

        ID '=' expr ';'
        {
            int pos=search($1);

            if(pos==-1)
                insert($1,$3);
            else
                symbol[pos].value=$3;

            printf("%s = %d\n",$1,$3);
        }

      | expr ';'
        {
            printf("Result = %d\n",$1);
        }

      | error ';'
        {
            printf("Syntax Error Found\n");
            yyerrok;
        }

      ;

expr:

        expr '+' expr { $$=$1+$3; }

      | expr '-' expr { $$=$1-$3; }

      | expr '*' expr { $$=$1*$3; }

      | expr '/' expr
        {
            if($3==0)
            {
                printf("Division by Zero\n");
                $$=0;
            }
            else
                $$=$1/$3;
        }

      | '(' expr ')' { $$=$2; }

      | NUMBER { $$=$1; }

      | ID
        {
            int pos=search($1);

            if(pos==-1)
                $$=0;
            else
                $$=symbol[pos].value;
        }

      ;

%%

int main()
{
    freopen("input24.txt","r",stdin);
    freopen("output24.txt","w",stdout);

    yyparse();

    return 0;
}

void yyerror(char *s)
{
}