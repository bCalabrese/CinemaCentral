package servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.UserBean;
import dao.UserDao;
import object.User;
/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		User user = new User();
		int memberID = (((UserBean)request.getSession().getAttribute("userBean")).getMemberID());
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setUserName(request.getParameter("userName"));
		user.setAddr1(request.getParameter("billAddressLine1"));
		user.setAddr2(request.getParameter("billAddressLine2"));
		user.setCity(request.getParameter("billCity"));
		user.setState(request.getParameter("billState"));
		user.setZipcode(request.getParameter("billZipCode"));

		UserDao.updateAccount(memberID, user);
		
		response.sendRedirect("Account.jsp");
		
	}

}
