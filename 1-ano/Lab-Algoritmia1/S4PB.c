#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Problema B: Repetições Épicas
int main()
{
    int N, i;
    
    if (scanf("%d", &N) != 1) abort();

    char letras[N][999], iguais[N];
    for (i = 0; i < N; i++)
    {
        if (scanf("%s", letras[i]) != 1) abort();

        for (size_t j = 0; j < strlen(letras[i]); j++)
        {
            for (size_t k = 0; k < strlen(letras[i]); k++)
            {
                if (letras[i][j] == letras[i][k] && j != k)
                {
                    iguais[i] = letras[i][j];
                }
            }
        }
    }

    for (i = 0; i < N; i++)
    {
        printf("%c", iguais[i]);
    }
    putchar('\n');

    return 0;
}