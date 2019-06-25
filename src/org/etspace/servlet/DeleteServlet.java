package org.etspace.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.etspace.abc.jdbc.FileOperation;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload"; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
    	HttpSession session = request.getSession();
    	String curUse = (String)session.getAttribute("curUse");
    	if (curUse==null) curUse = "tmp";
    	String fileName = request.getParameter("filename");  //23239283-92489-阿凡达.avi
    	String path="D:\\"+File.separator+UPLOAD_DIRECTORY+File.separator+curUse;
    	File file = new File(path + "\\" + fileName);
        file.delete();  
        FileOperation fo = new FileOperation();
        int flag = fo.Delete(fileName,curUse);
        if (flag == 1) {
        	request.setAttribute("message","文件删除成功!");
        }else if (flag==0) {
        	request.setAttribute("message","数据更新失败!");
        }else {
        	request.setAttribute("message","数据库操作异常!");
        }
        getServletContext().getRequestDispatcher("/home/message.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
