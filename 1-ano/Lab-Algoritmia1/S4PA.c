#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// Problema A: Canções Alternadas (NÃO FUNCIONA; AVISEM SE PRECISAREM DE RESOLUÇÃO)

#define VOGAIS "AEIOUY"

void LimparArray(char linha[]){
    for (int i = 0; i < 1000; i++) {
      linha[i] = '\0';
    }
}

bool VogalChecker(char l){
    return strchr(VOGAIS, l) != NULL;
}

int main()
{
    // Consoantes separadas por vogais (AEIOUY)
    int N, i, j, l;
    if (scanf("%d", &N) != 1) abort();

    char linha[1000];
    int resultados[N];
    for (i = 0; i < N; i++){
        LimparArray(linha);
        int contador = 0;
        bool Validar = false;

        fgets(linha, 1000, stdin);
        j = 0;
        while (linha[j] != '\0' && linha[j] != '\n'){
            int k = j + 1;
            while(linha[k] != ' ' && linha[k] != '\n' && linha[k] != '\0') k++;
            if (k - j > 1){
                Validar = true;
                bool Vogal = VogalChecker(linha[j]);

                for (l = j + 1; l < k; l++){
                    bool VogalAtual = VogalChecker(linha[l]);
                    if (Vogal == VogalAtual){
                        Validar = false;
                        break;
                    }
                    Vogal = VogalAtual;
                }
                if (Validar) contador++;
            }
            j = k + 1;
        }
        resultados[i] = contador;
    }

    for (i = 0; i < N; i++){
        printf("%d\n", resultados[i]);
    }

    return 0;
}