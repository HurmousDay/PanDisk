<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
</head>
<body>
<header>
	<div class="mdui-toolbar mdui-color-blue-grey">
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
		<span class="mdui-typo-title">用户信息</span>
		<div class="mdui-toolbar-spacer"></div>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
	</div>
</header>
<div align="center" class="mdui-color-blue-grey-400" >
	<div class="mdui-typo-display-2-opacity"><strong>Pan 云盘</strong></div>
	<div class="mdui-typo-display-1-opacity"><em>Pan Cloud Disk</em></div>
</div>
<div align="center" style="margin-top:0%" class="mdui-color-blue-grey-300">


	<br>
	<div class="mdui-typo-display-3 " style="padding-top:3%;padding-bottom:3%">用户信息</div>
</div>

<div align="center">

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
	<div class="mdui-row  mdui-color-blue-grey-100 " style="padding-top:5%;padding-bottom:5%" >
		<div class="mdui-col-xs-4 "></div>
		<div class="mdui-col-xs-4 ">

	<div class="mdui-table-fluid">
		<table  class="mdui-table">
		<tr><td>用户名：</td><td><%=username %></td></tr>
		<tr><td>密码：</td><td><%=password %></td></tr>
		<tr><td>性别：</td><td><%=sex %></td></tr>
		<tr><td>学校：</td><td><%=school %></td></tr>
		</table>
	</div>
		</div>
		<div class="mdui-col-xs-4 "></div>
	</div>
	<br>
	<button id="b1" class="mdui-btn mdui-ripple mdui-color-grey">[返回主界面]</button>
	<button id="b2" class="mdui-btn mdui-ripple mdui-color-grey">[返回管理员界面]</button>
	<script type="text/javascript">
		var b1 = document.getElementById('b1')
		b1.onclick = function () {window.location.href = '../index.jsp'}
		var b2 = document.getElementById('b2')
		b2.onclick = function () {window.location.href = 'All.jsp'}
	</script>
</div>
</body>
</html>