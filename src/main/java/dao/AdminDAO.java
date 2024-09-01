package dao;

import modele.Admin;
import util.Utilitaire;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    
	 public Admin verifierAdmin(String username, String password) {
	        Admin admin = null;
	        String query = "SELECT * FROM admins WHERE username=? AND password=?";

	        try (Connection c = Utilitaire.getConnection();
	             PreparedStatement ps = c.prepareStatement(query)) {

	            ps.setString(1, username);
	            ps.setString(2, password);

	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    admin = new Admin();
	                    admin.setId(rs.getInt("id"));
	                    admin.setUsername(rs.getString("username"));
	                    admin.setPassword(rs.getString("password"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return admin;
	    }

	

    public boolean ajouterAdmin(Admin admin) {
        String query = "INSERT INTO admins (username, password) VALUES (?, ?)";
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean supprimerAdmin(int adminId) {
        String query = "DELETE FROM admins WHERE id = ?";
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, adminId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Admin> listerAdmins() {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM admins";
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }
    public String getUsernameAdmin(int adminId) {
        String username = null;
        String query = "SELECT username FROM admins WHERE id = ?";
        try (Connection connection = Utilitaire.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, adminId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    username = rs.getString("username");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return username;
    }
}
