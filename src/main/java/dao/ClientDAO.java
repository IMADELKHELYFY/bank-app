package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import modele.Client;

import util.Utilitaire;

public class ClientDAO {
	public Client verifierClient(String username, String password) {
	    Client client = null;
	    Connection c = Utilitaire.getConnection();
	    String query = "SELECT * FROM clients WHERE username=? AND password=?";
	    try (PreparedStatement ps = c.prepareStatement(query)) {
	        ps.setString(1, username);
	        ps.setString(2, password);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                client = new Client();
	                client.setId(rs.getInt("id"));
	                client.setNom(rs.getString("nom"));
	                client.setPrenom(rs.getString("prenom"));
	                client.setCNE(rs.getString("CNE"));
	                client.setEmail(rs.getString("email"));
	                client.setTel(rs.getString("tel"));
	            
	                client.setUsername(rs.getString("username"));
	                client.setPassword(rs.getString("password"));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return client;
	}
    
	public boolean ajouterClient(Client client) {
        String query = "INSERT INTO clients (nom, prenom,CNE, email, tel, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, client.getNom());
            ps.setString(2, client.getPrenom());
            ps.setString(3, client.getCNE());
            ps.setString(4, client.getEmail());
            ps.setString(5, client.getTel());
            ps.setString(6, client.getUsername());
            ps.setString(7, client.getPassword());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}
    public boolean supprimerClient(int clientId) {
        String query = "DELETE FROM clients WHERE id = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, clientId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Client> listerClients() {
        List<Client> clients = new ArrayList<>();
        String query = "SELECT * FROM clients";
        
        try (Connection connection = Utilitaire.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(query)) {
            while (rs.next()) {
                Client client = new Client();
                client.setId(rs.getInt("id"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setCNE(rs.getString("CNE"));
                client.setEmail(rs.getString("email"));
                client.setTel(rs.getString("tel"));
                client.setUsername(rs.getString("username"));
                client.setPassword(rs.getString("password"));
                
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }
    
    public boolean mettreAJourClient(Client client) {
        String query = "UPDATE clients SET nom = ?, prenom = ?, CNE = ?, email = ?, tel = ?, username = ?, password = ? WHERE id = ?";

        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
        	ps.setString(1, client.getNom());
            ps.setString(2, client.getPrenom());
            ps.setString(3, client.getCNE());
            ps.setString(4, client.getEmail());
            ps.setString(5, client.getTel());
            ps.setString(6, client.getUsername());
            ps.setString(7, client.getPassword());
            ps.setInt(8, client.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Client> rechercherClientParNom(String nom) {
        List<Client> clients = new ArrayList<>();
        String query = "SELECT * FROM clients WHERE nom LIKE ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, "%" + nom + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Client client = new Client();
                client.setId(rs.getInt("id"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setCNE(rs.getString("CNE"));
                client.setEmail(rs.getString("email"));
                client.setTel(rs.getString("tel"));
                client.setUsername(rs.getString("username"));
                client.setPassword(rs.getString("password"));                
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }
    
    public boolean clientPossedeComptes(int clientId) {
        String query = "SELECT COUNT(*) FROM comptes_bancaires WHERE clientId = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, clientId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int getDernierClientID() {
        int id = -1;
        String query = "SELECT MAX(id) FROM clients";
        
        try (Connection connection = Utilitaire.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(query)) {
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public Client getClientById(int clientId) {
        Client client = null;
        String query = "SELECT * FROM clients WHERE id = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, clientId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                client = new Client();
                client.setId(rs.getInt("id"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setCNE(rs.getString("CNE"));
                client.setEmail(rs.getString("email"));
                client.setTel(rs.getString("tel"));
                client.setUsername(rs.getString("username"));
                client.setPassword(rs.getString("password"));
               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return client;
    }
    public int totalClients() {
        int total = 0;
        String query = "SELECT COUNT(*) FROM clients";

        try (Connection connection = Utilitaire.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(query)) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
    
}
