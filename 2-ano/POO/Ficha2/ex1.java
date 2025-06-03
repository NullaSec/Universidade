
import java.util.ArrayList;
import java.util.Scanner;

public class ex1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("a) MÍNIMO DO ARRAY"); // Exercicio 1. a)
        System.out.print("Quantos inteiros tem o array? ");
        int n = scanner.nextInt();

        int[] valores = new int[n];
        System.out.printf("Introduz os %d números:\n", n);

        for (int i = 0; i < n; i++) {
            valores[i] = scanner.nextInt();
        }

        arrayOps operacoes = new arrayOps(valores);

        int min = operacoes.minimo();

        System.out.println("O valor mínimo é: " + min);

        System.out.println("b) VALORES ENTRE ÍNDICES"); // Exercício 1. b)
        System.out.print("Introduz o primeiro índice: ");
        int i1 = scanner.nextInt();
        System.out.print("Introduz o segundo índice: ");
        int i2 = scanner.nextInt();

        int[] subArray = operacoes.valNoMeio(i1, i2);

        System.out.println("Os valores estre os índices são: ");
        for (int i = 0; i < subArray.length; i++){
            System.out.printf("%d ", subArray[i]);
        }

        System.out.println("c) ELEMENTOS COMUNS ENTRE ARRAYS"); // Exercício 1. c)
        System.err.print("Quantos elementos tem este segundo array?: ");
        n = scanner.nextInt();

        valores = new int[n];
        System.out.printf("Introduz os %d números:\n", n);

        for (int i = 0; i < n; i++) {
            valores[i] = scanner.nextInt();
        }

        int[] comuns = operacoes.elemComuns(valores);

        System.out.println("Os valores comuns entre os arrays são: ");
        for (int i = 0; i < comuns.length; i++){
            System.out.printf("%d ", comuns[i]);
        }

        scanner.close();
    }
}

class arrayOps {
    private int[] numeros;

    public arrayOps(int[] numeros) {
        this.numeros = numeros;
    }

    public int minimo() {
        if (numeros.length == 0){
            throw new IllegalStateException("Array vazio");
        }

        int min = numeros[0];
        for (int i = 1; i < numeros.length; i++){
            if (numeros[i] < min){
                min = numeros[i];
            }
        }

        return min;
    }

    public int[] valNoMeio(int i1, int i2){
        if(i1 < 0 || i2 > numeros.length || i1 > i2){
            throw new IllegalArgumentException("Os índices são inválidos.");
        }

        int[] subArray = new int[i2-i1 + 1];

        for (int i = i1; i <= i2; i++){
            subArray[i - i1] = numeros[i];
        }

        return subArray;
    }

    public int[] elemComuns(int[] array2){
        if (numeros.length == 0 || array2.length == 0) {
            throw new IllegalStateException("Um dos arrays está vazio.");
        }

        ArrayList<Integer> comuns = new ArrayList<>();

        for (int i = 0; i < numeros.length; i++) {
            for (int j = 0; j < array2.length; j++) {
                if (numeros[i] == array2[j] && !comuns.contains(numeros[i])) {
                    comuns.add(numeros[i]);
                }
            }
        }

        int[] resultado = new int[comuns.size()];
        for (int i = 0; i < comuns.size(); i++) {
            resultado[i] = comuns.get(i);
        }

        return resultado;
    }

}
