package org.etspace.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.etspace.abc.jdbc.FileOperation;

/**
 * Servlet implementation class GetFatherServlet
 */
@WebServlet("/GetFatherServlet")
public class GetFatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFatherServlet() {
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
    	if (father==null)father = "主界面";
    	FileOperation fo = new FileOperation();
    	father = fo.Findfather(father, curUse);
    	session.setAttribute("father",father);
    	// 跳转到 message.jsp
    	response.sendRedirect("home/home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
