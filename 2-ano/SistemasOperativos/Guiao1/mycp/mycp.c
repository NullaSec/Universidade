#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>

#define BUFFER 10

void mycp(){
    char buffer[BUFFER];
    ssize_t bytes_lidos, total_bytes = 0;
    int fd_origem, fd_destino;

    clock_t inicio = clock(); // Começa o temporizador

    fd_origem = open("/home/nullasec/repos/Universidade/2-ano/SistemasOperativos/Guiao1/mycp/origem.txt", O_RDONLY);
    fd_destino = open("/home/nullasec/repos/Universidade/2-ano/SistemasOperativos/Guiao1/mycp/destino.txt", O_WRONLY | O_CREAT | O_TRUNC);

    while ((bytes_lidos = read(fd_origem, buffer, BUFFER)) > 0) {
    write(fd_destino, buffer, bytes_lidos);
    total_bytes += bytes_lidos;
    }

    if (total_bytes == 0){
        printf("O ficheiro de destino está vazio.\n");
    }
    else{
        printf("O ficheiro de destino contém dados.\n");
    }

    clock_t fim = clock(); // Pára o temporizador

    double tempo_gasto = (double)(fim - inicio)/CLOCKS_PER_SEC;

    close(fd_origem);
    close(fd_destino);

    printf("O programa demorou %fs a copiar o ficheiro.\n", tempo_gasto);

}

int main(int argc, char *argv[]){
    mycp();
}