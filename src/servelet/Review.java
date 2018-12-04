package servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class Review
 */
@WebServlet("/Review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewText = request.getParameter("reviewtext");
		int rating = Integer.parseInt(request.getParameter("stars"));
		int memberID = Integer.parseInt(request.getParameter("memberid"));
		int movieID = Integer.parseInt(request.getParameter("movieid"));
		
		UserDao.createReview(memberID, movieID, rating, reviewText);
		response.sendRedirect("movie.jsp?movieid=" + movieID);
	}

}
