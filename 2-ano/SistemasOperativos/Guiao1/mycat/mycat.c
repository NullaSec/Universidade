#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

#define BUFFER 5

void mycat() {
    char buffer[BUFFER];
    ssize_t bytes_lidos;
    int fd_ficheiro;

    fd_ficheiro = open("/home/nullasec/repos/Universidade/2-ano/SistemasOperativos/Guiao1/mycat/ficheiro1.txt", O_RDONLY);
    if (fd_ficheiro == -1){
        perror("O ficheiro não foi aberto corretamente.");
        exit(1);
    }

    
    while((bytes_lidos = read(fd_ficheiro, buffer, BUFFER)) > 0){
        if (write(1, buffer, bytes_lidos) != bytes_lidos) {
            perror("Erro ao escrever");
            close(fd_ficheiro);
            exit(1);
        }
    }
}

int main(int argc, char *argv[]){
    mycat();

    return 0;
}