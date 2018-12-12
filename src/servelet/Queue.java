package servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;

/**
 * Servlet implementation class Queue
 */
@WebServlet("/Queue")
public class Queue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Queue() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int memberID = Integer.parseInt(request.getParameter("memberid"));
		int movieID = Integer.parseInt(request.getParameter("movieid"));
		String moviename = request.getParameter("moviename");
		if (request.getParameter("queue").equals("1")) {
			MovieDao.removeFromQueue(memberID, movieID);
		} else {
			MovieDao.addToQueue(memberID, movieID, moviename);
		}
		response.sendRedirect("movie.jsp?movieid=" + movieID);
	}
}
