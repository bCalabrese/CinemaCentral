<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userBean" class="account.UserAccount" scope="session"/>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Payment Plan</title>
		<script src="validate.js"></script>
	</head>
	<body>
		<form action="Payment" method="post" name="payment" onsubmit="return validatePayment()">				
			<div class="form-group">
				<label class="control-label col-sm-2" for="creditCardCCV">creditCardCCV:</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="creditCardCCV" name="creditCardCCV" placeholder="Enter creditCardCCV"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="creditCardNumber">creditCardNumber:</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="creditCardNumber" name="creditCardNumber" placeholder="Enter creditCardNumber"/>
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2" for="cardHolderFirstName">cardHolderFirstName:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cardHolderFirstName" name="cardHolderFirstName" placeholder="Enter cardHolderFirstName"/>
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2" for="cardHolderLastName">cardHolderLastName:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cardHolderLastName" name="cardHolderLastName" placeholder="Enter cardHolderLastName"/>
				</div>
			</div>						
			<div class="form-group">
				<label class="control-label col-sm-2" for="expYear">expYear:</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="expYear" name="expYear" placeholder="Enter expYear"/>
				</div>
			</div>										
			<div class="form-group">
				<label class="control-label col-sm-2" for="expMonth">expMonth:</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="expMonth" name="expYear" placeholder="Enter expMonth"/>
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2" for="cardHolderFirstName">ccType:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cardHolderFirstName" name="cardHolderFirstName" placeholder="Enter cardHolderFirstName"/>
				</div>
			</div>	
			<button type="submit" class="btn btn-default col-sm-8" name="signup">Submit</button>
		</form>
	</body>
</html>