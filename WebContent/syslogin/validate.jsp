<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"> </jsp:useBean>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>验证界面</title>
</head>
<body>
	<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	boolean validated=false; 
	//查询用户表中的记录
	String sql="select*from user";
	myDbBean.openConnection();
	ResultSet rs=myDbBean.executeQuery(sql);
	while(rs.next()) {
 		if((rs.getString("username").trim().compareTo(username)==0)&&
 			(rs.getString("password").trim().compareTo(password)==0)) {
 			validated=true;
 		}
 	}
	rs.close();
	myDbBean.closeConnection();
	if (username.equals("admin") && validated) {
		response.sendRedirect("../SysAdmin/All.jsp");
	}
	else if (validated) { //验证成功跳转到成功界面
	%>
		<jsp:forward page="welcome.jsp"></jsp:forward>
	<%
		} else { //验证失败跳转到失败界面
	%>
		<jsp:forward page="error.jsp"></jsp:forward>
	<%	
		}
	%>
</body>
</html>