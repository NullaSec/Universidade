#include <stddef.h>
#include <stdio.h>
#include <string.h>

// Problema A: Mensagens semi-secretas
int main()
{
    char posicao[9], mensagem[1001];
    size_t i, j, t_pos, t_men;

    if (scanf("%s", posicao) != 1) return 1;
    if (scanf("%s", mensagem) != 1) return 1;

    // Tamanho posicao e mensagem
    t_pos = strlen(posicao);
    t_men = strlen(mensagem);

    for (i = 0; i < t_pos; i++)
    {
        int novapos = posicao[i] - '1';
        
        for (j = 0; j + novapos < t_men; j += t_pos)
        {
            printf("%c",mensagem[novapos + j]);
        }
    }
    printf("\n");
    return 0;
}