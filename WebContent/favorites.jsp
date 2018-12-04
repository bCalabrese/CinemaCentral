<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.Movie" %>
<%@ page import="dao.MovieDao" %>

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
		ArrayList<Movie> movies = MovieDao.getMovieSFromFavorites(userBean.getMemberID());
	%>
	
	<%
	out.print("<h1 class=\"col-sm-offset-1\"><center>Favorites List</center></h1>");
	for (Movie m : movies) {
		out.print("<a href=\"movie.jsp?movieid=" + m.getMovieID() + "\">");
		out.print("<div style=\"background-color:#f4f4f4;\" class=\"col-sm-offset-1 col-sm-10 form-group text-muted\">");
		out.print("<div class=\"col-sm-8\">");
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
		out.print("<img src=\"images/" + m.getMovieImage() + "\" onerror=\"this.onerror=null;this.src='images/default.png';\" class=\"img-responsive col-sm-offset-2 col-sm-2\">");
		out.print("</div>");
		out.print("</a>");
	}
	%>
</body>
</html>