#include <stdio.h>

// Problema B: Haja ordem!
int  main()
{
    int s1 = 0, s2 = 0, s3 = 0;
    if (scanf("%d %d %d", &s1, &s2, &s3) == 3)
    {

        int alturas[3] = {s1,s2,s3};

        if (((alturas[0] <= alturas[1]) && (alturas[1] <= alturas[2])) ||
            ((alturas[0] >= alturas[1]) && (alturas[1] >= alturas[2])) ||
            ((alturas[0] == alturas[1]) && (alturas[1] == alturas[2])))
        {
            printf("OK\n");
        }
        else 
        {
            printf("NAO\n");
        }
    }

    return 0;
}