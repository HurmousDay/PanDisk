<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String school = request.getParameter("school");
		try {
			String sql1 = "select*from user where username='"+username+"' and school='"+school+"';"; 
			
			myDbBean.openConnection();
			
			ResultSet rs = myDbBean.executeQuery(sql1);
			rs.last();
			int n = rs.getRow();
			if (n == 0) {
				out.println("用户信息错误，修改失败！");
			}else {
				%>
				<jsp:forward page="Reset.jsp"></jsp:forward>
				<%
			}
			myDbBean.closeConnection();
		}
		catch (Exception e) {
			out.print(e.toString());
		}
	%>
	<a href="../index.jsp"> [返回] </a>
</body>
</html>