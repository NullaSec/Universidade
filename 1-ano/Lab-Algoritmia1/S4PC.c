#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    int N, i, X;
    if(scanf("%d", &N) != 1) abort();

    char conjunto[N][999], res[N];
    for (i = 0; i < N; i++)
    {
        fgets(conjunto[i], N, stdin); // fgets não funciona bem mas fiquei sem tempou
        X = conjunto[i][0];

        for (size_t j = 2; j < strlen(conjunto[i]); j++)
        {
            for (size_t k = 2; k < strlen(conjunto[i]); k++)
            {
                if (conjunto[i][j] != conjunto[i][k] && j != k && k - j <= X)
                {
                    res[i] = j;
                }
                else res[i] = -1;
            }
        }
        
    }

    for (i = 0; i < N; i++)
    {
        printf("%c\n", res[i]);
    }


    return 0;
}