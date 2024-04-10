package Ficha1_EX2;
import java.util.Scanner;

public class exercicios2 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Escreve a temperatura em Celcius: ");
        int cel = scanner.nextInt();

        scanner.close();

        int far = (cel * (9/5)) + 32;

        System.out.println("Temperatura: " + far);
    }
}
