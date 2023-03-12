#include <stdio.h>

// Problema A: Navegação baralhada
int main()
{
    int N, j, i = 0, X = 0, Y = 0,
        C = 1, B = 2, E = 3, D = 4;
    
    if (scanf("%d", &N) == 1)
    {
        int cartas[N];

        while (i < N)
        {
            if (scanf("%d", &cartas[i]))
            {    
                i += 1;
            }
        }
        /*
        Cima     (1): (X, Y - 1)
        Baixo    (2): (X, Y + 1)
        Esquerda (3): (X - 1, Y)
        Direita  (4): (X + 1, Y)
        */
        int cimas[78];
        int baixos[78];
        int esquerdos[78];
        int direitos[78];
        
        for (i = 0; i < 78; i++) // Distribuir as 78 cartas por direção
        {
            direitos[i] = D;
            D += 4;

            esquerdos[i] = E;
            E += 4;

            cimas[i] = C;
            C += 4;

            baixos[i] = B;
            B += 4;
        }
        
        for (i = 0; i < N; i++) // Calcular coordenadas
        {
            for (j = 0; j < 78; j++)
            {
                if (cartas[i] == direitos[j]){X += 1;}
                if (cartas[i] == esquerdos[j]){X -= 1;}
                if (cartas[i] == cimas[j]){Y -= 1;}
                if (cartas[i] == baixos[j]){Y += 1;}
            }
        }

        printf("%d %d\n", X, Y);
    }
    
    return 0;
}