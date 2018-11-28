package object;

public class Card {
	private int memberId;
	private int creditCardCCV;
	private String creditCardNumber;
	private String cardHolderFirstName;
	private String cardHolderLastName;
	private int expYear;
	private int expMonth;
	private String ccType;
	public Card() 
	{
		memberId = 0;
		creditCardCCV = 0;
		creditCardNumber = null;
		cardHolderFirstName = null;
		cardHolderLastName = null;
		expYear = 0;
		expMonth = 0;
		ccType = null;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getCreditCardCCV() {
		return creditCardCCV;
	}
	public void setCreditCardCCV(int creditCardCCV) {
		this.creditCardCCV = creditCardCCV;
	}
	public String getCardHolderFirstName() {
		return cardHolderFirstName;
	}
	public void setCardHolderFirstName(String cardHolderFirstName) {
		this.cardHolderFirstName = cardHolderFirstName;
	}
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	public String getCardHolderLastName() {
		return cardHolderLastName;
	}
	public void setCardHolderLastName(String cardHolderLastName) {
		this.cardHolderLastName = cardHolderLastName;
	}
	public int getExpYear() {
		return expYear;
	}
	public void setExpYear(int expYear) {
		this.expYear = expYear;
	}
	public int getExpMonth() {
		return expMonth;
	}
	public void setExpMonth(int expMonth) {
		this.expMonth = expMonth;
	}
	public String getCcType() {
		return ccType;
	}
	public void setCcType(String ccType) {
		this.ccType = ccType;
	}
}
