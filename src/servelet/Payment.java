package account;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Payment() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO: check if e-mail is already in database,
		// otherwise create new user
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int cardID = Integer.parseInt(request.getParameter("cardID"));
		int memberID = Integer.parseInt(request.getParameter("memberID"));
		int creditCardCCV = Integer.parseInt(request.getParameter("creditCardCCV"));
		String creditCardNumber = request.getParameter("creditCardNumber");
		String cardHolderFirstName = request.getParameter("cardHolderFirstName");
		String cardHolderLastName = request.getParameter("cardHolderLastName");
		int expYear = Integer.parseInt(request.getParameter("expYear"));
		int expMonth = Integer.parseInt(request.getParameter("expMonth"));
		int ccType = Integer.parseInt(request.getParameter("ccType"));
		CardDao.insertInformation(creditCardCCV, creditCardNumber, cardHolderFirstName, cardHolderLastName, expYear,expMonth,ccType);
		response.sendRedirect("index.jsp");
	}
}
