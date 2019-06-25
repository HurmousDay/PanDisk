<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户删除</title>
</head>
<body>
<div align="center">
	<h1> 用户信息  </h1>
	<%
		myDbBean.openConnection();
		String username = request.getParameter("username").trim();
		String sql = "delete from user where username = '"+username+"';";
		int n = myDbBean.executeUpdate(sql);
		if (n != 0) {
			out.println("删除成功！");
		}else {
			out.println("删除失败！");
		}
		myDbBean.closeConnection();
	%>
	
	<a href="../index.jsp">[返回主界面] </a>
	<a href="All.jsp">[返回管理员界面] </a>
</div>
</body>
</html>