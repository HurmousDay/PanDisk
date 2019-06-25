<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<% 
    String url = "../home/home.jsp";
	String username = (String)session.getAttribute("username");
	session.setAttribute("curUse",username);
	session.setAttribute("father", "主界面");
	System.out.println("Login_Welcome");
	String curUse = (String)session.getAttribute("curUse");
	String father = (String)session.getAttribute("father");
	System.out.println(curUse);
	System.out.println(father);
%>
<html>
   <head>
	   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/css/mdui.min.css">
	   <script src="//cdnjs.cloudflare.com/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
   		<meta http-equiv=refresh content=10;url=<%=url %>>           
   </head> 
       <body>
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
						   <h2 >登录成功</h2>
						   <h2 ><span id=jump>10</span> 秒钟后将自动返回主页面...</h2>
						   <h2><a href="javascript:void(0);" onclick="jumpToIndex()">点击此处立即跳转至主界面</a></h2>
					   </div>
				   </div>
			   </div>
		   </div>
		   <div class="mdui-col-xs-5 "></div>
	   </div>


      </body>
        <script>
             function countDown(secs){
                       jump.innerText=secs;
                       if(--secs>0)
                                setTimeout("countDown("+secs+" )",1000);
             }
             countDown(10);      
			function jumpToIndex(){
				window.location.href='<%=url %>';
			}
       </script>
</html> 
