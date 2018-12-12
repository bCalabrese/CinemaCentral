package servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;

/**
 * Servlet implementation class Favorites
 */
@WebServlet("/Favorites")
public class Favorites extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Favorites() {
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
		int memberID = Integer.parseInt(request.getParameter("memberid"));
		int movieID = Integer.parseInt(request.getParameter("movieid"));
		if (request.getParameter("favorite").equals("1")) {
			MovieDao.removeFromFavorites(memberID, movieID);
		} else {
			MovieDao.addToFavorites(memberID, movieID);
		}
		response.sendRedirect("movie.jsp?movieid=" + movieID);
	}

}
