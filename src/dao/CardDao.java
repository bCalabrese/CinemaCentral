package dao;

import object.Card;

public class CardDao extends AbstractDao 
{
	public static void insertInformation(Card card)
	{
		try 
		{
			connect = getConnection();
			preparedStatement = connect.prepareStatement("INSERT INTO `card` "
					+ "(`memberID`,`creditCardCCV`,`creditCardNumber`,`cardHolderFirstName`,`cardHolderLastName`,`expYear`,`expMonth`,`ccType`)"
					+ "VALUES "
					+ "(?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, card.getMemberId());
			preparedStatement.setInt(2, card.getCreditCardCCV());
			preparedStatement.setString(3, card.getCreditCardNumber());
			preparedStatement.setString(4, card.getCardHolderFirstName());
			preparedStatement.setString(5, card.getCardHolderLastName());
			preparedStatement.setInt(6, card.getExpYear());
			preparedStatement.setInt(7, card.getExpMonth());
			preparedStatement.setString(8, card.getCcType());
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
	public static boolean doesMemberExist(int memberId) {
		boolean retVal = true;
		try {
			connect = getConnection();
			preparedStatement = connect.prepareStatement("SELECT card.memberID from card WHERE card.memberID= ?");
			preparedStatement.setInt(1, memberId);
			
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
	
	public static Card getInformation(int memberId) {
		Card retVal = null;
		try 
		{
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "card.creditCardCCV, card.creditCardNumber, card.CardHolderFirstName, card.CardHolderLastName, card.expYear, card.expMonth, card.ccType "
					+ "FROM card "
					+ "WHERE card.memberID=?");
			preparedStatement.setInt(1, memberId);
			
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) 
			{
				Card card = new Card();
				card.setMemberId(memberId);
				card.setCreditCardCCV(resultSet.getInt(1));
				card.setCreditCardNumber(resultSet.getString(2));
				card.setCardHolderFirstName(resultSet.getString(3));
				card.setCardHolderLastName(resultSet.getString(4));
				card.setExpYear(resultSet.getInt(5));
				card.setExpMonth(resultSet.getInt(6));
				card.setCcType(resultSet.getString(7));
				retVal = card;
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
	public static String getTierName(int memberId) {
		String tierName = null;
		try 
		{
			connect = getConnection();
			
			preparedStatement = connect.prepareStatement("SELECT "
					+ "member.tierName "
					+ "FROM member "
					+ "WHERE member.memberID=?");
			preparedStatement.setInt(1, memberId);
			
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) 
			{
				String temp;
				temp = resultSet.getString(1);
				tierName = temp;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			close();
		}
		return tierName;
	}
	public static void updateInformation(Card card)
	{
		try 
		{
			connect = getConnection();
			preparedStatement = connect.prepareStatement("UPDATE card "
					+ "SET creditCardCCV=?, creditCardNumber=?, CardHolderFirstName=?, CardHolderLastName=?, expYear=?, expMonth=?, ccType=?"
					+ "WHERE card.memberID=?");
			preparedStatement.setInt(1, card.getCreditCardCCV());
			preparedStatement.setString(2, card.getCreditCardNumber());
			preparedStatement.setString(3, card.getCardHolderFirstName());
			preparedStatement.setString(4, card.getCardHolderLastName());
			preparedStatement.setInt(5, card.getExpYear());
			preparedStatement.setInt(6, card.getExpMonth());
			preparedStatement.setString(7, card.getCcType());
			preparedStatement.setInt(8, card.getMemberId());
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
