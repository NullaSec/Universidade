package Ficha1_EX2;

import java.util.Scanner;

public class fatorial {
    public static long factorial(int num){
        int atual = num;

        while (atual > 0){
            atual *= num - 1;
            num -= 1;
        }

        return atual;
    }

    public static void main(String[] args){
        int num;

        Scanner input = new Scanner(System.in);

        System.out.println("Escreve um numero: ");
        num = input.nextInt();

        System.out.println("O fatorial de " + num + " é " + factorial(num));
    }
}
