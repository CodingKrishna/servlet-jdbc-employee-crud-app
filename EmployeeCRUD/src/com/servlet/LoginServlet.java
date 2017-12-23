package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		String user = request.getParameter("user");
		String password = request.getParameter("password");	
		
		if(user.equals("suresh@gmail.com")&&password.equals("suresh")) {
			Cookie cookie = new Cookie("userName", user);
			response.addCookie(cookie);
			request.getRequestDispatcher("/jsp/welcomePage.jsp").forward(request, response);
			
			//HttpSession session = request.getSession();
			//session.setAttribute("isLogin", "yes");
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/loginPage.jsp");
			request.setAttribute("loginfail", "UserName or Password Incorrect");
			rd.forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
