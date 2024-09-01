package dao;

import java.util.List;
import modele.Demande;

public class testDemandeDAO {
    public static void main(String[] args) {
         DemandeDAO demandedao = new DemandeDAO();
        int total = demandedao.totalDemandes();
        System.out.println(total);
       
    }
}
