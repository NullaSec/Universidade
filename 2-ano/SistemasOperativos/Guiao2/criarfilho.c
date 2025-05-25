#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

int main(){
    pid_t pid;

    if ((pid = fork()) == 0){
        printf("Olá! Sou o filho com o pid %d, o meu pai é %d. \n", getpid(), getppid());
    }
    else{
        printf("Eu sou o pai. O meu pid é %d e o do meu pai é %d\n", getpid(), getppid());
        printf("O meu filho tem o pid %d.\n", pid);
    }

}