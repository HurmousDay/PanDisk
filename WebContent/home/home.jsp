<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.etspace.abc.jdbc.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传实例 </title>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.css" rel="stylesheet"type="text/css"/>
</head>

<script type="text/javascript">
function check(theForm) {
	if (theForm.foldername.value=="") {
		alert("请输入文件夹的名字！");
		theForm.foldername.focus();
		return (false);
	}
	return (true);
}
</script>

<body>
	<% 
		String curUse = (String)session.getAttribute("curUse");
		String father = (String)session.getAttribute("father");
		String admin = (String)session.getAttribute("admin");
		if (curUse==null) {
			curUse = "tmp";
			session.setAttribute("curUse", "tmp");
		}
		if (father==null) {
			father =  "主界面";
			session.setAttribute("father", "主界面");
		}
		if (admin==null) {
			admin = "0";
			session.setAttribute("admin", "0");
		}
	%>
	<header>
		<div class="mdui-toolbar mdui-color-blue-grey">
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">menu</i></a>
			<span class="mdui-typo-title">欢迎光临！</span>
			<div class="mdui-toolbar-spacer"></div>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
		</div>
	</header>

	<div class=" mdui-color-blue-grey" align="right" >
		<div class="mdui-chip mdui-color-amber-200">
			<span class="mdui-chip-icon mdui-color-blue-grey-800"><i class="mdui-icon material-icons">face</i></span>
			<span class="mdui-chip-title"style="color:#000000">当前登录用户：<%=curUse %></span>
		</div>
		<div class="mdui-chip mdui-color-amber-200">
			<span class="mdui-chip-icon mdui-color-blue-grey-800"><i class="mdui-icon material-icons">location_on</i></span>
			<span class="mdui-chip-title" style="color:#000000"> 当前位置：<%=father %></span>
		</div>
		<div class="mdui-chip mdui-color-purple-200" >
			<span class="mdui-chip-title "> <a href="../index.jsp"> [退出登录] </a></span>
			<span class="mdui-chip-delete"><i class="mdui-icon material-icons">cancel</i></span>
		</div>
		<%
			if (admin.equals("1")) {
		%>
		<div class="mdui-chip mdui-color-red-600">
			<span class="mdui-chip-title "><a href="../SysAdmin/All.jsp">[回到管理员界面] </a></span>
			<span class="mdui-chip-delete"><i class="mdui-icon material-icons">cancel</i></span>
		</div>

		<%
			}
		%>
	</div>
		<div align="center" style="margin-top:0%" class="mdui-color-blue-grey-200" >
			<div class="mdui-typo-display-2-opacity"><strong>Pan 云盘</strong></div>
			<div class="mdui-typo-display-1-opacity"><em>Pan Cloud Disk</em></div>
		</div>
		<div align="center" style="padding-top:1%;padding-bottom:1%" class="mdui-color-blue-grey-100">


			<div class="mdui-typo-display-1 ">我的云盘</div>
		</div>




	<div class="mdui-row mdui-color-blue-grey-200" style="margin-top:0%">

		<div class="mdui-col-xs-1 " ></div>
		<div class="mdui-col-xs-10 ">
			<%-- 查询框 && back --%>
			<div class="mdui-row">
				<div class="mdui-col-xs-1" >
					<div class="mdui-btn-group">
						<button type="button" class="mdui-btn mdui-color-blue-grey-800" id="b1"><i class="mdui-icon material-icons">keyboard_backspace</i>返回上一级目录</button>
					</div>
				</div>
				<div class="mdui-col-xs-11">
					<div class="mdui-textfield mdui-textfield-expandable mdui-float-right">
						<button class="mdui-textfield-icon mdui-btn mdui-btn-icon mdui-color-yellow-200"><i class="mdui-icon material-icons">search</i></button>
						<input class="mdui-textfield-input" type="text" placeholder="Search" width="20"/>
						<button class="mdui-textfield-close mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">close</i></button>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var b1 = document.getElementById('b1')
				b1.onclick = function () {window.location.href = '../GetFatherServlet'}
			</script>
			<div class="mdui-table-fluid mdui-color-lime-100">

				<table class="mdui-table mdui-color-lime-100">
					<thead>
					<tr  >
						<th>文件名</th>
						<th>更新时间</th>
						<th>大小</th>
						<th>类型</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<%
						FileOperation file = new FileOperation();
						ArrayList<FileBean> li = (ArrayList<FileBean>) file.Query(curUse, father);
						for(FileBean  item:li) {
							if (!item.getType().equals("afolder")) {
					%>
					<tr>
						<%
						if(item.getType().equals("doc")||item.getType().equals("docx")){
						%>
						<td><img src="https://mooc1-2.chaoxing.com/space/new/images/data/word.gif" width="18" height="18"></i><%=item.getFilename() %></td>
						<% }
							else if(item.getType().equals("pdf")) {%>
						<td><img src="https://mooc1-2.chaoxing.com/space/new/images/data/pdf.gif" width="18" height="18"></i><%=item.getFilename() %></td>
						<%}
							else if(item.getType().equals("png")||item.getType().equals("jpg")||item.getType().equals("png")){%>
						<td><img src="https://cn.bing.com/th?id=OIP.rErqVozi9DaZPU9zgRKJAgAAAA&pid=Api&w=314&h=279&rs=1&p=0" width="18" height="18"></i><%=item.getFilename() %></td>
						<%}
							else {%>
						<td><img src="https://mooc1-2.chaoxing.com/space/new/images/data/star.gif" width="18" height="18"></i><%=item.getFilename() %></td>
						<%}%>

						<td><%=item.getUpdateTime() %></td>
						<td><%=item.getSize() %></td>
						<td><%=item.getType() %></td>
						<td>
							<a href="../DownLoadServlet?filename=<%=item.getFilename()%>"><i class="mdui-icon material-icons mdui-color-blue-grey">file_download</i></a>
							<a href="../DeleteServlet?filename=<%=item.getFilename()%>"><i class="mdui-icon material-icons mdui-color-blue-grey">delete</i></a>

							<%--	<a href="../DownLoadServlet?filename=<%=item.getFilename()%>">
								<i class="mdui-icon material-icons">file_download</i>
							</a>

							<a href="../Delete Servlet?filename=<%=item.getFilename()%>">
								<i class="mdui-icon material-icons">delete</i>
							</a>--%>
						</td>

					</tr>
					<%
					}else {
					%>
					<tr>
						<td><i><img src="https://mooc1-2.chaoxing.com/space/new/images/data/folder.gif" width="18" height="14"></i><%=item.getFilename() %></td>
						<td><%=item.getUpdateTime() %></td>
						<td></td>
						<td>folder</td>
						<td>
							<a href="../GetInServlet?foldername=<%=item.getFilename()%>"><i class="mdui-icon material-icons mdui-color-blue-grey">subdirectory_arrow_left</i></a>
							<a href="../DeleteServlet?filename=<%=item.getFilename()%>"><i class="mdui-icon material-icons mdui-color-blue-grey">delete</i></a>

							<%--<a href="../GetInServlet?foldername=<%=item.getFilename()%>">
								<i class="mdui-icon material-icons">subdirectory_arrow_left</i>
							</a>
							<a href="../DeleteServlet?filename=<%=item.getFilename()%>">
								<i class="mdui-icon material-icons">delete</i>
							</a>--%>
						</td>
					</tr>
					<%
							}
						}
					%>
					</tbody>
				</table>
			</div>

		</div>
		<div class="mdui-col-xs-1 "></div>
	</div>

    <%--<div align="center">
		<h1>文件菜单 </h1>

			<table border="1" align="center">
			  <tr>
			    <th>文件名</th>
			    <th>更新时间</th>
			    <th>大小</th>
			    <th>类型</th>
			    <th>操作</th>
			  </tr>
    <%
    	FileOperation file = new FileOperation();
    	ArrayList<FileBean> li = (ArrayList<FileBean>) file.Query(curUse, father);
    	for(FileBean  item:li) {
    		if (!item.getType().equals("afolder")) {
    %>
			  <tr>
			    <td><%=item.getFilename() %></td>
			    <td><%=item.getUpdateTime() %></td>
			  	<td><%=item.getSize() %></td>
			  	<td><%=item.getType() %></td>
			  	<td>
			  	<a href="../DownLoadServlet?filename=<%=item.getFilename()%>">下载</a> 
			  	<a href="../DeleteServlet?filename=<%=item.getFilename()%>">删除</a>
			  	</td>
			  </tr>
    <%		
    		}else {
    %>
    		<tr>
			    <td><%=item.getFilename() %></td>
			    <td><%=item.getUpdateTime() %></td>
			  	<td></td> 
			  	<td>folder</td>
			  	<td> 
			  	<a href="../GetInServlet?foldername=<%=item.getFilename()%>">进入</a> 
			  	<a href="../DeleteServlet?filename=<%=item.getFilename()%>">删除</a>
			  	</td>
			  </tr>
    <%  
    		}
    	}
    %>
    		</table>
    	<div>--%>

    	</div>




	</div>

	<div class="mdui-tab mdui-color-blue-grey  mdui-tab-full-width" mdui-tab>

			<a href="#tab1" class="mdui-ripple mdui-ripple-white ">
			<i class="mdui-icon material-icons">photo_size_select_large</i>
			<label>drag&drop</label>
		</a>
		<a href="#tab2" class="mdui-ripple mdui-ripple-white">
			<i class="mdui-icon material-icons">create_new_folder</i>
			<label>create_new_folder</label>
		</a>
		<a href="#tab3" class="mdui-ripple mdui-ripple-white">
			<i class="mdui-icon material-icons">cloud_upload</i>
			<label>upload file</label>
		</a>

	</div>
	<div class="mdui-container-fluid "  style="margin-top:3%">
		<div id="tab1" >
			<div class="mdui-row">
				<div class="mdui-col-xs-5 "></div>
				<div class="mdui-col-xs-2 ">
					<div class="mdui-card mdui-hoverable">
						<div class="mdui-card-media">
							<img src="https://cn.bing.com/th?id=OIP.EMk9tTniX7NYjQSLs2zLqgAAAA&pid=Api&rs=1&p=0" />
							<div class="mdui-card-media-covered mdui-card-media-covered-transparent">
								<div class="mdui-card-primary">
									<div class="mdui-card-primary-title " >Drag</div>
									<div class="mdui-card-primary-subtitle">and Drop here</div>
									<form method="post" action="../UploadSerlvet" enctype="multipart/form-data"  class="dropzone" ></form>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="mdui-col-xs-5 "></div>
			</div>
		</div>
		<div id="tab2">
			<div align="center">
				<form action="../CreatFolderServlet"  method="post" onSubmit="return check(this)">
					<div class="mdui-textfield mdui-textfield-floating-label">

						<label class="mdui-textfield-label">Filename</label>
					<input type="text" name="foldername" class="mdui-textfield-input mdui-color-blue-grey-100" style="width: 600px">
					</div>

                <input type="submit"value="确定" class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey-800">
                </form>

			</div>
		</div>
		<div id="tab3">
			<div align="center">
				<form method="post" action="../UploadSerlvet" enctype="multipart/form-data">

					<div class="mdui-chip">
						<span class="mdui-color-blue-grey-300 mdui-chip-title ">选择一个文件上传到当前目录:</span>
					</div>
					<input type="file" name="uploadFile" class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey-100 "/>

					<input type="submit" value="上传"class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-blue-grey-800 " />
				</form>
			</div>
		</div>
	</div>


</body>
</html>