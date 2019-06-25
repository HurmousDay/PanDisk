<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	return (true);
}
</script>
<head>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<header>
	<div class="mdui-toolbar mdui-color-blue-grey">
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
		<span class="mdui-typo-title">用户登录</span>
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
	<div class="mdui-typo-display-3 " style="padding-top:3%;padding-bottom:3%">用户登录</div>
</div>
<div class="mdui-row  mdui-color-blue-grey-100 " style="padding-top:5%;padding-bottom:5%" >
	<div class="mdui-col-xs-5 "></div>
	<div class="mdui-col-xs-2 ">
		<div class="mdui-card mdui-hoverable mdui-color-lime-200">

			<div align="center" class=" mdui-color-lime-100">
				<form action="../LoginServletByDB" method="post" onSubmit="return check(this)">

					<div style=color:red>
						<%
							String error = (String)session.getAttribute("error");
							if (error != null && !error.equals("0")) {
								out.print(error);
								session.setAttribute("error", "0");
							}
						%>
					</div>
					<div class="mdui-textfield mdui-textfield-floating-label">
						<label class="mdui-textfield-label">User name</label>
						<input class="mdui-textfield-input" name="username" type="text" required/>
						<div class="mdui-textfield-error" style="font-size:5px">username can't be blank</div>
					</div>

					<div class="mdui-textfield mdui-textfield-floating-label">
						<label class="mdui-textfield-label">Password</label>
						<input class="mdui-textfield-input" name="password" type="password"/>
						<div class="mdui-textfield-error">six letters at least, upper lower case</div>
						<div class="mdui-textfield-helper" >password can't be blank</div>
					</div>
					<!--<table>
						<tr><td align="right">用户名：</td><td><input type="text"name="username"></td></tr>
						<tr><td align="right">密码：</td><td><input type="password"name="password"></td></tr>
					</table>-->
					<br>

					<input type="submit" class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey"  value="登录">
					<button id="b1" class="mdui-btn mdui-ripple mdui-color-grey">[返回]</button>
					<script type="text/javascript">
						var b1 = document.getElementById('b1')
						b1.onclick = function () {window.location.href = '../index.jsp'}
					</script>
				</form>

			</div>

		</div>
	</div>
	<div class="mdui-col-xs-5 "></div>
</div>

	
</body>
</html>