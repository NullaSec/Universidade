#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int main(){
    pid_t meupid = getpid();     
    pid_t meupai = getppid();   

    printf("PID do processo atual: %d\n", meupid);
    printf("PID do processo pai: %d\n", meupai);

    return 0;
}

/*
    PID TTY          TIME CMD
   7803 pts/1    00:00:00 bash

    Isto é o que apareçe com "ps -p 7803", podemos ver que o pai
    é o terminal do computador devido ao identificador "bash"

*/