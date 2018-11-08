package account;

public class TestDaos {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserAccount user = UserDao.attemptLogin("rshelby@yahoo.com", "sesame");
		if (user == null) {
			System.out.println("Null!");
		}
		else {
			System.out.println(user.getFirstName() + " has been logged in.");
		}
	}

}
