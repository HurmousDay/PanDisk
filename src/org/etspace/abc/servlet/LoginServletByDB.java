package org.etspace.abc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.etspace.abc.jdbc.*;
import java.sql.*;

/**
 * Servlet implementation class LoginServletByDB
 */
@WebServlet("/LoginServletByDB")
public class LoginServletByDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServletByDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession(true);
		UserBean us = new UserBean(username,password);
		LoginBean log = new LoginBean();
		int flag = log.login(us);
		if (flag == -1) {
			response.sendRedirect("syslogin/error.jsp");
			session.setAttribute("error", "SQL connection error!");
		}else if (flag == 0) {
			response.sendRedirect("syslogin/error.jsp");
			session.setAttribute("error", "username or password wrong!");
		}else if (flag == 1) {
			session.setAttribute("username", username);
			response.sendRedirect("syslogin/welcome.jsp");
		}else if (flag == 2) {
			session.setAttribute("username", username);
			response.sendRedirect("SysAdmin/All.jsp");
		}
	}

}
