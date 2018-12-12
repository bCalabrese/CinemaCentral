<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "object.User" %>
<%@page import = "dao.UserDao" %>
<%@page import = "dao.CardDao" %>


<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central: Account</title>
		<style>
		
		
		</style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/shared/header.jspf"%>
	<%User user = UserDao.getUserByID(userBean.getMemberID()); %>
	<div class="container">
		<div class="row">
			
<form action ="Account" method="post" name="updateAccount" onsubmit="">

  <div class="form-row">
  <h1 style="color: #cc2a52;">Account Details:</h1>
    <div class="form-group col-md-4">
      <label for="firstName">First Name</label>
      <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name"
      value="<% 
      if(userBean.getFirstName() != null){
    	  out.print(user.getFirstName());
    	  }
      else 
    	  out.print("First Name"); %>">
    </div>
    <div class="form-group col-md-4">
      <label for="firstName">Last Name</label>
      <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name"
      value="<%
      if(user != null){
    	  out.print(user.getLastName());
    	  }
    	  %>">
    </div>
    <div class="form-group col-md-4">
      <label for="firstName">User Name</label>
      <input type="text" class="form-control" id="userName" name="userName" placeholder="User Name"
      value="<%
      if(user != null){
    	  out.print(user.getUserName());
    	  }
    	  %>">
    </div>
  </div>
  <div class="form-group col-md-12">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" name="billAddressLine1" placeholder="Address" value="<%
      if(user != null){
    	  out.print(user.getAddr1());
    	  }
    	  %>">
  </div>
  <div class="form-group col-md-12">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" name="billAddressLine2" placeholder="Apartment, studio, or floor" value="<%
      if(user != null){
    	  out.print(user.getAddr2());
    	  }

    	  %>">
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">City</label>

      <input type="text" class="form-control" id="inputCity" name="billCity" value="<%if(user != null){
    	  out.print(user.getCity());
    	  }%>">
    </div>
    <div class="form-row col-md-4">
      <label for="inputState">State</label>

      <input id="inputState" class="form-control" name="billState" value="<%if(user != null){
    	  out.print(user.getState());
    	  }%>">
       
    </div>
    <div class="form-group col-md-4">
      <label for="inputZip">Zip</label>

      <input type="text" class="form-control" id="inputZip" name="billZipCode" value="<%if(user != null){
    	  out.print(user.getZipcode());
    	  }%>">
    </div>
  </div>
 
  <button type="submit" class="button">Save Changes</button>
</form>
<br>
<br>
<form>
	<div class="form-row">
	<h1>Plan:</h1>
  <div class="form-group col-md-12">
    
     <input style="width: 15%; background:transparent" type="text" class="form-control" id="PlanLevel" placeholder="Subscription Tier"
     value="<%if(user != null){
     out.print(CardDao.getTierName(userBean.getMemberID()).toUpperCase());
     }%>" readonly>
     
    <%String myPage = "plan.jsp";%>
    <br>
	
  </div>
  <input type="button" value="Upgrade Plan" class="button" onClick="javascript:window.location='<%= myPage %>';">
  </div>
  <br>
  <div class="form-group">
    <h1>Billing:</h1>
    <%String paymentPage = "payment.jsp";%>
	<input type="button" class = "button" value="Update Billing" onClick="javascript:window.location='<%= paymentPage %>';"> 
	<br>
	</div>

</form>
</div>
</div>


	</body>
	</html>