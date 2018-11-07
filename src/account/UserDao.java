package account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	private final static String username = "root";
	private final static String password = "sesame";
	private final static String host = "localhost";
	
	private static Connection connect = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet resultSet = null;
	
	private static Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://" + host + "/moviestoredb?useSSL=false" 
					+ "&user=" + username 
					+ "&password=" + password);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static UserAccount attemptLogin(String email, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "member.memberID, member.firstName, member.genrePreference "
					+ "FROM member "
					+ "WHERE member.emailAddress=? AND member.memberPassword=?");
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pass);
			
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				UserAccount user = new UserAccount();
				user.setMemberID(resultSet.getInt(1));
				user.setFirstName(resultSet.getString(2));
				user.setGenrePreference(resultSet.getString(3));
				user.setSessionValid(true);
				return user;
			} else {
				return null;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return null;
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
