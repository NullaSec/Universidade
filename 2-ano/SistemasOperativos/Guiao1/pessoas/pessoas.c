// Exercício 3 e 4

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

#define TAM_NOME 100
#define FICHEIRO "/home/nullasec/repos/Universidade/2-ano/SistemasOperativos/Guiao1/pessoas/database.dat"

typedef struct{
    char nome[TAM_NOME];
    int idade;

} Pessoa;

void escrever_pessoa(char* nome, int idade){
    Pessoa p;
    strncpy(p.nome, nome, sizeof(p.nome));
    p.nome[sizeof(p.nome) - 1] = '\0';
    p.idade = idade;

    int fd = open(FICHEIRO, O_WRONLY | O_APPEND);

    if((write(fd, &p, sizeof(Pessoa))) != sizeof(Pessoa)){
        perror("Erro ao escrever.");
        close(fd);
        exit(1);
    }

    off_t posicao = lseek(fd, -sizeof(Pessoa), SEEK_CUR);

    close(fd);
    printf("Nova pessoa registada no ficheiro, posição %ld.\n", posicao);
}

void listar_pessoas(int num_pessoas){
    int contador = 0, fd;
    fd = open(FICHEIRO, O_RDONLY);
    Pessoa p;

    while (contador < num_pessoas && read(fd, &p, sizeof(Pessoa)) == sizeof(Pessoa)) {
        printf("%d: %s, %d\n",contador+1, p.nome, p.idade);
        contador++;
    }

    if (contador == 0){
        perror("O ficheiro está vazio.");
        close(fd);
        exit(1);
    }

}

void atualizar_dados(char* nome, int idade){
    Pessoa p;
    strncpy(p.nome, nome, sizeof(p.nome));
    p.nome[sizeof(p.nome) - 1] = '\0';
    p.idade = idade;

    int fd = open(FICHEIRO, O_RDWR);

    while(read(fd, &p, sizeof(Pessoa)) == sizeof(Pessoa)){
        if (strcmp(p.nome, nome) == 0){
            p.idade = idade;

            lseek(fd, -sizeof(Pessoa), SEEK_CUR); // Anda 1 pessoa para trás para escrever a info nova

            if (write(fd, &p, sizeof(Pessoa)) != sizeof(Pessoa)) {
                perror("Erro ao atualizar dados.");
                close(fd);
                exit(1);
            }
        }
    }
}

void atualizar_por_posicao(int posicao, int nova_idade) {
    Pessoa p;

    int fd = open(FICHEIRO, O_RDWR);
    if (fd == -1) {
        perror("Erro ao abrir o ficheiro");
        exit(1);
    }

    off_t offset = posicao * sizeof(Pessoa);

    if (lseek(fd, offset, SEEK_SET) == -1) {
        perror("Erro no lseek");
        close(fd);
        exit(1);
    }

    if (read(fd, &p, sizeof(Pessoa)) != sizeof(Pessoa)) {
        fprintf(stderr, "Registo %d inválido.\n", posicao);
        close(fd);
        exit(1);
    }

    p.idade = nova_idade;

    lseek(fd, -sizeof(Pessoa), SEEK_CUR);  
    if (write(fd, &p, sizeof(Pessoa)) != sizeof(Pessoa)) {
        perror("Erro ao atualizar");
    }

    close(fd);
    printf("Idade atualizada no registo %d.\n", posicao);
}


int main (int argc, char *argv[]){

    if (argc < 2){
        fprintf(stderr, "Uso: %s -i | -l | -u [argumentos...]\n", argv[0]);
    }

    if(strcmp(argv[1], "-i") == 0){
        if (argc != 4){
            fprintf(stderr, "Uso: %s -i [NomedaPessoa] [idade]\n", argv[0]);
            return 1;
        }

        escrever_pessoa(argv[2], atoi(argv[3]));
    }

    if(strcmp(argv[1], "-l") == 0){
        if (argc != 3){
            fprintf(stderr, "Uso: %s -l [Número de pessoas a listar]\n", argv[0]);
            return 1;
        }

        listar_pessoas(atoi(argv[2]));
    }

    if(strcmp(argv[1], "-u") == 0){
        if (argc != 4){
            fprintf(stderr, "Uso (com dados a atualizar): %s -u [NomedaPessoa] [idade] [outros dados]\n", argv[0]);
            return 1;
        }

        atualizar_dados(argv[2], atoi(argv[3]));    
    }

    if(strcmp(argv[1], "-o") == 0){
        if (argc != 4){
            fprintf(stderr, "Uso (com dados a atualizar): %s -o [Posição] [idade nova]\n", argv[0]);
            return 1;
        }

        atualizar_dados(argv[2], atoi(argv[3]));    
    }

    return 0;
}