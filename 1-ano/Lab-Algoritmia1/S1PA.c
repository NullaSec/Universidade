#include <stdio.h>

// Problema A: Biscoitos ou Morte!
int main() {
  /* Gosto mais desta solução mas não compila no Mooshak
     embora funcione bem no meu PC (já tentei resolver o problema).

   int quantidade[5], k, i;
   k = 0;

   for (i = 0; i < 5; i++)
   {
       printf("Biscoitos do soldado %d: ", i + 1);
       scanf("%d", &quantidade[i]);
   }

   for (i = 1; i < 5; i++) // Valor mais alto
   {
       if (quantidade[k] < quantidade[i])
       {
           k = i;
       }
   }

   printf("%d\n", k + 1); */

    int s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0, i, k = 0;

    if (scanf("%d %d %d %d %d", &s1, &s2, &s3, &s4, &s5) == 5)
    {
        int lista[5] = {s1, s2, s3, s4, s5};

        for (i = 1; i < 5; i++) 
        {
            if (lista[k] < lista[i]) 
            {
                k = i;
            }
        }
    }
    printf("%d\n", k + 1);

    return 0;
}
