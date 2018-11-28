<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="object.Movie" %>
<%@ page import="dao.MovieDao" %>

<!doctype html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
	</head>	
	<body>  
		<%@ include file="/WEB-INF/shared/header.jspf" %>
		<div class="container-fluid">
			<div class="row">
				<%
				Movie m = MovieDao.getMovieByID(Integer.parseInt(request.getParameter("movieid")));
				%>
				<div class="row">
					<h1 class="col-sm-offset-4 col-sm-4 text-center"><%out.print(m.getMovieTitle());%></h1>
				</div>
				<div class="col-sm-offset-2 col-sm-3">
					<h3>Genre:</h3>
					<h4><%out.print(m.getMovieGenre());%></h4>
					<h3>Rating:</h3>
					<h4><%out.print(m.getMovieRating());%></h4>
					<h3>Director:</h3>
					<h4>$DIRECTOR</h4>
					<h3>Actors:</h3>
					<h4>$ACTORS</h4>
				</div>
				<!-- <iframe src="<%//out.print("https://www.youtube.com/embed/dQw4w9WgXcQ");//out.print(m.getMovieTrailer());%>"></iframe>-->
				<div class="col-sm-6">
					<iframe src="https://www.imdb.com/video/imdb/vi1396095257/imdb/embed?autoplay=false&width=640" width="640" height="360" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" frameborder="no" scrolling="no"></iframe>
				</div>
			</div>
			<div class="row col-sm-offset-2">
				<h3>Description:</h3>
				<h4><%out.print(m.getMovieDescription());%></h4>
			</div>
			
	    </div>
	</body>
</html>