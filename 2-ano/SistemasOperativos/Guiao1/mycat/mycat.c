#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

#define BUFFER 5

void mycat() {
    char buffer[BUFFER];
    ssize_t bytes_lidos;
    
    while((bytes_lidos = read(0, buffer, BUFFER)) > 0){
        write(1, buffer, bytes_lidos);
    }
}