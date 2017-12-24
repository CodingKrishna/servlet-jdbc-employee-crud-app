package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.EmployDb;

/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Cookie ck[] = request.getCookies();
		
		if(ck!=null) {
			LinkedHashMap<String, String> lhm = new LinkedHashMap<String, String>();
			lhm.put("eid", request.getParameter("eid"));
			lhm.put("ename", request.getParameter("ename"));
			lhm.put("esal", request.getParameter("esal"));
			
			EmployDb emp = new EmployDb();
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/welcomePage.jsp");
			try {
				emp.addEmploy(lhm);	
				request.setAttribute("addsuccess", "Added Employee Successfully");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			rd.forward(request, response);
			
		}
		else {
			request.getRequestDispatcher("/jsp/loginPage.jsp").forward(request, response);;
		}
		
		
		
		
		/*finally {
			if(i==1) {
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/addEmploy.jsp");
				request.setAttribute("addsuccess", "Please Enter Correct Values");
				rd.forward(request, response);
			}*/			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
