<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册失败！</title>
</head>
<body>
	<h1> 注册失败！ </h1>
	<div>
		<%
			String error = (String)session.getAttribute("error");
			if (error != null && !error.equals("0")) { 
				out.print(error);
				session.setAttribute("error", "0");
			}
		%>
	</div>
	<a href="../index.jsp"> [返回] </a>
</body>
</html>