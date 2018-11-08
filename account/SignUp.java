package account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO: check if e-mail is already in database,
		// otherwise create new user
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		int age = Integer.parseInt(request.getParameter("age"));
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");

		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String phoneNumber = request.getParameter("phone");
		
		boolean accountExists = UserDao.isEmailTaken(email);
		
		// TODO: query database for an account with this email

		if (accountExists) {
			request.setAttribute("errorMessage", "<strong>Error!</strong> Account with this e-mail address already exists!");
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);
		}
		else { // go back to login 
			// TODO: put account into database, java bean (?)
			UserDao.createAccount(firstName, lastName, age, email, pass1, address1, 
					address2, city, state, zipcode, username, phoneNumber);
			response.sendRedirect("index.jsp");
		}
	}

}
