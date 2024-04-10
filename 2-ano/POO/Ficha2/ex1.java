package Ficha2;

import java.util.Scanner;
import java.util.Arrays;

public class ex1 {
    public int min_array(int[] arr){
        int menor = arr[0];

        for (int i = 1; i < arr.length; i++){
            if (arr[i] < menor){
                menor = arr[i];
            }
        }

        return menor;
    }

    public void main(String[] args){
        Scanner input = new Scanner(System.in);
        
        System.out.println("Quantos numeros queres ler?: ");
        int num = input.nextInt();

        int[] arr = new int[num];

        for (int i = 0; i < num; i++){
            arr[i] = input.nextInt();
        }

        System.out.println("a) Valor minimo do array: " + min_array(arr));

        input.close();
    }
}

