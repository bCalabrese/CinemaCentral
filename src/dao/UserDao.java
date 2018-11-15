package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import account.User;
import bean.UserBean;

public class UserDao extends AbstractDao {
	public static UserBean attemptLogin(String email, String pass) {
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "member.memberID, member.firstName, member.genrePreference "
					+ "FROM member "
					+ "WHERE member.emailAddress=? AND member.memberPassword=?");
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pass);
			
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				UserBean user = new UserBean();
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

	public static boolean isEmailTaken(String email) {
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT member.memberID FROM member WHERE member.emailAddress=?");
			preparedStatement.setString(1, email);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				close();
				return true;
			}
			else {
				close();
				return false;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return true;
	}
	
	public static void createAccount(
			String firstName, String lastName, int age, String email, String pass, 
			String addr1, String addr2,String city, String state, String zipcode, String userName, String phone) {
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("INSERT INTO `member` "
					+ "(`tierName`,`userName`,`firstName`,`lastName`,"
					+ "`age`,`billAddressLine1`,`billAddressLine2`,`billCity`,`billState`"
					+ ",`billZipCode`,`phoneNumber`,`emailAddress`,`memberPassword`,`memberSince`) "
					+ "VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, "none");
			preparedStatement.setString(2, userName);
			preparedStatement.setString(3, firstName);
			preparedStatement.setString(4, lastName);
			preparedStatement.setInt(5, age);
			preparedStatement.setString(6, addr1);
			if (addr2 == null) {
				preparedStatement.setNull(7, 2);;
			}
			else {
				preparedStatement.setString(7, addr2);
			}
			preparedStatement.setString(8, city);
			preparedStatement.setString(9, state);
			preparedStatement.setString(10, zipcode);
			preparedStatement.setString(11, phone);
			preparedStatement.setString(12, email);
			preparedStatement.setString(13, pass);
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			preparedStatement.setString(14, format.format(date));
			
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
	}
	
	public static User getUserByID(int memberID) {
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT * FROM member"
					+ " WHERE member.memberID=?");
			preparedStatement.setInt(1, memberID);
			
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				User user = new User();
				user.setFirstName(resultSet.getString(4));
				user.setLastName(resultSet.getString(5));
				user.setAge(resultSet.getInt(6));
				user.setAddr1(resultSet.getString(7));
				user.setAddr2(resultSet.getString(8));
				user.setCity(resultSet.getString(9));
				user.setState(resultSet.getString(10));
				user.setState(resultSet.getString(11));
				user.setPhone(resultSet.getString(17));
				close();
				return user;
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
}
