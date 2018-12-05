<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="object.Movie" %>
<%@ page import="dao.MovieDao" %>


<%
ArrayList<Movie> movies = new ArrayList<Movie>();
//String search = request.getParameter("search");
String title = request.getParameter("search");
String actor = request.getParameter("actor");
int year = (request.getParameter("year") == null || request.getParameter("year").equals("")) ? 0 : Integer.parseInt(request.getParameter("year"));
String[] genres = request.getParameterValues("genre");
String order = request.getParameter("order");

movies = MovieDao.advancedMovieSearch(title, actor, year, genres, order);
/*if (search != null) {
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
}*/
%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/shared/resources.jspf" %>
	<meta charset="ISO-8859-1">
	<title>Cinema Central</title>
	<script id="searchinner" type="text/html">
		<div class='row'>
			<div class='form-group col-sm-offset-1 col-sm-5'>
				<label for='actor'>Actor: </label>
				<input type='text' name='actor' id='actor' class='form-control'>
			</div>
			<div class='form-group col-sm-5'>
				<label for='year'>Year: </label>
				<input type='number' name='year' id='year' min='1900' max='2019' class='form-control'>
			</div>
			<div class='form-group col-sm-offset-1 col-sm-5'>
				<label for='genre'>Genre: </label>
				<select multiple name='genre' id='genre' class='form-control' size=3>
					<option value='Drama'>Drama</option>
					<option value='Sci-Fi'>Sci-Fi</option>
					<option value='Comedy'>Comedy</option>
					<option value='Action'>Action</option>
					<option value='Horror'>Horror</option>
				</select>
			</div>	
			<div class='form-group col-sm-5'>
				<label for='order'>Order By: </label>
				<select name='order' id='order' class='form-control'>
					<option value='movie.movieTitle'>Title</option>
					<option value='movie.movieYearReleased'>Year</option>
					<option value='movie.movieMPAARating'>MPAA</option>
				</select>
			</div>
			<input type='hidden' name='advanced' id='advanced' value='advanced'>
		</div>
	</script>
	<script>
	function toggleAdvanced() {
		if (typeof toggleAdvanced == 'undefined') {
			toggleAdvanced.enabled = true;
		}
		else {
			toggleAdvanced.enabled = !toggleAdvanced.enabled;
		}
		
		var form = document.getElementById('searchform');
		if (toggleAdvanced.enabled == true) {
			var advanced = document.createElement('div')
			advanced.setAttribute('id', 'advanced');
			advanced.innerHTML = document.getElementById('searchinner').innerHTML;
			form.append(advanced);
		}
		else {
			var element = document.getElementById('advanced');
			element.parentNode.removeChild(element);
		}
	}
	toggleAdvanced.enabled = <%out.print((request.getParameter("advanced") == null || request.getParameter("advanced") == "false") ? "false" : "true"); %>
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/shared/header.jspf" %>
	
	<div class='container-fluid'>
		<form id=searchform>
			<div class='row' id='searchbar'>
				<div class='form-group col-sm-offset-1 col-sm-6'>
		        	<input type='text' name='search' id='search' class='form-control' placeholder='Search' value='<%out.print((request.getParameter("search") == null) ? "" : request.getParameter("search")); %>'>
		      	</div>
		      	<button type='submit' class='col-sm-2 btn btn-default'>Submit Search</button>
			    <button type='button' class='col-sm-2 btn btn-info' id='AdvancedSearch' onclick='toggleAdvanced()'>Advanced Search</button>
			</div>
			<%
				if (request.getParameter("advanced") != null && request.getParameter("advanced") != "false") {
					out.print("<div class='row'> "
					+"<div class='form-group col-sm-offset-1 col-sm-5'> "
					+"<label for='actor'>Actor: </label> "
					+"<input type='text' name='actor' id='actor' class='form-control' value='" + ((request.getParameter("actor") == null) ? "" : request.getParameter("actor")) + "'>"
					+"</div> "
					+"<div class='form-group col-sm-5'> "
					+"<label for='year'>Year: </label> "
					+"<input type='number' name='year' id='year' min='1900' max='2019' class='form-control' value='" + ((request.getParameter("year") == null) ? "" : request.getParameter("year")) + "'> "
					+"</div> "
					+"<div class='form-group col-sm-offset-1 col-sm-5'> "
					+"<label for='genre'>Genre: </label> "
					+"<select multiple name='genre' id='genre' class='form-control' size=3> "
					+"<option value='Drama' " + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("Drama")) ? "selected" : "") + ">Drama</option> "
					+"<option value='Sci-Fi' " + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("Sci-Fi")) ? "selected" : "") + ">Sci-Fi</option> "
					+"<option value='Comedy' " + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("Comedy")) ? "selected" : "") + ">Comedy</option> "
					+"<option value='Action' " + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("Action")) ? "selected" : "") + ">Action</option> "
					+"<option value='Horror' " + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("Horror")) ? "selected" : "") + ">Horror</option> "
					+"</select> "
					+"</div>	"
					+"<div class='form-group col-sm-5'> "
					+"<label for='order'>Order By: </label> "
					+"<select name='order' id='order' class='form-control'> "
					+"<option value='movie.movieTitle'> Title</option> "
					+"<option value='movie.movieYearReleased'" + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("movie.movieTitle")) ? "selected" : "") + ">Year</option> "
					+"<option value='movie.movieMPAARating'" + ((request.getParameterValues("genre") != null && Arrays.asList(request.getParameterValues("genre")).contains("movie.movieTitle")) ? "selected" : "") + ">MPAA</option> "
					+"</select> "
					+"</div> "
					+"<input type='hidden' name='advanced' id='advanced' value='advanced'>"
					+"</div>); ");
				}
			
			%>
		</form>
		<%
		out.print("<h1 class=\"col-sm-offset-1\">Search returned with " + movies.size() + " cinematic features</h1>");
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
	</div>
</body>
</html>