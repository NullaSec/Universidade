#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Exame Recurso Programação Imperativa 2022

// 1. int pesquisa (int a[], int N, int x)
int pesquisa(int a[], int N, int x){
    for (int i = 0; i < N; i++){
        if (x == a[i]){
            return i;
            break;
        }
    }
    return -1;
}

// 2. void roda (LInt *l) UNTESTED
typedef struct LInt_nodo {
    int valor;
    struct LInt_nodo *prox;
} *LInt;

void roda (LInt *l){
    LInt ultimo = *l;
    while (ultimo -> prox -> prox != NULL){
        ultimo = ultimo -> prox;
    }

    LInt guardaUlt = ultimo -> prox;
    ultimo -> prox = NULL;
    guardaUlt -> prox = *l;
    *l = ultimo;
}

// 4. void checksum (char s[]) UNTESTED
// Soma de todos deve ser multiplo de 10
// Se o digito estiver em pos par devem ser somados os digitos do dobro
// Se estiver em impar somar normal
void checksum (char s[]){
    int i, soma = 0;
    
    for (i = strlen(s) - 1; i >= 0; i--){
        if (i % 2 != 0){
            soma += s[i];
        }
        else{
            if (s[i] > 4){
                while (s[i] > 0){
                    int num = s[i] % 10;
                    soma += num;
                    num /= 10;
                }
            }
            else{
                soma += 2 * i;
            }
        }
    }

    if (soma % 10 == 0){
        s[strlen(s) - 1] = 0;
    }
    else{
        s[strlen(s) - 1] = 10 - soma;
    }
}

int main(){
    int exercicio;
    printf("Recurso de PI 2022\n");
    printf("Escolhe um exercício: ");
    scanf("%d", &exercicio);

    int N = 5, x = 3, a[] = {1,2,3,4,5}, l[] = {1,2,3,4,5};
    
    switch (exercicio){
        case 1:
            printf("Resposta: %d\n", pesquisa(a, N, x));
            break;
    }

}