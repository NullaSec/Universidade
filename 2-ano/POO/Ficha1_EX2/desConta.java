package Ficha1_EX2;

import java.util.Scanner;

public class desConta {
    public static String criaDescricaoConta(String nome, double saldo){
        String res;
        res = String.format("Bom dia %s, o teu saldo é de %f :)", nome, saldo);
        return res;
    }

    public static void main(String[] args){
        String nome;
        double saldo;

        Scanner input = new Scanner(System.in);

        System.out.println("Qual é o teu nome?: ");
        nome = input.nextLine();
        System.out.println("Qual é o teu saldo?: ");
        saldo = input.nextDouble();

        String des = criaDescricaoConta(nome, saldo);

        System.out.println(des);

        input.close();
    }
}
