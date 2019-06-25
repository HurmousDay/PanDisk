package org.etspace.abc.jdbc;

public class UserBean {
	private String username;
	private String password;
	private String sex;
	private String school;
	public UserBean(String username, String password, String sex, String school) {
		super();
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.school = school;
	}
	public UserBean(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public UserBean() {
		super();
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
}
