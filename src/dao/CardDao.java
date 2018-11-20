package dao;

public class CardDao extends AbstractDao 
{

	public static void insertInformation(
			int memberId, int creditCardCCV, String creditCardNumber, String cardHolderFirstName, String cardHolderLastName, int expYear,int expMonth,String ccType)
	{
		try 
		{
			connect = getConnection();
			preparedStatement = connect.prepareStatement("INSERT INTO `card` "
					+ "(`memberID`,`creditCardCCV`,`creditCardNumber`,`cardHolderFirstName`,`cardHolderLastName`,`expYear`,`expMonth`,`ccType`)"
					+ "VALUES "
					+ "(?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, memberId);
			preparedStatement.setInt(2, creditCardCCV);
			preparedStatement.setString(3, creditCardNumber);
			preparedStatement.setString(4, cardHolderFirstName);
			preparedStatement.setString(5, cardHolderLastName);
			preparedStatement.setInt(6, expYear);
			preparedStatement.setInt(7, expMonth);
			preparedStatement.setString(8, ccType);
			preparedStatement.executeUpdate();
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			close();
		}
	}
}
