package org.etspace.abc.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ResetBean {
	public int resetFirst(UserBean us) {
		int flag = -1;
		String username = us.getUsername();
		String school = us.getSchool();
		try {
			String sql = "select*from user where username='"+username+"'and school='"+school+"';";
			DbBean myDbBean = new DbBean();
			myDbBean.openConnection();
			ResultSet rs = myDbBean.executeQuery(sql);
			if (rs.next()) {
				flag = 1;
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
	
	public int resetSecond(UserBean us) {
		int flag = -1;
		String username = us.getUsername();
		String password = us.getPassword();
		String sex = us.getSex();
		String school = us.getSchool();
		DbBean myDbBean = new DbBean();
		
		try {
			String sql="UPDATE user SET password='"+password+"',"+"sex='"+sex+"',"+"school='"+school;
			sql += "' where username='" + username + "';";
			myDbBean.openConnection();
			int n = myDbBean.executeUpdate(sql);
			if (n > 0) {
				flag = 1;
			}else{
				flag = 0;
			}
			myDbBean.closeConnection();
		}
		catch (Exception e) {
			flag = -1;
		}
		return flag;
	}
}
