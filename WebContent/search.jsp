<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.Movie" %>
<%@ page import="dao.MovieDao" %>


<%
ArrayList<Movie> movies = new ArrayList<Movie>();
String search = request.getParameter("search");
if (search != null) {
	ArrayList<Movie> result = null;
	if (request.getParameter("title") != null) {
		result = MovieDao.getMoviesByTitle(search);
		for (Movie m : result) {
			if (!movies.contains(m)) {
				movies.add(m);
			}
		}
	}
	if (request.getParameter("actor") != null) {
		result = MovieDao.getMoviesByActor(search);
		for (Movie m : result) {
			if (!movies.contains(m)) {
				movies.add(m);
			}
		}
	}
	if (request.getParameter("date") != null) {
		try {
			result = MovieDao.getMoviesByYear(Integer.parseInt(search));
			for (Movie m : result) {
				if (!movies.contains(m)) {
					movies.add(m);
				}
			}
		}
		catch (NumberFormatException e) {
			
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/shared/resources.jspf" %>
	<meta charset="ISO-8859-1">
	<title>Cinema Central</title>
</head>
<body>
	<%@ include file="/WEB-INF/shared/header.jspf" %>
	<%
	for (Movie m : movies) {
		out.print("<a href=\"movie.jsp?movieid=" + m.getMovieID() + "\"");
		out.print("<div class=\"row col-sm-12 form-group text-muted\">");
		out.print("<div class=\"col-sm-offset-1 col-sm-8\">");
		out.print("<h1>");
		out.print(m.getMovieTitle());
		out.print("</h1>");
		out.print("<h3>");
		out.print(m.getMovieGenre());
		out.print("</h3>");
		out.print("<h3>");
		out.print(m.getMovieReleaseDate());
		out.print("</h3>");
		out.print("<h3>");
		out.print(m.getMovieRating());
		out.print("</h3>");
		out.print("</div>");
		out.print("<img src=\"images/" + m.getMovieImage() + "\" onerror=\"this.onerror=null;this.src='images/default.png';\" width=\"200\" height=\"300\" class=\"img-responsive col-sm-2\">");
		out.print("</div>");
		out.print("</a>");
	}
	%>
</body>
</html>