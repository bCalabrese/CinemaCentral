package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.UserBean;
import object.User;

public class UserDao extends AbstractDao {
	public static UserBean attemptLogin(String email, String pass) {
		UserBean retVal = null;
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
				retVal = user;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return retVal;
	}

	public static boolean isEmailTaken(String email) {
		boolean retVal = true;
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT member.memberID FROM member WHERE member.emailAddress=?");
			preparedStatement.setString(1, email);
			
			resultSet = preparedStatement.executeQuery();
			
			if (!resultSet.next()) {
				retVal = false;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return retVal;
	}
	
	public static void createAccount(User user) {
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("INSERT INTO `member` "
					+ "(`tierName`,`userName`,`firstName`,`lastName`,"
					+ "`age`,`billAddressLine1`,`billAddressLine2`,`billCity`,`billState`"
					+ ",`billZipCode`,`phoneNumber`,`emailAddress`,`memberPassword`,`memberSince`) "
					+ "VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, "none");
			preparedStatement.setString(2, user.getUserName());
			preparedStatement.setString(3, user.getFirstName());
			preparedStatement.setString(4, user.getLastName());
			preparedStatement.setInt(5, user.getAge());
			preparedStatement.setString(6, user.getAddr1());
			if (user.getAddr2() == null) {
				preparedStatement.setNull(7, 2);
			}
			else {
				preparedStatement.setString(7, user.getAddr2());
			}
			preparedStatement.setString(8, user.getCity());
			preparedStatement.setString(9, user.getState());
			preparedStatement.setString(10, user.getZipcode());
			preparedStatement.setString(11, user.getPhone());
			preparedStatement.setString(12, user.getEmail());
			preparedStatement.setString(13, user.getPass());
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
		User retVal = null;
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
				retVal = user;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return retVal;
	}
}