package Ficha1_EX2;

import java.util.Scanner;

public class decrescente {
    public static void ordena(int num1, int num2){
        double media = (num1 + num2) / 2;
        if (num1 > num2){
            System.out.println("Ordenados: " + num1 + ", " + num2);
            System.out.println("Média: " + media);
        }
        else{
            System.out.println("Ordenados: " + num2 + ", " + num1);
            System.out.println("Média: " + media);
        }
    } 
    public static void main(String[] args){
        int num1, num2;

        Scanner input = new Scanner(System.in);

        System.out.println("Primeiro numero: ");
        num1 = input.nextInt();

        System.out.println("Segundo numero: ");
        num2 = input.nextInt();

        ordena(num1, num2);

        input.close();
    }
}
