#include<stdio.h>
#include<string.h>

#define MAX_STATES 10
#define MAX_SYMBOLS 5

int nfa[MAX_STATES][MAX_SYMBOLS][MAX_STATES];
int nfa_count[MAX_STATES][MAX_SYMBOLS];

int dfa[MAX_STATES * MAX_STATES][MAX_SYMBOLS];

int dfa_states[MAX_STATES * MAX_STATES][MAX_STATES];
int dfa_size[MAX_STATES * MAX_STATES];

int dfa_count = 0;

int states;
int symbols;

char alphabet[MAX_SYMBOLS];

int same_set(int a[], int sizeA, int b[], int sizeB)
{
    int i, j, found;

    if(sizeA != sizeB)
        return 0;

    for(i=0; i<sizeA; i++)
    {
        found = 0;

        for(j=0; j<sizeB; j++)
        {
            if(a[i] == b[j])
            {
                found = 1;
                break;
            }
        }

        if(!found)
            return 0;
    }

    return 1;
}

int find_dfa_state(int state[], int size)
{
    int i;

    for(i=0; i<dfa_count; i++)
    {
        if(same_set(state, size,
                    dfa_states[i], dfa_size[i]))
        {
            return i;
        }
    }

    return -1;
}

void add_state(int state[], int size)
{
    int i;

    dfa_size[dfa_count] = size;

    for(i=0; i<size; i++)
    {
        dfa_states[dfa_count][i] = state[i];
    }

    dfa_count++;
}

int contains(int state[], int size, int value)
{
    int i;

    for(i=0; i<size; i++)
    {
        if(state[i] == value)
            return 1;
    }

    return 0;
}

void sort_set(int state[], int size)
{
    int i, j, temp;

    for(i=0; i<size-1; i++)
    {
        for(j=i+1; j<size; j++)
        {
            if(state[i] > state[j])
            {
                temp = state[i];
                state[i] = state[j];
                state[j] = temp;
            }
        }
    }
}

void print_set(int state[], int size)
{
    int i;

    printf("{");

    for(i=0; i<size; i++)
    {
        printf("q%d", state[i]);

        if(i < size-1)
            printf(",");
    }

    printf("}");
}

int main()
{
    int i, j, k;
    int count;
    int destination;
    int current[MAX_STATES];
    int current_size;
    int new_state[MAX_STATES];
    int new_size;
    int found;

    freopen("input12.txt","r",stdin);
    freopen("output12.txt","w",stdout);

    scanf("%d", &states);
    scanf("%d", &symbols);

    for(i=0; i<symbols; i++)
        scanf(" %c", &alphabet[i]);

    for(i=0; i<states; i++)
    {
        for(j=0; j<symbols; j++)
        {
            scanf("%d", &count);

            nfa_count[i][j] = count;

            for(k=0; k<count; k++)
            {
                scanf("%d", &destination);
                nfa[i][j][k] = destination;
            }
        }
    }

    /* Initial DFA state = {q0} */

    dfa_size[0] = 1;
    dfa_states[0][0] = 0;
    dfa_count = 1;

    /* Subset Construction */

    for(i=0; i<dfa_count; i++)
    {
        current_size = dfa_size[i];

        for(k=0; k<current_size; k++)
            current[k] = dfa_states[i][k];

        for(j=0; j<symbols; j++)
        {
            new_size = 0;

            for(k=0; k<current_size; k++)
            {
                int state = current[k];

                for(count=0;
                    count<nfa_count[state][j];
                    count++)
                {
                    destination = nfa[state][j][count];

                    if(!contains(new_state,
                                 new_size,
                                 destination))
                    {
                        new_state[new_size] = destination;
                        new_size++;
                    }
                }
            }

            sort_set(new_state, new_size);

            if(new_size == 0)
            {
                dfa[i][j] = -1;
            }
            else
            {
                found = find_dfa_state(new_state, new_size);

                if(found == -1)
                {
                    add_state(new_state, new_size);
                    found = dfa_count - 1;
                }

                dfa[i][j] = found;
            }
        }
    }

    /* Print NFA Transition Table */

    printf("NFA Transition Table\n\n");

    printf("State\t");

    for(i=0; i<symbols; i++)
        printf("%c\t", alphabet[i]);

    printf("\n");

    for(i=0; i<states; i++)
    {
        printf("q%d\t", i);

        for(j=0; j<symbols; j++)
        {
            if(nfa_count[i][j] == 0)
            {
                printf("-\t");
            }
            else
            {
                printf("{");

                for(k=0; k<nfa_count[i][j]; k++)
                {
                    printf("q%d", nfa[i][j][k]);

                    if(k < nfa_count[i][j]-1)
                        printf(",");
                }

                printf("}\t");
            }
        }

        printf("\n");
    }

    /* Print DFA Transition Table */

    printf("\nEquivalent DFA Transition Table\n\n");

    printf("DFA State\t");

    for(i=0; i<symbols; i++)
        printf("%c\t\t", alphabet[i]);

    printf("\n");

    for(i=0; i<dfa_count; i++)
    {
        printf("D%d = ", i);

        print_set(dfa_states[i], dfa_size[i]);

        printf("\t");

        for(j=0; j<symbols; j++)
        {
            if(dfa[i][j] == -1)
            {
                printf("{}\t\t");
            }
            else
            {
                printf("D%d = ", dfa[i][j]);

                print_set(
                    dfa_states[dfa[i][j]],
                    dfa_size[dfa[i][j]]
                );

                printf("\t");
            }
        }

        printf("\n");
    }

    return 0;
}