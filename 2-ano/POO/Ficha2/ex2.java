import java.util.ArrayList;
import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ex2 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        DataDB datas = new DataDB();

        System.out.print("Quantas datas queres inserir? ");
        int numDatas = sc.nextInt();

        System.out.println("Escreve as datas no formato YYYY-MM-DD:");
        for (int i = 0; i < numDatas; i++){
            String dataString = sc.next();
            LocalDate data = LocalDate.parse(dataString);

            datas.insereData(data); // Exercício 2 a)
        }

        System.out.print("Dá uma data para descobrir a mais próxima: "); // Exercício 2 b)
        String compData = sc.next();
        LocalDate data = LocalDate.parse(compData);
        LocalDate dataProx = datas.dataMaisProxima(data);
        System.out.println("A data mais próxima é: " + dataProx);

        System.err.println("Estas são as datas guardadas no array:");
        datas.toString();

        sc.close();
    }
}

class DataDB {
    private ArrayList<LocalDate> datas;

    public DataDB(){
        datas = new ArrayList<>();
    }


    public void insereData(LocalDate data){ 
        datas.add(data);
    }

    public LocalDate dataMaisProxima(LocalDate data){
        if (datas.isEmpty()){
            return null;
        }

        LocalDate maisPerto = datas.get(0);
        float menorDif = Math.abs(data.toEpochDay() - maisPerto.toEpochDay());

        for (LocalDate d : datas){
            float dif = Math.abs(data.toEpochDay() - d.toEpochDay());

            if (dif < menorDif){
                menorDif = dif;
                maisPerto = d;
            }
        }

        return maisPerto;
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        DateTimeFormatter formatacao = DateTimeFormatter.ofPattern("dd-MM-yyyy");

        for(LocalDate d : datas){
            String dataString = d.format(formatacao);

            sb.append(dataString).append("\n");
        }

        return sb.toString();
    }
}