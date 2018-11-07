<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
	</head>
	<body>
		<%
			if (userBean.isSessionValid()) {
				// user is already logged in, send them to the landing page
				response.sendRedirect("landing.jsp");
			}
		%>
		<h1>Welcome to Cinema Central! The world's #1 source for downloadable cinematic content!</h1>
		<form action="Login" method="post" name="login" onsubmit="return validateLogin()">
			E-Mail:<input type="email" name="email" value="rshelby@yahoo.com"/>
			Password:<input type="password" name="password" value="sesame"/>
			<input type="submit" value="login"/>
		</form>
		<form action="signup.html" method="post">
			<input type="submit" value="signup"/>
		</form>
	</body>
</html>