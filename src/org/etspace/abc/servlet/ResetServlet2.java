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
@WebServlet("/ResetServlet2")
public class ResetServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetServlet2() {
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
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String school = request.getParameter("school");
		UserBean us = new UserBean(username,password,sex,school);
		ResetBean reset = new ResetBean();
		int flag = reset.resetSecond(us);

		if (flag == 1) {
			session.setAttribute("username",username);
			session.setAttribute("school",school);
			response.sendRedirect("sysReset/ResetOK.jsp");
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
