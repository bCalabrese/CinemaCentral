package servelet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import dao.CardDao;
import object.Card;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Card card = new Card();
		card.setMemberId(((UserBean)request.getSession().getAttribute("userBean")).getMemberID());
		card.setCreditCardCCV(Integer.parseInt(request.getParameter("creditCardCCV")));
		card.setCreditCardNumber(request.getParameter("creditCardNumber"));
		card.setCardHolderFirstName(request.getParameter("cardHolderFirstName"));
		card.setCardHolderLastName(request.getParameter("cardHolderLastName"));
		card.setExpYear(Integer.parseInt(request.getParameter("expYear")));
		card.setExpMonth(Integer.parseInt(request.getParameter("expMonth")));
		card.setCcType(request.getParameter("ccType"));
		if(CardDao.doesMemberhavePayment(card.getMemberId()))
		{
			CardDao.updateInformation(card);
		}
		else
		{
			CardDao.insertInformation(card);
		}
		response.sendRedirect("Account.jsp");
	}
}
