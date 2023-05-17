#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 50 Questões de PI - 1ª Parte

// 1. Maior número na sequência
void MaiorNum(){
    int N, maior = 0;
    while (N != 0){
        scanf("%d", &N);
        if (N > maior){
            maior = N;
        }
    }
    printf("Maior número: %d\n", maior);
}

// 2. Média da sequência
void MediaSeq(){
    double N, add = 0, num = 0;
    while (N != 0){
        scanf("%lf", &N);
        add += N;
        num++;
    }
    num--;
    printf("Média: %f\n", add / num);
}

// 3. Segundo maior elemento da sequência
void SegMaior(){
    int N, maior = 0, segmaior = 0;
    while (N != 0){
        scanf("%d", &N);
        if (N > maior && N != 0){
            segmaior = maior;
            maior = N;
        }
        else if (N > segmaior && N < maior){
            segmaior = N;
        }
    }
    printf("Segundo maior número: %d\n", segmaior);
}

// 4. Número de bits iguais a 1
int NumBits(unsigned int N){
    int i, x = 0;
    for (i = N; i > 0; i /= 2){
        if (i % 2 == 1) x++;
    }
    return(x);
}

// 5. Número de bits a 0
int trailingZ(unsigned int N){
    if (N % 2) return 0;
    else return 1 + trailingZ(N >> 1);
}

// 6. Digitos necessários para escrever em base decimal
int qDig (unsigned int N){
    int contador = 0;
    while (N != 0){
        N /= 10;
        contador++;
    }
    return contador;
}

// 7. Juntar duas strings
char *strcat2 (char s1[], char s2[]){
    char* final = s1;
    while(*s1) s1++;
    while((*s1 - *s2)){
        s1++;
        s2++;
    }
    *s1 = '\0';
    return final;
}

// 8. Copiar strings
char *strcopy2 (char *dest, char source[]){
    char* final = dest;
    while ((*dest = *source)){
        source++;
        dest++;
    }
    return final;
}

// 9. Comparar duas strings
int strcmp2 (char s1[], char s2[]){
    while (*s1 == *s2 && *s1){
        s1++;
        s2++;
    }
    return *s1 - *s2;
}

// 10. Posição da S2 em S1
char *strstr2 (char s1[], char s2[]){ // TO DO
    return 0;
}


int main()
{
    int Q, N;
    char s1[5] = {1,2,3,4,5}, s2[6] = {'T', 'E', 'S', 'T', 'E', 'S'}, source[3] = {'a', 'b', 'c'}, dest[3];

    printf("50 Questões de PI - 1ª Parte\n");
    printf("Número da questão: ");
    scanf("%d", &Q);
    
    switch (Q)
    {
        case 1: MaiorNum(); break;
        case 2: MediaSeq(); break;
        case 3: SegMaior(); break;
        case 4:
        scanf("%d", &N);
        printf("Número de bits: %d\n", NumBits(N));
        break;
        case 5:
        scanf("%d", &N);
        printf("Número de bits: %d\n", trailingZ(N));
        break;
        case 6:
        scanf("%d", &N);
        printf("Número de digitos: %d\n", qDig(N));
        break;
        case 7: printf("Endereço final: %s", strcat2(s1, s2)); break;
        case 8: printf("Valor: %s", strcopy2(dest, source));
        case 9: printf("Resultado: %d", strcmp2(s1, s2));
        case 10:


        default:
        printf("ERRO: Tem de ser um número de 1 a 50\n");
    }

    return 0;
}