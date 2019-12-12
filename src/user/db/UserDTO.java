package user.db;

import java.sql.Timestamp;

public class UserDTO {
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	private int userAdmin;
	private Timestamp userJoinDate;

	
	public Timestamp getUserJoinDate() {
		return userJoinDate;
	}
	public void setUserJoinDate(Timestamp userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public String getUserID() {
		return userID;
	}
	public int getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(int userAdmin) {
		this.userAdmin = userAdmin;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}
