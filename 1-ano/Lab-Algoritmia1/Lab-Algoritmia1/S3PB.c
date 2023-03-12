#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Problema B: Códigos Numéricos
int main()
{
    int N, i, pos = 5;
    if (scanf("%d", &N) != 1) abort();

    char comandos[N][20];
    int posicao[N];
    for (i = 0; i < N; i++)
    {
        if (scanf("%s", comandos[i]) != 1) abort();

        size_t j;
        for (j = 0; j < strlen(comandos[i]); j++)
        {            
            if      (comandos[i][j] == 'C' && (pos < 7)) pos += 3;
            else if (comandos[i][j] == 'B' && (pos > 3)) pos -= 3;
            else if (comandos[i][j] == 'E' && (pos != 1 && pos != 4 && pos != 7)) pos--;
            else if (comandos[i][j] == 'D' && (pos != 3 && pos != 6 && pos != 9)) pos++;            
        }
        posicao[i] = pos;
    }
    for (i = 0; i < N; i++){printf("%d", posicao[i]);}
    printf("\n");

    return 0;
}