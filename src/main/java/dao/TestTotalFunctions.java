package dao;
import modele.*;

import java.util.ArrayList;
import java.util.List;

import dao.*;
public class TestTotalFunctions {
	public static void main(String[] args) {
        // Test totalClients
        ClientDAO clientDAO = new ClientDAO();
        int totalClients = clientDAO.totalClients();
        System.out.println("Total Clients: " + totalClients);

        // Test totalOperations
        OperationDAO operationDAO = new OperationDAO();
        int totalOperations = operationDAO.totalOperations();
        System.out.println("Total Operations: " + totalOperations);

        // Test totalComptes
        CompteBancaireDAO compteDAO = new CompteBancaireDAO();
        int totalComptes = compteDAO.totalComptes();
        System.out.println("Total Comptes: " + totalComptes);

        // Test totalDemandes
        DemandeDAO demandeDAO = new DemandeDAO();
        int totalDemandes = demandeDAO.totalDemandes();
        System.out.println("Total Demandes: " + totalDemandes);
        
        
        Client cc = new Client(); 
        int tt = cc.totalclient();
        System.out.println(tt);
        
     
        
    }
}
