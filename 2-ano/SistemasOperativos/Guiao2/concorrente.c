#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>

int main() {
    pid_t pid, pid_terminado;
    int i, status, codigo;

    for (i = 1; i <= 10; i++) {
        pid = fork();

        if (pid == 0) {
            printf("Sou o filho %d (PID %d), o meu pai é %d\n", i, getpid(), getppid());
            _exit(i);  
        }
    }

    for (i = 1; i <= 10; i++) {
        pid_terminado = wait(&status);
        if (WIFEXITED(status)) {
            codigo = WEXITSTATUS(status);
            printf("Filho com PID %d terminou com código de saída %d\n", pid_terminado, codigo);
        }
    }

    return 0;
}
