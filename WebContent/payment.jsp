<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="object.*" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
		<script src="validate.js"></script>
	</head>
	<body style="background-color:white;">
		<%@ include file="/WEB-INF/shared/header.jspf" %>
		<% 
			Card card = CardDao.getInformation(userBean.getMemberID());
		%>
		<form action="Payment" method="post" name="payment" onsubmit="return validatePayment()">
			<div class="col-sm-offset-3 col-sm-6">
				<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
				<h1 style="color:white;">Payment Information</h1>
				<div class="form-group">
					<label for="creditCardCCV">Credit Card CCV Number:</label>
					<input type="text" pattern="[0-9]{5}" title="5 digit CCV Number" class="form-control" name="creditCardCCV" id="creditCardCCV"
					value = "<%
					if (!CardDao.doesMemberExist(userBean.getMemberID()))
					{
						out.println("");
					}
					else
					{
						out.println(card.getCreditCardCCV()); 
					}
					%>">
				</div>
				<div class="form-group">
					<label for="creditCardNumber">Credit Card Number:</label>
					<input type="text" pattern="[0-9]{16}" title="16 digit Credit Card Number" class="form-control" name="creditCardNumber" id="creditCardNumber" maxlength="16"
					value = "<% 
					if (!CardDao.doesMemberExist(userBean.getMemberID()))
					{
						out.println("");
					}
					else
					{
						out.println(card.getCreditCardNumber());
					}
					%>">
				</div>
				<div class="form-group">
					<label for="cardHolderFirstName">Card Holder First Name:</label>
					<input type="text" class="form-control" name="cardHolderFirstName" id="cardHolderFirstName"					
					value = <% 
					if (!CardDao.doesMemberExist(userBean.getMemberID()))
					{
						out.println("");
					}
					else
					{
						out.println(card.getCardHolderFirstName()); 
					}
					%>>
				</div>
				<div class="form-group">
					<label for="cardHolderLastName">Card Holder Last Name:</label>
					<input type="text" class="form-control" name="cardHolderLastName" id="cardHolderLastName"
					value = <% 
					if (!CardDao.doesMemberExist(userBean.getMemberID()))
					{
						out.println("");
					}
					else
					{
						out.println(card.getCardHolderLastName()); 
					}
					%>>
				</div>
				<div class="form-group">
					<label for="expYear">Card Exp Year:</label>
					<select name="expYear" class="form-control" id="expYear">
					<option value=
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("");}
						else{out.println(card.getExpYear()); }
						%>>
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("Please Select expYear");}
						else{out.println(card.getExpYear()); } 
						%>
						</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
  					</select>
				</div>
				<div class="form-group">
					<label for="expMonth">Exp Month:</label>
					<select name="expMonth" class="form-control" id="expMonth">
						<option value=
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("");}
						else{out.println(card.getExpMonth()); }
						%>>
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("Please Select expMonth");}
						else{out.println(card.getExpMonth()); } 
						%>
						</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
  					</select>
				</div>
				<div class="form-group">
					<label for="ccType">Credit Card Type:</label>
  					<select name="ccType" class="form-control" id="ccType">
  						<option value=
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("");}
						else{out.println(card.getCcType()); }
						%>>
						<% 
						if (!CardDao.doesMemberExist(userBean.getMemberID())){out.println("Please Select expMonth");}
						else{out.println(card.getCcType()); } 
						%>
						<option value="AmericanExpress">AmericanExpress</option>
						<option value="MasterCard">MasterCard</option>
						<option value="Visa">Visa</option>
						<option value="MasterCard">Discover</option>
  					</select>
				</div>
				<button type="submit" class="button" name="signup">Submit</button>
				<button type="reset" class="button" name="reset">Reset</button>
			</div>
		</form>
	</body>
</html>