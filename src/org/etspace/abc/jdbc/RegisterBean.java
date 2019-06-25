package org.etspace.abc.jdbc;

public class RegisterBean {
	public int register(UserBean us) {
		int flag = -1;
		String username = us.getUsername();
		String password = us.getPassword();
		String sex = us.getSex();
		String school = us.getSchool();
		try {
			String sql="insert into user(username,password,sex,school)";
			sql = sql+"values('"+username+"','"+password+"','"+sex+"','"+school+"')";
			DbBean myDbBean = new DbBean();
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
