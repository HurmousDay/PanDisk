package org.etspace.abc.jdbc;
import java.sql.*;

public class DbBean {
	private Statement stmt=null;
	private Connection conn=null;
	ResultSet rs=null;
	public DbBean() {}
	//打开链接
	public void openConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC","root","123456");
		}
		catch (ClassNotFoundException e) {
			System.err.println("openConn:"+e.getMessage());
		}
		catch (SQLException e) {
			System.err.println("openConn:"+e.getMessage());
		}
		catch (Exception e) {
			System.err.println("openConn:"+e.getMessage());
		}
	}
	//执行查询类的SQL语句
	public ResultSet executeQuery(String sql) {
		rs = null;
		try {
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs=stmt.executeQuery(sql);
		}
		catch (SQLException e) {
			System.err.println("executeQuery:"+e.getMessage());
		}
		return rs;
	}
	//执行更新类的SQL语句
	public int executeUpdate(String sql) {
		int n = 0;
		try {
			stmt=conn.createStatement();
			n=stmt.executeUpdate(sql);
		}
		catch(Exception e) {
			System.out.print(e.toString());
		}
		return n;
	}
	//关闭链接
	public void closeConnection() {
		try {
			if (rs != null) {
				rs.close();
			}
		}
		catch(SQLException e) {
			System.err.println("closeRs:"+e.getMessage());
		}
		try {
			if (stmt != null) {
				stmt.close();
			}
		}
		catch(SQLException e) {
			System.err.println("closeStmt:"+e.getMessage());
		}
		try {
			if (conn != null) {
				conn.close();
			}
		}
		catch(SQLException e) {
			System.err.println("closeConn:"+e.getMessage());
		}
	}
}
