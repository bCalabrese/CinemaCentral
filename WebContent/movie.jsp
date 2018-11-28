<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="object.Movie" %>
<%@ page import="dao.*" %>

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
				boolean checkedOut = MovieDao.isMovieCheckedOut(userBean.getMemberID(), m.getMovieID());
				boolean disabled = (MovieDao.numCheckedOutMovies(userBean.getMemberID()) >= UserDao.getNumMoviesByID(userBean.getMemberID()));
				%>
				<div>
					<h1 style="text-align: center;"><%out.print(m.getMovieTitle());%></h1><hr/>
				</div>
				<div class="col-sm-offset-1 col-sm-3">
					<h3>Genre:</h3>
					<h4><%out.print(m.getMovieGenre());%></h4>
					<h3>Rating:</h3>
					<h4><%out.print(m.getMovieRating());%></h4>
					<h3>Director:</h3>
					<h4><%out.print(MovieDao.getDirectorByID(m.getMovieID()));%></h4>
					<h3>Actors:</h3>
					<h4><%out.print(MovieDao.getActorsByID(m.getMovieID()));%></h4>
					<h3>Description:</h3>
					<h4><%out.print(m.getMovieDescription());%></h4>
					<form action="Movie" method="post" name="checkout">
						<input id="memberid" name="memberid" type="hidden" value="<%out.print(userBean.getMemberID());%>"/>
						<input id="movieid" name="movieid" type="hidden" value="<%out.print(m.getMovieID());%>"/>
						<input id="returning" name="returning" type="hidden" value="<%out.print((checkedOut) ? "1" : "0");%>"/>
						<button type="submit" class="btn btn-default col-sm-8" name="submit" <%if (disabled && !checkedOut) { out.print("disabled"); } %>><%out.print((checkedOut) ? "Return Movie" : "Download Movie");%></button>
					</form>
				</div>
				<div class="col-sm-offset-1 col-sm-6">
					<%
					String width = "780";
					String height = "480";
					String trailerString = "";
					if (m.getMovieTrailer().contains("youtube")) {
						trailerString = m.getMovieTrailer().replace("watch?v=", "embed/");
						trailerString += "?autoplay=false&width=" + width;
					}
					else {
						if (m.getMovieTrailer().contains("video/screenplay")) {
							trailerString = m.getMovieTrailer().replace("video/screenplay", "videoembed");
						}
						else if (m.getMovieTrailer().contains("video/imdb")) {
							trailerString = m.getMovieTrailer().replace("video/imdb", "videoembed");
						}
						else {
							trailerString = m.getMovieTrailer();
						}
						trailerString += "?autoplay=false&width=" + width + "&height=" + height;
					}
					%>
					<iframe src="<%out.print(trailerString);%>" width="<%out.print(width); %>" height="<%out.print(height); %>" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" frameborder="no" scrolling="no"></iframe>
				</div>
			</div>
			<%
			if (MovieDao.hasUserViewedMovie(userBean.getMemberID(), m.getMovieID())) { 
				out.print("<div class='row'>"
				+ "<div class='col-sm-offset-1 col-sm-10'>"
				+ "	<h3>Enjoy the movie? Leave a review!</h3>"
				+ "	<form action='Review' method='post' name='checkout'>"
				+ "		<div class='form-group'>"
				+ "			<textarea class='form-control' rows='4' name='reviewtext' id='reviewtext' maxlength='240'></textarea>"
				+ "		</div>"
				+ "		<div class='form-group'>"
				+ "			"	
				+ "		</div>"
				+ "		<div class='form-group'>"
				+ "			<button type='submit' class='btn btn-default col-sm-4 col-sm-offset-8' name='submit'>Post Review</button>"
				+ "		</div>"
				+ "	</form>"
				+ "</div>");
				
			}
			%>
			</div>
	    </div>
	</body>
</html>