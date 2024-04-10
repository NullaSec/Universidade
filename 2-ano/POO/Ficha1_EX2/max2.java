package Ficha1_EX2;

import java.util.Scanner;

class max2 {
    public static int maxOf2(int n1, int n2){
        if (n1 > n2){
            return n1;
        }
        else {return n2;}
    }

    public static void main(String[] args) {
        int num1, num2;
        Scanner input = new Scanner(System.in);

        System.out.print("Indica dois números: ");
        num1 = input.nextInt();
        num2 = input.nextInt();

        System.out.println("O maior número é: " + maxOf2(num1, num2));
        input.close();
    }
}
