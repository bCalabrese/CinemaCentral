<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="userBean" class="bean.UserBean" scope="session"/>


<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
		<link rel="stylesheet" href="index.css" type="text/css">
	
	<body class="login_Page">
		<%
			if (userBean.isSessionValid()) {
				// user is already logged in, send them to the landing page
				response.sendRedirect("landing.jsp");
			}
		%>
		<div class="login-box">
		<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
			<h1>Login</h1>
<form class="form-horizontal" action="Login" method="post" name="login" onsubmit="return validateLogin()">
			<div class="textbox">
				<i class="fa fa-user-circle-o" aria-hidden="true"></i>
				<input type="email" class="form-control" name="email" id="email" placeholder="Email"/>
			</div> 
			
			<div class="textbox">
				<i class="fa fa-key" aria-hidden="true"></i>
				<input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
			</div> 
			
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<button type="submit" class="btn btn-default btn-block">Login</button>
					</div>
				</div>
			</form>
			<form class="form-horizontal" action="signup.jsp" method="post">
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<button type="submit" class="btn btn-default btn-block">Sign Up</button>
					</div>
				</div>
			</form>
		</div>
	</body>
		