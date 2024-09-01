package dao;

import modele.CompteBancaire;
import util.Utilitaire;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompteBancaireDAO {
	 private Connection connection;
	public CompteBancaireDAO() {
        this.connection = Utilitaire.getConnection();
    }
	

    public double consulterSolde(int clientId) {
        double solde = 0.0;
        String query = "SELECT SUM(solde) FROM comptes_bancaires WHERE clientId = ?";

        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, clientId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                solde = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solde;
    }

    public boolean ajouterCompte(CompteBancaire compte) {
        String query = "INSERT INTO comptes_bancaires (numero, solde, clientId) VALUES (?, ?, ?)";

        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, compte.getNumero());
            ps.setDouble(2, compte.getSolde());
            ps.setInt(3, compte.getClientId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<CompteBancaire> listerComptes() {
        List<CompteBancaire> comptes = new ArrayList<>();
        String query = "SELECT * FROM comptes_bancaires";

        try (Connection connection = Utilitaire.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(query)) {
            while (rs.next()) {
                CompteBancaire compte = new CompteBancaire();
                compte.setId(rs.getInt("id"));
                compte.setNumero(rs.getString("numero"));
                compte.setSolde(rs.getDouble("solde"));
                compte.setClientId(rs.getInt("clientId"));
                comptes.add(compte);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comptes;
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

    public CompteBancaire getCompteById(int compteId) {
        CompteBancaire compte = null;
        String query = "SELECT * FROM comptes_bancaires WHERE id = ?";

        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, compteId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                compte = new CompteBancaire();
                compte.setId(rs.getInt("id"));
                compte.setNumero(rs.getString("numero"));
                compte.setSolde(rs.getDouble("solde"));
                compte.setClientId(rs.getInt("clientId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return compte;
    }

	 public boolean supprimerCompte(int compteId) {
        String query = "DELETE FROM comptes_bancaires WHERE id = ?";
        
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, compteId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	 public List<CompteBancaire> listerComptesParClientId(int clientId) {
		    List<CompteBancaire> comptes = new ArrayList<>();
		    String query = "SELECT * FROM comptes_bancaires WHERE clientId = ?";

		    try (Connection connection = Utilitaire.getConnection();
		         PreparedStatement ps = connection.prepareStatement(query)) {
		        ps.setInt(1, clientId);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            CompteBancaire compte = new CompteBancaire();
		            compte.setId(rs.getInt("id"));
		            compte.setNumero(rs.getString("numero"));
		            compte.setSolde(rs.getDouble("solde"));
		            compte.setClientId(rs.getInt("clientId"));
		            comptes.add(compte);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return comptes;
		}
	 public List<CompteBancaire> getComptesByClientId(int clientId) {
	        List<CompteBancaire> comptes = new ArrayList<>();
	        String query = "SELECT * FROM comptes_bancaires WHERE client_id = ?";
	        
	        try (Connection connection = Utilitaire.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setInt(1, clientId);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            
	            while (resultSet.next()) {
	                CompteBancaire compte = new CompteBancaire();
	                compte.setId(resultSet.getInt("id"));
	                compte.setNumero(resultSet.getString("numero"));
	                compte.setSolde(resultSet.getDouble("solde"));
	                compte.setClientId(resultSet.getInt("client_id"));
	                comptes.add(compte);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return comptes;
	    }

	    public int totalComptes() {
	        int total = 0;
	        String query = "SELECT COUNT(*) FROM comptes_bancaires";
	        
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
	    public CompteBancaire chercherCompteParNumero(String numero) {
	        CompteBancaire compte = null;
	        String query = "SELECT * FROM comptes_bancaires WHERE numero = ?";

	        try (Connection connection = Utilitaire.getConnection();
	             PreparedStatement ps = connection.prepareStatement(query)) {
	            ps.setString(1, numero);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                compte = new CompteBancaire();
	                compte.setId(rs.getInt("id"));
	                compte.setNumero(rs.getString("numero"));
	                compte.setSolde(rs.getDouble("solde"));
	                compte.setClientId(rs.getInt("clientId"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return compte;
	    }

	        }

