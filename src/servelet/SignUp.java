package servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import object.User;

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
		
		User user = new User();
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setUserName(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPass(request.getParameter("pass1"));
		user.setAddr1(request.getParameter("address1"));
		user.setAddr2(request.getParameter("address2"));
		user.setCity(request.getParameter("city"));
		user.setState(request.getParameter("state"));
		user.setZipcode(request.getParameter("zipcode"));
		user.setPhone(request.getParameter("phone"));
		String email = request.getParameter("email");
	
		boolean accountExists = UserDao.isEmailTaken(email);

		if (accountExists) {
			request.setAttribute("errorMessage", "<strong>Error!</strong> Account with this e-mail address already exists!");
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);
		}
		else { // go back to login 
			// TODO: put account into database, java bean (?)
			UserDao.createAccount(user);
			response.sendRedirect("index.jsp");
		}
	}
}
