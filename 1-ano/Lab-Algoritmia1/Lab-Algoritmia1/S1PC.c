#include <stdio.h>
#include <stdlib.h>

// Problema C: Formatura
int comparar (const void * a, const void * b)
{
  return ( *(int*)a - *(int*)b );
}

int main()
{
    int s1 = 0, s2 = 0, s3 = 0;

    if (scanf("%d %d %d", &s1, &s2, &s3) == 3)
    {
        int alturas[3] = {s1,s2,s3};

        qsort(alturas, 3, sizeof(int), comparar);

        printf("%d %d %d\n", alturas[0], alturas[1], alturas[2]);
    }

    return 0;
}

