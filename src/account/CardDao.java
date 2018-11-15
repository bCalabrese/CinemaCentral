package account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CardDao {
	private final static String username = "root";
	private final static String password = "sesame";
	private final static String host = "localhost";
	
	private static Connection connect = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet resultSet = null;
	
	private static Connection getConnection() {
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
	
	public static void insertInformation(
			int creditCardCCV, String creditCardNumber, String cardHolderFirstName, String cardHolderLastName, int expYear,int expMonth,int ccType)
	{
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("INSERT INTO `card` "
					+ "(creditCardCCV`,`creditCardNumber`,`cardHolderFirstName`,`cardHolderLastName`,`expYear`,`expMonth`,`ccType`)"
					+ "VALUES "
					+ "(?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, creditCardCCV);
			preparedStatement.setString(2, creditCardNumber);
			preparedStatement.setString(3, cardHolderFirstName);
			preparedStatement.setString(4, cardHolderLastName);
			preparedStatement.setInt(5, expYear);
			preparedStatement.setInt(6, expMonth);
			preparedStatement.setInt(7, ccType);
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
	}
	
	private static void close() {
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
