package org.etspace.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.etspace.abc.jdbc.FileBean;
import org.etspace.abc.jdbc.FileOperation;

/**
 * Servlet implementation class CreatFolderServlet
 */
@WebServlet("/CreatFolderServlet")
public class CreatFolderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatFolderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
    	HttpSession session = request.getSession();
    	String curUse = (String)session.getAttribute("curUse");
    	String father = (String)session.getAttribute("father");
    	System.out.println("curUse:"+curUse);
    	if (curUse==null)curUse = "tmp";
    	if (father==null)father = "0";
    	String foldername = request.getParameter("foldername");  
    	String path="D:\\"+File.separator+UPLOAD_DIRECTORY+File.separator+curUse;

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        String updateTime = df.format(new Date());
   
        System.out.println("username:"+curUse);
        //判断文件类型
        String suf = "afolder";
        //文件类型
        System.out.println(suf);
        
        System.out.println("########CreatFolderServlet");
        System.out.println(foldername);
        System.out.println(updateTime);
        System.out.println(suf);
        System.out.println(path);
        System.out.println(curUse);
        System.out.println(father);
        
        
        FileBean file = new FileBean(foldername,updateTime,"0",suf,path,curUse,father);
        FileOperation fo = new FileOperation();
        int flag = fo.Insert(file);
        if (flag == 1) {
        	request.setAttribute("message","文件夹创建成功！");
        }else if (flag == 0) {
        	request.setAttribute("message","数据库更新失败");
        }else {
        	request.setAttribute("message","数据库使用错误");
        } 
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/home/message.jsp").forward(
                request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
