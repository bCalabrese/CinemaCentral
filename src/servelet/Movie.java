package servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;

/**
 * Servlet implementation class Movie
 */
@WebServlet("/Movie")
public class Movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Movie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberID = Integer.parseInt(request.getParameter("memberid"));
		int movieID = Integer.parseInt(request.getParameter("movieid"));
		if (request.getParameter("returning").equals("1")) {
			MovieDao.returnMovie(memberID, movieID);
		}
		else {
			MovieDao.checkOutMovie(memberID, movieID);
		}
		response.sendRedirect("movie.jsp?movieid=" + movieID);
	}

}
