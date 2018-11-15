package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class AbstractDao {
	protected final static String username = "root";
	protected final static String password = "sesame";
	protected final static String host = "localhost";
	
	protected static Connection connect = null;
	protected static PreparedStatement preparedStatement = null;
	protected static ResultSet resultSet = null;
	
	protected static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + host + "/moviestoredb?useSSL=false" 
					+ "&user=" + username 
					+ "&password=" + password);
		}
		catch (Exception e) {
			System.out.println(e);
		}

		return con;
	}
	
	protected static void close() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {
		
		}
	}
}
