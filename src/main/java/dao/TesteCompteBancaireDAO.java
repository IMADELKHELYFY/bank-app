package dao;

import modele.CompteBancaire;

public class TesteCompteBancaireDAO {

    private CompteBancaireDAO compteBancaireDAO;

    public TesteCompteBancaireDAO() {
        compteBancaireDAO = new CompteBancaireDAO();
    }

 

    public void testListerComptes() {
        System.out.println("Liste des comptes bancaires :");
        for (CompteBancaire compte : compteBancaireDAO.listerComptes()) {
            System.out.println(compte);
        }
    }

    public static void main(String[] args) {
        TesteCompteBancaireDAO teste = new TesteCompteBancaireDAO();
        
        teste.testListerComptes();
    }
}
