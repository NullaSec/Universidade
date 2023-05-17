#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 50 Questões de PI - 2ª Parte

typedef struct lligada{
    int valor;
    struct lligada *prox;
} *LInt;

// 1. int length (LInt)
int length (LInt lista){
    int comprimento = 0;
    while (lista != NULL){
        comprimento += 1;
        lista = lista -> prox;
    }
    return comprimento;
}

// 2. void freeL (LInt)
void freeL(LInt lista){
    LInt auxiliar;
    while (lista != NULL){
        auxiliar = lista -> valor; // ? Como assim dá erro
        free(lista);
        lista = auxiliar;
    }
}

// 3. void imprimeL (LInt)
void imprimeL (LInt lista){
    while (lista != NULL){
        printf("%d ", lista -> valor);
        lista = lista -> prox;
    }
}

// 4. LInt reverseL (LInt) 
LInt reverseL (LInt lista){
    LInt anterior = NULL;
    LInt atual = lista;
    LInt proximo;

    while (atual != NULL){
        proximo = atual -> prox;
        atual -> prox = anterior;
        anterior = atual;
        atual = proximo;
    }

    return anterior;
}

// 5. void insertOrd (LInt *, int)
void insertOrd (LInt *lista, int x){
    LInt novo = (LInt) malloc(sizeof(struct lligada));
    novo -> valor = x;
    novo -> prox = NULL;

    if (*lista == NULL || x < (*lista) -> valor){
        novo -> prox = (*lista);
        *lista = novo;
    }
    else{
        LInt atual = *lista;
        while (atual -> prox != NULL && atual -> prox -> valor < x){
            atual = atual -> prox;
        }
        novo -> prox = atual -> prox;
        atual -> prox = novo;
    }
}

// 6. int removeOneOrd (LInt *, int)
int removeOneOrd (LInt *lista, int x){
    if (*lista == NULL) return 1;

    if ((*lista) -> valor == x){
        LInt temp = *lista;
        *lista = (*lista) -> prox;
        free(*lista);
        return 0;
    }

    LInt anterior = (*lista);
    LInt atual = (*lista) -> prox;

    while (atual != NULL && atual -> valor != x){
        anterior = atual;
        atual = atual -> prox;
    }

    if (atual == NULL) return 1;

    anterior -> prox = atual -> prox;
    free(atual);
    return 0;
}

// 7. merge (LInt *r, LInt a, LInt b)
void merge (LInt *r, LInt a, LInt b){
    while (a != NULL || b != NULL){
        if (a != NULL && b != NULL && a -> valor < b -> valor || b == NULL){
            *r = a;
            a = a -> prox;
        }
        else{
            *r = b;
            b = b -> prox;
        }
        r = &((*r) -> prox);
    }
    *r = NULL;
}

