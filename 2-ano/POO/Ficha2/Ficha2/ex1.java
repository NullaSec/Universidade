package Ficha2;

import java.util.Scanner;

public class ex1 {

    public static class ArrayOperations {
        public static int encontrarMinimo(int[] arr) {
            int min = arr[0];
            for (int i = 1; i < arr.length; i++) {
                if (arr[i] < min) {
                    min = arr[i];
                }
            }
            return min;
        }

        public static int[] comparaIndex(int[] arr, int fim, int inicio){
            int tamanho = fim - inicio + 1;
            int[] subarray = new int[tamanho];
            
            System.arraycopy(arr, inicio, subarray, 0, tamanho);

            return subarray;
        }
    }

    public void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n, i;

        System.out.print("Quantos inteiros queres ler? ");
        n = sc.nextInt();

        int[] numeros = new int[n];

        System.out.println("Insere os números que queres ler: ");
        for (i = 0; i < n; i++){
            numeros[i] = sc.nextInt();
        }

        System.out.println("O valor mínimo no array é: " + ArrayOperations.encontrarMinimo(numeros));

        int[] indices = new int[2];
        System.out.println("Digite o índice inicial e final (separados por espaço): ");
        indices[0] = sc.nextInt(); // inicial
        indices[1] = sc.nextInt(); // final

        System.out.print("Tamanho do primeiro array: ");
        int tamanho1 = sc.nextInt();
        int[] array1 = new int[tamanho1];
        System.out.println("Digite os elementos do primeiro array:");
        for (i = 0; i < tamanho1; i++) {
            array1[i] = sc.nextInt();
        }
        
        System.out.print("\nTamanho do segundo array: ");
        int tamanho2 = sc.nextInt();
        int[] array2 = new int[tamanho2];
        System.out.println("Digite os elementos do segundo array:");
        for (i = 0; i < tamanho2; i++) {
            array2[i] = sc.nextInt();
        }

        // acabar depois
    }
}

