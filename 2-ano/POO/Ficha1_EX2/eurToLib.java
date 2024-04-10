package Ficha1_EX2;
import java.util.Scanner;

public class eurToLib {
    public static double eurosParaLibras(double valor, double taxaConversao){
        double convert = valor * taxaConversao;
        return convert;
    }

    public static void main(String[] args){
        double valor, taxa;
        Scanner input = new Scanner(System.in);

        System.out.println("Qual o valor que quer converter?: ");
        valor = input.nextDouble();
        System.out.println("Qual a taxa de conversao atual?: ");
        taxa = input.nextDouble();

        System.out.println("O valor convertdo é: " + eurosParaLibras(valor, taxa));

        input.close();
    }
}
