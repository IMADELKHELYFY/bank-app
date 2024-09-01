package util;

import java.sql.*;

	public class Utilitaire {
	     static Connection connection ;
	    

		public static Connection getConnection() {
				try {
					 Class.forName("com.mysql.jdbc.Driver");
					 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquedb" , "root" , "imad1-23");
				}catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				return connection;
			}
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
