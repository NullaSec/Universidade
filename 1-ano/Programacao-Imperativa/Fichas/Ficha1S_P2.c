// Ficha 1 Parte 2 - Primeiros Programas
#include <stdio.h>

// 3. Programas Iterativos - Escrever programas
// a)
void quadrado (int n)
{
    int i, j;

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            putchar('#');
        }
        putchar('\n');
    }
}

// b)
void xadrez (int n)
{
    int i;

    for (i = 0; i < n; i++)
    {
        if (i % 2 == 0){printf("#_#_#");}
        else {printf("_#_#_");}

        putchar('\n');
    }
}

// c)
void triangulo1 (int n) // Vertical
{
    int i, j, x, y, k = 1;

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < k; j++)
        {
            putchar('#');
        }
        putchar('\n');
        k++;
    }

    for (i = 0; i < n; i++)
    {
        for (x = 0; x < y - 1; x++)
        {
            putchar('#');
        }
        putchar('\n');
        y--;
    }
}



int main()
{
    quadrado(5);
    xadrez(5);
    triangulo1(5);

    return 0;
}