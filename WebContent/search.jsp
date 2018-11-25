<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/shared/validatesession.jspf" %>
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
		out.print("<div>");
		out.print(m.getMovieID());
		out.print(m.getMovieTitle());
		out.print("</div>");
	}
	%>
</body>
</html>