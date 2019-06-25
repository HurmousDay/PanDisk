package org.etspace.abc.jdbc;
import java.sql.*;

public class LoginBean {
	public int login(UserBean us) {
		int flag = -1;
		try {
			DbBean myDbBean = new DbBean();
			String username = us.getUsername();
			String password = us.getPassword();
			String sql = "select*from user where username='"+username+"'and password='"+password+"';";
			myDbBean.openConnection();
			ResultSet rs = myDbBean.executeQuery(sql);
			if (rs.next()) {
				if (username.equals("admin")) {
					flag = 2;
				}else flag = 1;
			}else {
				flag = 0;
			}
			rs.close();
			myDbBean.closeConnection();
		}
		catch (SQLException e) {
			flag = -1;
		}
		return flag;
	}
}
