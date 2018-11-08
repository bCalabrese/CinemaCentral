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
 * Servlet implementation class login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		// Retrive user bean
		UserAccount user = (UserAccount)request.getSession().getAttribute("userBean");
		
		//
		if (user == null || user.getMemberID() == -1) {
			user = UserDao.attemptLogin(email, pass);
		}
		
		//If user exists and credentials are valid
		if (user != null && user.isSessionValid()) { 
			//Set javabean
			request.getSession().setAttribute("userBean", user);
			response.sendRedirect("landing.jsp");
		}
		else { // bad credentials
			request.setAttribute("errorMessage", "<strong>Error!</strong> Incorrect e-mail or password. Please verify your credentials.");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		out.close();
	}

}
