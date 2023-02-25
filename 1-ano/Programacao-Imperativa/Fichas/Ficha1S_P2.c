// Ficha 1 Parte 2 - Primeiros Programas
#include <stdio.h>

// 3. Programas Iterativos - Escrever programas
// a)
void quadrados (int contador)
{
    int i = 0;
    int j = 0;
    while (i < contador)
    {
        while (j < contador)
        {
            putchar('#');
            j += 1;
        }
        putchar('\n');
        i += 1;
    }
}