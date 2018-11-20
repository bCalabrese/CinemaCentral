<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="bean.UserBean" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
	</head>
	<body>
		<form action="SignUp" method="post" name="signup" onsubmit="return validateSignUp()">
			<div class="col-sm-offset-3 col-sm-6">
				<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
				<h1>Account Information</h1>
				<div class="form-group">
					<label for="fname">First Name:</label>
					<input type="text" class="form-control" name="firstName" id="fname"/>
				</div>
				<div class="form-group">
					<label for="lname">Last Name:</label>
					<input type="text" class="form-control" name="lastName" id="lname"/>
				</div>
				<div class="form-group">
					<label for="age">Age:</label>
					<input type="number" class="form-control" name="age" min="1" max="130" id="age"/>
				</div>
				<div class="form-group">
					<label for="user">Username:</label>
					<input type="text" class="form-control" name="username" min="1" max="32" id="user"/>
				</div>
				<div class="form-group">
					<label for="email">E-Mail:</label>
					<input type="email" class="form-control" name="email" id="email"/>
				</div>
				<div class="form-group">
					<label for="pass1">Password:</label>
					<input type="password" class="form-control" name="pass1" id="pass1"/>
				</div>
				<div class="form-group">
					<label for="pass2">Repeat Password:</label>
					<input type="password" class="form-control" name="pass2" id="pass2"/>
				</div>
				
				<h1>Billing Information</h1>
				<div class="form-group">
					<label for="addr1">Address Line 1:</label>
					<input type="text" class="form-control" name="address1" id="addr1"/>
				</div>
				<div class="form-group">
					<label for="addr2">Address Line 2:</label>
					<input type="text" class="form-control" name="address2" id="addr2"/>
				</div>
				<div class="form-group">
					<label for="city">City:</label>
					<input type="text" class="form-control" name="city" id="city"/>
				</div>
				<div class="form-group">
					<label for="state">State:</label>
					<input type="text" class="form-control" name="state" id="state"/>
				</div>
				<div class="form-group">
					<label for="zipcode">Zip-Code:</label>
					<input type="number" class="form-control" name="zipcode" id="zipcode"/>
				</div>
				<div class="form-group">
					<label for="phone">Phone Number:</label>
					<input type="number" class="form-control" name="phone" maxlength="11" id="phone"/>
				</div>
				<button type="submit" class="btn btn-default col-sm-8" name="signup">Submit</button>
				<button type="reset" class="btn btn-danger col-sm-4" name="reset">Reset</button>
			</div>
		</form>
	</body>
</html>