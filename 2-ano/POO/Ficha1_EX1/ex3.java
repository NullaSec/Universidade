package Ficha1_EX1;

import java.util.Scanner;

public class ex3 {
    public static void NumClassificacoes(int quant){
        int i1 = 0, i2 = 0, i3 = 0, i4 = 0;

        Scanner input2 = new Scanner(System.in);

        for (int i = 0; i < quant; i++){
            int classif;
            System.out.print("Nota: ");
            classif = input2.nextInt();

            if (classif >= 0 && classif < 5){i1++;}
            if (classif >= 5 && classif < 10){i2++;}
            if (classif >= 10 && classif < 15){i3++;}
            if (classif >= 15 && classif < 20){i4++;}
        }

        System.out.printf("Existem %d notas entre 0 e 5.\n", i1 );
        System.out.printf("Existem %d notas entre 5 e 10.\n", i2 );
        System.out.printf("Existem %d notas entre 10 e 15.\n", i3 );
        System.out.printf("Existem %d notas entre 15 e 20.\n", i4 );

        input2.close();
    }
    public static void main(String[] args){
        int quantidade;

        Scanner input = new Scanner(System.in);

        System.out.print("Quantas classificações queres inserir?: ");
        quantidade = input.nextInt();

        NumClassificacoes(quantidade);

        input.close();
    }
}
