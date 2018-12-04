<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.*" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/shared/resources.jspf" %>
	<meta charset="UTF-8">
	<title>Cinema Central</title>
</head>
<body>
	<%@ include file="/WEB-INF/shared/header.jspf" %>
	<%
		int movieID = Integer.parseInt(request.getParameter("movieid"));
		ArrayList<MovieReview> reviews = MovieDao.getReviewsByMovie(movieID);
		for (MovieReview review : reviews) {
			out.print("<div>");
			out.print(review.getRating() + "<br/>" + review.getReviewText() + "<br/>" + review.getName());
			out.print("</div>");
		}
	%>
</body>
</html>