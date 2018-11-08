<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/shared/header.jspf" %>
		<%
			if (userBean.isSessionValid()) {
				// user is already logged in, send them to the landing page
				response.sendRedirect("landing.jsp");
			}
		%>
		<!-- <h1>Welcome to Cinema Central! The world's #1 source for downloadable cinematic content!</h1>-->
		<div class="container">
			<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
			<form class="form-horizontal" action="Login" method="post" name="login" onsubmit="return validateLogin()">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">E-Mail:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password" placeholder="Enter password"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default btn-block">Login</button>
					</div>
				</div>
			</form>
			
			<form class="form-horizontal" action="signup.jsp" method="post">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default btn-block">Sign Up</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>