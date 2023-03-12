#include <stdio.h>

// Problema C: Pedra Papel Tesoura
int main()
{
    int N, i = 0, v_inzel = 0, v_cmd = 0, empate = 0;
    if (scanf("%d", &N))
    {
        char inzel[N], cmd[N];
        while (i < N)
        {
            if (scanf(" %c %c", &inzel[i], &cmd[i]) == 2)
            {
                // printf("%d) I:%c A:%c\n", i + 1, inzel[i], cmd[i]);
                i++;
            }
        }
        
        for (i = 0; i < N; i++)
        {
            if ((inzel[i] == '@' && cmd[i] == '+')||
                (inzel[i] == '|' && cmd[i] == '*')||
                (inzel[i] == 'X' && cmd[i] == '-'))
                {v_inzel++;}

            if ((inzel[i] == '@' && cmd[i] == '-')||
                (inzel[i] == '|' && cmd[i] == '+')||
                (inzel[i] == 'X' && cmd[i] == '*'))
                {v_cmd++;}

            if ((inzel[i] == '@' && cmd[i] == '*')||
                (inzel[i] == '|' && cmd[i] == '-')||
                (inzel[i] == 'X' && cmd[i] == '+'))
                {empate++;}
        } 
    }
    printf("%d %d %d\n", v_inzel, v_cmd, empate);

    
    return 0;
}