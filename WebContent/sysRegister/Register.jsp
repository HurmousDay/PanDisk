<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript">
function check(theForm) {
	if (theForm.username.value=="") {
		alert("请输入用户名！");
		theForm.username.focus();
		return (false);
	}
	if (theForm.password.value=="") {
		alert("请输入密码！");
		theForm.password.focus();
		return (false);
	}
	if (theForm.school.value=="") {
		alert("请输入学校！");
		theForm.school.focus();
		return (false);
	}
	return (true);
}
</script>
<html> 
<head>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>注册信息</title>
</head>
<body>
	<header>
		<div class="mdui-toolbar mdui-color-blue-grey">
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
			<span class="mdui-typo-title">注册信息</span>
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
		<div class="mdui-typo-display-3 " style="padding-top:3%;padding-bottom:3%">用户注册</div>
	</div>
	<div class="mdui-row  mdui-color-blue-grey-100 " style="padding-top:5%;padding-bottom:5%" >
		<div class="mdui-col-xs-3 "></div>
		<div class="mdui-col-xs-6 ">
			<div class="mdui-card mdui-hoverable mdui-color-lime-200">
				<div align="center">

					<form id="form1" name="form1" method="post" action="../RegisterServlet"onSubmit="return check(this)">
						<div class="mdui-table-fluid">
							<table  class="mdui-table mdui-color-lime-100">
								<tr><td width="10"> 用户名</td><td>
									<div class="mdui-textfield mdui-textfield-floating-label">
										<label class="mdui-textfield-label">User name</label>
										<input id="username" class="mdui-textfield-input" name="username" type="text" required/>
										<div class="mdui-textfield-error" style="font-size:5px">username can't be blank</div>
									</div>
								</td></tr>
								<tr><td>密码</td><td>

									<div class="mdui-textfield mdui-textfield-floating-label">
										<label class="mdui-textfield-label">Password</label>
										<input id="password" class="mdui-textfield-input" name="password" type="password" pattern="^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$" required/>
										<div class="mdui-textfield-error">six letters at least, upper lower case</div>
										<div class="mdui-textfield-helper" >six letters at least, upper lower case</div>
									</div>
								</td></tr>

								<tr><td>学校</td><td>

									<div class="mdui-textfield mdui-textfield-floating-label">
										<label class="mdui-textfield-label">School</label>
										<input id="school" class="mdui-textfield-input" name="school" type="text" required/>
										<div class="mdui-textfield-error" style="font-size:5px">school can't be blank</div>
									</div>
								</td></tr>
								<tr><td>性别</td><td>
									<label class="mdui-radio">
										<input type="radio" name="sex"  value="男" checked="checked"/>
										男
										<i class="mdui-radio-icon"></i>

									</label>
									<label class="mdui-radio">
										<input type="radio" name="sex" value="女"/>
										女
										<i class="mdui-radio-icon"></i>

									</label>
								</td></tr>
							</table>
						</div>

						<input name="submit" type="submit" class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey" value="确定"/>
						<input name="reset"	type="reset" class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey" value="重置"/>

					</form>
					<button id="b1" class="mdui-btn mdui-ripple mdui-color-grey">[返回]</button>
					<script type="text/javascript">
						var b1 = document.getElementById('b1')
						b1.onclick = function () {window.location.href = '../index.jsp'}
					</script>

				</div>
			</div>
		</div>
		<div class="mdui-col-xs-3 "></div>
	</div>

</body>
</html>