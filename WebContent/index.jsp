<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录系统</title>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
</head>
<body>
	<%
		session.setAttribute("curUse", null);
		session.setAttribute("father", null);
		session.setAttribute("admin","0");

		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	</header>
<div class="mdui-color-blue-grey-200" align="center" style="padding-top:5%;padding-bottom:5%">

	<div class="mdui-typo-display-4 "><strong>Pan 云盘</strong></div>
	<div class="mdui-typo-display-2"><em>Pan Cloud Disk</em></div>
</div>
	<div class="mdui-row mdui-color-blue-grey-100" style="margin-top:0%">

		<div class="mdui-col-xs-5 "></div>
		<div class="mdui-col-xs-2 ">
			<div class="mdui-card mdui-hoverable">
				<div class="mdui-card-media">
					<img src="https://salemlongville.org/wp-content/uploads/2017/08/Tech-Icon-450x450.png" />
				</div>
				<div class="mdui-card-actions" >
					<div class="mdui-row">
						<div class="mdui-col-xs-4 "><button id="b1" class="mdui-btn mdui-ripple">登录</button></div>
						<div class="mdui-col-xs-4 "><button id="b2" class="mdui-btn mdui-ripple">修改密码</button></div>
						<div class="mdui-col-xs-4 "><button id="b3" class="mdui-btn mdui-ripple">注册</button></div>
					</div>
					 <script type="text/javascript">
							var b1 = document.getElementById('b1')
							b1.onclick = function () {window.location.href = 'syslogin/login.jsp'}
							var b2 = document.getElementById('b2')
							b2.onclick = function () {window.location.href = 'sysReset/ResetPassword.jsp'}
							var b3 = document.getElementById('b3')
							b3.onclick = function () {window.location.href = 'sysRegister/Register.jsp'}
					</script>
			</div>
		</div>
		<div class="mdui-col-xs-5 "></div>
	</div>

</body>
</html>