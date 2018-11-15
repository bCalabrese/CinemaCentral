package bean;

import java.io.Serializable;

// User bean
public class UserBean implements Serializable {
	private static final long serialVersionUID = 367L;
	
	private int memberID;
	private boolean sessionValid;
	private String genrePreference;
	private String firstName;
	
	public UserBean() {
		memberID = -1;
		sessionValid = false;
		genrePreference = null;
		firstName = null;
	}
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public boolean isSessionValid() {
		return sessionValid;
	}
	public void setSessionValid(boolean sessionValid) {
		this.sessionValid = sessionValid;
	}
	public String getGenrePreference() {
		return genrePreference;
	}
	public void setGenrePreference(String genrePreference) {
		this.genrePreference = genrePreference;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	
	
	
}
