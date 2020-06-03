package cookies;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cook6
 */
@WebServlet("/cook6")
public class cook6 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cook6() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String email = request.getParameter("email");

		Cookie oldCookies[] = request.getCookies();

		if (oldCookies.length != 0 && (fname.equals("")) || (lname.equals("")) || (email.equals(""))) {

			if (fname.equals("")) {

				for (int i = 0; i < oldCookies.length; i++) {

					if (oldCookies[i].getName().equals("fn")) {

						fname = oldCookies[i].getValue();

					}

				}

			}

			if (lname.equals("")) {

				for (int i = 0; i < oldCookies.length; i++) {

					if (oldCookies[i].getName().equals("ln")) {

						lname = oldCookies[i].getValue();

					}

				}

			}

			if (email.equals("")) {

				for (int i = 0; i < oldCookies.length; i++) {

					if (oldCookies[i].getName().equals("eml")) {

						email = oldCookies[i].getValue();

					}

				}

			}

		} else if (oldCookies.length == 0 ) {
			// New User
			if (fname.equals("")) {

				fname = "unknown";

			}
			if (lname.equals("")) {

				lname = "unknown";

			}
			if (email.equals("")) {

				email = "unknown";

			}

		}

		out.println("<html><body>First Name : " + fname + "<br>Last Name: " + lname + "<br>Email: " + email
				+ "</body></html>");

	}

}
