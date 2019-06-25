<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String school = request.getParameter("school");
		try {
			String sql="UPDATE user SET password='"+password+"',"+"sex='"+sex+"',"+"school='"+school;
			sql += "' where username='" + username + "';";
			myDbBean.openConnection();
			int n = myDbBean.executeUpdate(sql);
			if (n > 0) {
				out.print("修改成功！");
			}else{
				out.print("修改失败！");
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