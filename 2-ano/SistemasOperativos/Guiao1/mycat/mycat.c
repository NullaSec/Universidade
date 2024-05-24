#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

#define SIZE 100


void mycat() {
    ssize_t bytes_lidos, bytes_escritos;
    char buffer[SIZE];
    
    while ((bytes_lidos = read(0, buffer, SIZE)) > 0){
        printf("Li %ld bytes.\n", bytes_lidos);
        bytes_escritos = write(1, buffer, bytes_lidos);
        printf("Escrevi %ld bytes.\n\n", bytes_escritos);
    }
}