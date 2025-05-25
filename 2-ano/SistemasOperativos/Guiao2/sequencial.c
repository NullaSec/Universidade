#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>  // importante para o wait macros

int main() {
    pid_t pid;
    int i, status;

    for (i = 1; i <= 10; i++) {
        pid = fork();

        if (pid == 0) {
            printf("Eu sou o filho %d, o meu pai é %d.\n", getpid(), getppid());
            _exit(i); 

        } else {
            wait(&status);
            if (WIFEXITED(status)) {
                int codigo = WEXITSTATUS(status);
                printf("Filho terminou com código de saída: %d\n\n", codigo);
            }
        }
    }

    return 0;
}
