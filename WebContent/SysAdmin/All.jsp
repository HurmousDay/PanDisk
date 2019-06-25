<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
<meta charset="UTF-8">
<title>用户管理</title>
</head>
<body>
<header>
	<div class="mdui-toolbar mdui-color-blue-grey">
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
		<span class="mdui-typo-title">人员信息</span>
		<div class="mdui-toolbar-spacer"></div>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
		<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
	</div>
</header>
<div align="center" style="margin-top:0%" class="mdui-color-blue-grey-400" >
	<div class="mdui-typo-display-2-opacity"><strong>Pan 云盘</strong></div>
	<div class="mdui-typo-display-1-opacity"><em>Pan Cloud Disk</em></div>
	<div class="mdui-typo-caption">欢迎管理员登录</div>
</div>
<div align="center" style="padding-top:1%;padding-bottom:1%" class="mdui-color-blue-grey-300">
	<br>
	<div class="mdui-typo-display-1 ">用户信息</div>
</div>
<div class="mdui-row mdui-color-blue-grey-100" style="margin-top:0%">
	<div class="mdui-col-xs-4 " ></div>

	<div class="mdui-col-xs-4 ">
		<%-- 查询框 --%>
		<div class="mdui-row ">
			<div class="mdui-col-xs-12">
				<div class="mdui-textfield mdui-textfield-expandable mdui-float-left">
					<button class="mdui-textfield-icon mdui-btn mdui-btn-icon mdui-color-yellow-400"><i class="mdui-icon material-icons">search</i></button>
					<form action="search.jsp">
						<input class="mdui-textfield-input" type="text" placeholder="查询人员" name="username"/>
					</form>
					<button class="mdui-textfield-close mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">close</i></button>
				</div>
			</div>
		</div>

		<%-- table --%>
		<%
			session.setAttribute("admin", "1");
			String pageNo = request.getParameter("pageno");
			int pageSize=3;
			int pageCount;
			int rowCount;
			int pageCurrent;
			int rowCurrent;
			if (pageNo == null || pageNo.trim().length()==0) {
				pageCurrent = 1;
			}else {
				pageCurrent=Integer.parseInt(pageNo);
			}

			try {
				myDbBean.openConnection();
				String sql = "select*from user";
				String now = (String)session.getAttribute("now");
				if (now!=null && !now.equals("0")) {
					sql += " where username like '%"+now+"%'";
					session.setAttribute("now", "0");
				}
				ResultSet rs = myDbBean.executeQuery(sql);
				rs.last();
				rowCount = rs.getRow();
				pageCount = (rowCount + pageSize-1)/pageSize;
				if (pageCurrent>pageCount) pageCurrent=pageCount;
				if (pageCurrent<1) 		   pageCurrent=1;
		%>

		<div class="mdui-table-fluid mdui-color-lime-100" style="height:400px">

			<table class="mdui-table mdui-color-lime-100">
				<thead>
				<tr><td>用户名</td><td>性别</td><td>学校</td><td>操作</td>
				</thead>
				<tbody>
				<%
					rs.beforeFirst();
					rowCurrent=1;
					char cnt='0';
					while (rs.next()) {
						if(rowCurrent>(pageCurrent-1)*pageSize && rowCurrent<=pageCurrent*pageSize) {
							String username = rs.getString("username");
							String sex = rs.getString("sex");
							String school = rs.getString("school");
							cnt++;
				%>
				<tr><td><%=username%></td><td><%=sex%></td><td><%=school%></td>
					<td>
						<%--<a href="Info.jsp?username=<%=username %>">详情</a>
						<a href="Update.jsp?username=<%=username%> ">修改</a>
						<a href="Delete.jsp?username=<%=username%> ">删除</a>
						<a href="../AdminJoinServlet?username=<%=username%> ">进入其网盘空间</a>--%>
						<%-- menu --%>

						<button class="mdui-btn mdui-btn-icon mdui-color-theme-accent mdui-ripple" mdui-menu="{target: '#example-attr<%=""+cnt%>'}"><i class="mdui-icon material-icons">add</i></button>
							<ul class="mdui-menu" id="example-attr<%=""+cnt%>">
								<li class="mdui-menu-item">
									<a href="Info.jsp?username=<%=username %>">
										<i class="mdui-menu-item-icon mdui-icon material-icons">remove_red_eye</i>详情
									</a>
								</li>
								<li class="mdui-menu-item">
									<a href="Update.jsp?username=<%=username%>" class="mdui-ripple">
										<i class="mdui-menu-item-icon mdui-icon material-icons">update</i>修改
									</a>
								</li>
								<li class="mdui-divider"></li>
								<li class="mdui-menu-item">
									<a href="Delete.jsp?username=<%=username%>" class="mdui-ripple">
										<i class="mdui-menu-item-icon mdui-icon material-icons">delete</i>删除
									</a>
								</li>
								<li class="mdui-menu-item">
									<a href="../AdminJoinServlet?username=<%=username%>" class="mdui-ripple">
										<i class="mdui-menu-item-icon mdui-icon material-icons">subdirectory_arrow_left</i>进入其网盘空间
									</a>
								</li>
							</ul>

					</td></tr>
				<%
						}
						rowCurrent++;
					}
				%>
				</tbody>
			</table>
		</div>
		<%-- footer --%>
		<div align="center">
		<form method="POST" action="All.jsp">
			第<%=pageCurrent %>页 共<%=pageCount %>页&nbsp;

			<%if(pageCurrent > 1) { %>

			<a href="All.jsp?&pageno=1"><i class="mdui-icon material-icons mdui-color-blue-grey">first_page</i></a>
			<a href="All.jsp?&pageno=<%=pageCurrent-1 %>"><i class="mdui-icon material-icons mdui-color-blue-grey">arrow_back</i></a>
			<%} %>
			&nbsp;
			<%if(pageCurrent<pageCount) { %>

			<a href="All.jsp?&pageno=<%=pageCurrent+1 %>"><i class="mdui-icon material-icons mdui-color-blue-grey">arrow_forward</i></a>
			<a href="All.jsp?&pageno=<%=pageCount %>"><i class="mdui-icon material-icons mdui-color-blue-grey">last_page</i></a>
			<%} %>
			&nbsp;

		</form>
		<%
				myDbBean.closeConnection();
			}
			catch(SQLException e) {
				out.println(e.getMessage());
			}
			catch(Exception e) {
				out.println(e.toString());
			}

		%>
			<div class="mdui-btn-group">
				<button type="button" class="mdui-btn" id="b11"><i class="mdui-icon material-icons">[返回主界面]</i></button>
				<button type="button" class="mdui-btn" id="b22"><i class="mdui-icon material-icons mdui-btn-active">录入用户信息</i></button>
				<button type="button" class="mdui-btn" id="b33"><i class="mdui-icon material-icons">[返回管理员界面]</i></button>
			</div>
			<script type="text/javascript">
				var b1 = document.getElementById('b11')
				b1.onclick = function () {window.location.href = '../index.jsp'}
				var b2 = document.getElementById('b22')
				b2.onclick = function () {window.location.href = 'Add.jsp'}
				var b3 = document.getElementById('b33')
				b3.onclick = function () {window.location.href = 'All.jsp'}
			</script>



		<div style=color:red><%
			String error = (String)session.getAttribute("error");
			if (error != null && !error.equals("0")) {
				out.print(error);
				session.setAttribute("error", "0");
			}%>
		</div>

	
</body>
</html>