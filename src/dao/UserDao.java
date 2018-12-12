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
			System.out.println("UserDao::attemptLogin: " + e);
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
			System.out.println("UserDao::isEmailTaken: " + e);
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
			System.out.println("UserDao::createAccount: " + e);
		}
		finally {
			close();
		}
	}
	
	public static void updateAccount(int memberID, User user) {
        try {
            connect = getConnection();
            preparedStatement = connect.prepareStatement("UPDATE member "
                    + "SET member.firstName=?, member.lastName=?, member.userName=?, "
                    + "member.billAddressLine1=?, member.billAddressLine2=?, member.billCity=?, member.billState=?, member.billZipCode=? "
                    + "WHERE member.memberID=?");
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getUserName());
            preparedStatement.setString(4, user.getAddr1());
            preparedStatement.setString(5, user.getAddr2());
            preparedStatement.setString(6, user.getCity());
            preparedStatement.setString(7, user.getState());
            preparedStatement.setString(8, user.getZipcode());
            preparedStatement.setInt(9, memberID);
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
			preparedStatement = connect.prepareStatement("SELECT"
					+ " member.firstName, member.lastName, member.age, member.billAddressLine1,"
					+ " member.billAddressLine2, member.billCity, member.billState, member.billZipCode, member.phoneNumber, member.userName"
					+ " FROM member"
					+ " WHERE member.memberID=?");
			preparedStatement.setInt(1, memberID);
			
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				User user = new User();
				user.setFirstName(resultSet.getString(1));
				user.setLastName(resultSet.getString(2));
				user.setAge(resultSet.getInt(3));
				user.setAddr1(resultSet.getString(4));
				user.setAddr2(resultSet.getString(5));
				user.setCity(resultSet.getString(6));
				user.setState(resultSet.getString(7));
				user.setZipcode(resultSet.getString(8));
				user.setPhone(resultSet.getString(9));
				user.setUserName(resultSet.getString(10));
				retVal = user;
			}
		}
		catch (Exception e) {
			System.out.println("UserDao::getUserByID: " + e);
		}
		finally {
			close();
		}
		return retVal;
	}
	
	public static int getNumMoviesByID(int memberID) {
		int numMovies = 0;
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT membership.downloadsPerMonth FROM member "
					+ "INNER JOIN "
					+ "membership ON member.memberID=? AND member.tierName=membership.tierName");
			preparedStatement.setInt(1, memberID);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				numMovies = resultSet.getInt(1);
			}
		}
		catch (Exception e) {
			System.out.println("UserDao::getNumMoviesByID: " + e);
		}
		finally {
			close();
		}
		return numMovies;
	}
	

	public static void createReview(int memberID, int movieID, int rating, String reviewText) {
		try {
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("REPLACE INTO moviereview (memberID, movieID, rating, reviewText) "
					+ "VALUES (?,?,?,?);");
			preparedStatement.setInt(1, memberID);
			preparedStatement.setInt(2, movieID);
			preparedStatement.setInt(3, rating);
			preparedStatement.setString(4, reviewText);
			
			preparedStatement.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("UserDao::createReview: " + e);
		}
		finally {
			close();
		}
	}

    }
