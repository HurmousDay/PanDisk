<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>用户删除</title>
</head>
<body>
<header>
	<div class="mdui-toolbar mdui-color-blue-grey">
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
		<span class="mdui-typo-title">用户删除</span>
		<div class="mdui-toolbar-spacer"></div>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
	</div>
</header>
<div align="center">
	<h1> 用户信息  </h1>
	<%
		myDbBean.openConnection();
		String username = request.getParameter("username").trim();
		String sql = "select*from user where username = '"+username+"';";
		ResultSet rs = myDbBean.executeQuery(sql);
		rs.next();

		String password = rs.getString("password");
		String sex = rs.getString("sex");
		String school = rs.getString("school");
		myDbBean.closeConnection();
	%>
	<div class="mdui-container mdui-p-t-5">
		<div class="mdui-table-fluid">
			<table  class="mdui-table">
				<tr><td>用户名：</td><td><%=username %></td></tr>
				<tr><td>密码：</td><td><%=password %></td></tr>
				<tr><td>性别：</td><td><%=sex %></td></tr>
				<tr><td>学校：</td><td><%=school %></td></tr>
			</table>
		</div>
	</div>
	<br>
	<h3 style=color:red>是否要删除此用户信息</h3>
	<a href="DeleteCheck.jsp?&username=<%=username%>">[确认]</a>
	<a href="All.jsp">[取消]</a>
</div>
<%--<div align="center">
	<h1> 用户信息  </h1>
	<%
		myDbBean.openConnection();
		String username = request.getParameter("username").trim();
		String sql = "select*from user where username = '"+username+"';";
		ResultSet rs = myDbBean.executeQuery(sql);
		rs.next();
		
		String password = rs.getString("password").trim();
		String sex = rs.getString("sex").trim();
		String school = rs.getString("school").trim();
		myDbBean.closeConnection();
	%>
	
	<table border="1">
	<tr><td>用户名：</td><td><%=username %></td></tr>
	<tr><td>密码：</td><td><%=password %></td></tr>
	<tr><td>性别：</td><td><%=sex %></td></tr>
	<tr><td>学校：</td><td><%=school %></td></tr>
	</table>
	<br>
	<h3 style=color:red>是否要删除此用户信息</h3>
	<a href="DeleteCheck.jsp?&username=<%=username%>">[确认]</a>
	<a href="All.jsp">[取消]</a>
</div>--%>
</body>
</html>