#include <stdio.h>

// Problema B: Brincadeiras com elevadores
int main()
{
    int C, A, N, i = 0;

    if (scanf("%d", &C)) // Andar que começou
    {
    if (scanf("%d", &A)) // Número de andares
    {
    if (scanf("%d", &N)) // Nº de Comandos
    {
        int comandos[N];
        while (i < N)
        {
            if (scanf("%d", &comandos[i]))
            {    
                i++;
            }
        }

        for (i = 0; i < N; i++)
        {
            if (comandos[i] == 1 && C < A){C++;}
            if (comandos[i] == -1 && C > 0){C--;}
        }
    }
    }
    }
    printf("%d\n", C);

    return 0;
}