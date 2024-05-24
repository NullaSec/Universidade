#include <stdio.h>
#include <stdlib.h>

#include "Guiao1/mycat/mycat.h"

int main(){
    int opcao;

    printf("===============================\n");
    printf("| Guião 1: Acesso a Ficheiros |\n");
    printf("===============================\n");

    printf("  1: mycat.c\n");

    printf("\nOpção selecionada: ");
    scanf("%d", &opcao);

    switch (opcao) {
        case 1:
            mycat();
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        default:
            printf("Opção inválida, escolhe um número entre 1 e 2\n"); // Atualizar quando resolver mais ex
            break;
    }

}