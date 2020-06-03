package com.bookstore.welcome;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyBook
 */
@WebServlet("/BuyBook")
public class BuyBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		HttpSession session = request.getSession();
		String id="";
		Enumeration bookId = request.getParameterNames();
		
		
		id = (String) bookId.nextElement();
		
		
		session.removeAttribute("book_id");
		
		session.setAttribute("book_id", id);
		
		if(session.getAttribute("username") != null) {
			
			//Send to Checkout page
			response.sendRedirect("checkout.jsp");
			
			
		} else {
			
			//send to Login page
			response.sendRedirect("loginPage.jsp");			
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
