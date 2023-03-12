#include <stdio.h>
#include <stdlib.h>

// Problema C: Invasão em fila indiana 
int main()
{
    int N, K, i, j, alturas;

    if (scanf("%d", &N) != 1) abort();

    for (i = 0; i < N; i++)
    {
        if (scanf("%d", &K) != 1) abort();

        int maior = 0, visivel = 0;
        for (j = 0; j < K; j++)
        {
            if (scanf("%d", &alturas) != 1) abort();
            if (alturas > maior)
            {
                maior = alturas;
                visivel++;
            }
        }

        printf("%d\n", visivel);
    }

    return 0;
}