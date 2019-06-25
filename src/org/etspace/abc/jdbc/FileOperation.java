package org.etspace.abc.jdbc;
import java.sql.*;
import java.util.ArrayList;
import org.etspace.abc.jdbc.FileBean;

public class FileOperation {
	private DbBean db = new DbBean();
	public int Insert(FileBean file) {
		int flag = -1;
		db.openConnection();
		String filename = file.getFilename();
		String updateTime = file.getUpdateTime();
		String size = file.getSize();
		String type = file.getType();
		String location = file.getLocation();
		String use  = file.getUsername();
		String fa = file.getFather();
		String sql = "insert into file(filename,updateTime,size,type,location,username,father)";
		sql += "values ('"+filename+"','"+updateTime+"','"+size+"','"+type+"','"+location+"','"+use+"','"+fa+"')";
		int n = db.executeUpdate(sql);
		if (n == 1) {
			flag = 1;
		}else {
			flag = 0;
		}
		db.closeConnection();
		return flag;
	}
	public int Delete(String filename,String username) {
		int flag = -1;
		db.openConnection();
		String sql = "delete from file where filename = '"+filename+"' AND username ='" + username + "' ;";
		System.out.println("Delete:");
		System.out.println(sql);
		int n = db.executeUpdate(sql);
		if (n == 1) {
			flag = 1;
		}else {
			flag = 0;
		}
		db.closeConnection();
		return flag;
	}
	public String Findfather(String filename,String username)  {
		String father = "主界面";
		db.openConnection();
		try {
			String sql = "select*from file where filename = '"+filename+"' AND username ='" + username + "' ;";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				father = rs.getString("father");
			}
		}
		catch (SQLException e) {
			System.out.println(e.toString());
		}
		
		db.closeConnection();
		return father;
	}
	public ArrayList<FileBean> Query(String use,String fa) throws SQLException {
		System.out.println(use);
		ArrayList<FileBean> li = new ArrayList<FileBean>();
		db.openConnection();
		try {
			
			String sql = "select*from file where username = '" + use + "'";
			sql += " AND father = '" + fa + "'";
			sql += " Order By type";
			System.out.println("FileOperation : "+sql);
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {
				String filename = rs.getString("filename");
				String updateTime = rs.getString("updateTime");
				String size = rs.getString("size");
				String type = rs.getString("type");
				String location = rs.getString("location");
				String username = rs.getString("username");
				String father = rs.getString("father");
				FileBean file = new FileBean(filename,updateTime,size,type,location,username,father);
				
				li.add(file);
			}
		}
		catch (SQLException e) {
			System.out.print(e.toString());
		}
		
		db.closeConnection();
		return li;
	}
	
}
