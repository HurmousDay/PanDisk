package org.etspace.abc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.etspace.abc.jdbc.*;


/**
 * Servlet implementation class ResetServlet
 */
@WebServlet("/ResetServlet")
public class ResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String username = request.getParameter("username");
		String school = request.getParameter("school");

		UserBean us = new UserBean(username,"","",school);
		ResetBean reset = new ResetBean();
		int flag = reset.resetFirst(us);	
		
		if (flag == 1) {
			session.setAttribute("username",username);
			session.setAttribute("school",school);
			response.sendRedirect("sysReset/Reset.jsp");
		}else if (flag == 0){
			session.setAttribute("error", "Imformation Wrong!!!");
			response.sendRedirect("sysReset/ResetPassword.jsp");
		}else if (flag == -1){
			session.setAttribute("error", "SQL connection error");
			response.sendRedirect("sysReset/ResetPassword.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
