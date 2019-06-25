<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>no</title>
</head>
<body>

<div align="center">
	<h1> 人员信息  </h1>
	<%
		myDbBean.openConnection();
		String username = request.getParameter("username").trim();
		String sql = "select*from user where username like '%"+username+"%';";
		System.out.println(sql);
		ResultSet rs = myDbBean.executeQuery(sql);
		if(!rs.next()) {
			session.setAttribute("error","当前用户不存在！！！");
		} else {
			session.setAttribute("now",rs.getString("username"));
		}
	%>
	 <jsp:forward page="All.jsp"></jsp:forward>
</div>
</body>
</html>