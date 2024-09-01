package dao;

import util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modele.Operation;

public class OperationDAO {
    private static Connection connection;

    public OperationDAO() {
        connection = Utilitaire.getConnection();
    }

    public static List<Operation> listerOperations() {
        List<Operation> operations = new ArrayList<>();
        String query = "SELECT * FROM operations";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Operation operation = new Operation();
                operation.setId(rs.getInt("id"));
                operation.setType(rs.getString("type"));
                operation.setMontant(rs.getDouble("montant"));
                operation.setDate(rs.getDate("date"));
                operation.setCompteId(rs.getInt("compteId"));
                operations.add(operation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return operations;
    }

    public void ajouterOperation(Operation operation) {
        String query = "INSERT INTO operations (type, montant, date, compteId) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, operation.getType());
            pstmt.setDouble(2, operation.getMontant());
            pstmt.setDate(3, new java.sql.Date(operation.getDate().getTime()));
            pstmt.setInt(4, operation.getCompteId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void depot(double montant, int compteId) {
        try {
            String query = "UPDATE comptes_bancaires SET solde = solde + ? WHERE id = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setDouble(1, montant);
            pstmt.setInt(2, compteId);
            pstmt.executeUpdate();
            pstmt.close();

            // Ajouter l'opération
            Operation operation = new Operation();
            operation.setType("Dépôt");
            operation.setMontant(montant);
            operation.setDate(new java.util.Date());
            operation.setCompteId(compteId);
            ajouterOperation(operation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void retrait(double montant, int compteId) {
        try {
            String query = "UPDATE comptes_bancaires SET solde = solde - ? WHERE id = ? AND solde >= ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setDouble(1, montant);
            pstmt.setInt(2, compteId);
            pstmt.setDouble(3, montant);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Le solde est insuffisant pour effectuer le retrait.");
            } else {
                // Ajouter l'opération
                Operation operation = new Operation();
                operation.setType("Retrait");
                operation.setMontant(montant);
                operation.setDate(new java.util.Date());
                operation.setCompteId(compteId);
                ajouterOperation(operation);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void virement(double montant, int compteIdSource, int compteIdDestination) {
        try {
            connection.setAutoCommit(false);
            retrait(montant, compteIdSource);
            depot(montant, compteIdDestination);
            connection.commit();

            // Ajouter l'opération de virement
            Operation operation = new Operation();
            operation.setType("Virement");
            operation.setMontant(montant);
            operation.setDate(new java.util.Date());
            operation.setCompteId(compteIdSource); // Compte source de l'opération
            ajouterOperation(operation);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int totalOperations() {
        int total = 0;
        String query = "SELECT COUNT(*) FROM operations";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}
