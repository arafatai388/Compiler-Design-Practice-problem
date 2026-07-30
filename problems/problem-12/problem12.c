#include <stdio.h>
#include <string.h>

char nfa[3][2][10];

int main()
{
    int i;

    freopen("input12.txt","r",stdin);
    freopen("output12.txt","w",stdout);

    // Read NFA
    for(i=0;i<3;i++)
    {
        scanf("%s %s", nfa[i][0], nfa[i][1]);
    }

    printf("NFA Transition Table\n\n");
    printf("State\t a\t b\n");

    printf("A\t %s\t %s\n", nfa[0][0], nfa[0][1]);
    printf("B\t %s\t %s\n", nfa[1][0], nfa[1][1]);
    printf("C\t %s\t %s\n", nfa[2][0], nfa[2][1]);

    printf("\nEquivalent DFA Transition Table\n\n");
    printf("State\t a\t b\n");

    // {A}
    printf("A\t %s\t %s\n", nfa[0][0], nfa[0][1]);

    // {AB}
    printf("AB\t %s%s\t %s%s\n",
           nfa[0][0], nfa[1][0],
           nfa[0][1], nfa[1][1]);

    // {AC}
    printf("AC\t %s%s\t %s%s\n",
           nfa[0][0], nfa[2][0],
           nfa[0][1], nfa[2][1]);

    // {BC}
    printf("BC\t %s%s\t %s%s\n",
           nfa[1][0], nfa[2][0],
           nfa[1][1], nfa[2][1]);

    // {ABC}
    printf("ABC\t %s%s%s\t %s%s%s\n",
           nfa[0][0], nfa[1][0], nfa[2][0],
           nfa[0][1], nfa[1][1], nfa[2][1]);

    return 0;
}