package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modele.Demande;
import util.Utilitaire;

public class DemandeDAO {

    public boolean ajouterDemande(Demande demande) {
        String query = "INSERT INTO demande (username, email, password) VALUES (?, ?, ?)";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setString(1, demande.getUsername());
            preparedStatement.setString(2, demande.getEmail());
            preparedStatement.setString(3, demande.getPassword());
            
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                return true;
            } else {
                System.err.println("Aucune ligne affectée par l'insertion.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'ajout de la demande: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public List<Demande> listerDemandes() {
        List<Demande> demandes = new ArrayList<>();
        String query = "SELECT * FROM demande";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            
            while (resultSet.next()) {
                Demande demande = new Demande();
                demande.setId(resultSet.getInt("id"));
                demande.setUsername(resultSet.getString("username"));
                demande.setEmail(resultSet.getString("email"));
                demande.setPassword(resultSet.getString("password"));
                
                demandes.add(demande);
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la liste des demandes: " + e.getMessage());
            e.printStackTrace();
        }
        
        return demandes;
    }

    public boolean supprimerDemande(int id) {
        String query = "DELETE FROM demande WHERE id = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setInt(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                return true;
            } else {
                System.err.println("Aucune ligne affectée par la suppression.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression de la demande: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    public Demande getDemandeById(int id) {
        String query = "SELECT * FROM demande WHERE id = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Demande demande = new Demande();
                    demande.setId(resultSet.getInt("id"));
                    demande.setUsername(resultSet.getString("username"));
                    demande.setEmail(resultSet.getString("email"));
                    demande.setPassword(resultSet.getString("password"));
                    return demande;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int totalDemandes() {
        int total = 0;
        String query = "SELECT COUNT(*) FROM demande";
        
        try (Connection connection = Utilitaire.getConnection();
             Statement stmt = connection.createStatement();
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
