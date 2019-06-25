<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String school = request.getParameter("school");
		try {
			String sql="insert into user(username,password,sex,school)";
			sql = sql+"values('"+username+"','"+password+"','"+sex+"','"+school+"')";
			myDbBean.openConnection();
			int n = myDbBean.executeUpdate(sql);
			if (n > 0) {
				//out.print("用户记录增加成功！");
			}else{
				out.print("用户记录增加失败！");
			}
			myDbBean.closeConnection();
		}
		catch (Exception e) {
			out.print(e.toString());
		}
	%>
	<header>
		<div class="mdui-toolbar mdui-color-blue-grey">
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
			<span class="mdui-typo-title">系统界面</span>
			<div class="mdui-toolbar-spacer"></div>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
		</div>
		<div class="mdui-progress">
			<div class="mdui-progress-indeterminate mdui-color-blue-grey-800"></div>
		</div>
	</header>
	<div class="mdui-row" style="margin-top:10%">
		<div class="mdui-col-xs-5 "></div>
		<div class="mdui-col-xs-2 ">
			<div class="mdui-container mdui-p-t-12">
				<div class="mdui-card mdui-hoverable">
					<div class="mdui-card-media">
						<img src="https://cn.bing.com/th?id=OIP.K7qsvFFIA4AgCqnqrmJKogAAAA&pid=Api&rs=1&p=0" />
					</div>
					<div class="mdui-card-actions mdui-card-actions-stacked" align="center">
						<h2 >录入成功!</h2>

						<a href="../index.jsp"> [返回主界面] </a>
						<a href="All.jsp"> [返回管理员界面] </a>
					</div>
				</div>
			</div>
		</div>
		<div class="mdui-col-xs-5 "></div>
	</div>


</body>
</html>