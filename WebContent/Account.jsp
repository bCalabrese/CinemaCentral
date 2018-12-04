<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "object.User" %>
<%@page import = "dao.UserDao" %>
<%@page import = "dao.CardDao" %>


<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Account</title>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/shared/header.jspf"%>
	<%User user = UserDao.getUserByID(userBean.getMemberID()); %>
<form action ="Account" method="post" name="updateAccount" onsubmit="">
<h1>Account Details:</h1>
  <div class="form-row">
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
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" name="billAddressLine1" placeholder="Address" value="
      <%
      if(user != null){
    	  out.print(user.getAddr1());
    	  }
    	  %>">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" name="billAddressLine2" placeholder="Apartment, studio, or floor" value="
      <%
      if(user != null){
    	  out.print(user.getAddr2());
    	  }

    	  %>">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" name="billCity" value="
      <%if(user != null){
    	  out.print(user.getCity());
    	  }%>">
    </div>
    <div class="form-row col-md-4">
      <label for="inputState">State</label>
      <input id="inputState" class="form-control" name="billState" value="
      <%if(user != null){
    	  out.print(user.getState());
    	  }%>">
       
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip" name="billZipCode" value="
      <%if(user != null){
    	  out.print(user.getZipcode());
    	  }%>">
    </div>
  </div>
 
  <button type="submit" class="btn btn-primary">Save Changes</button>
</form>
<br>
<br>
<form>
  <div class="form-group">
    <label for="formGroupExampleInput">Plan:</label>
     <input type="text" readonly class="form-control-plaintext" id="PlanLevel" placeholder="Subscription Tier"
     value="<%if(user != null){
     out.print(CardDao.getTierName(userBean.getMemberID()));
     }%>">
     
    <%String myPage = "plan.jsp";%>
	<input type="button" value="Upgrade Plan" onClick="javascript:window.location='<%= myPage %>';">
  </div>
  <br>
  <div class="form-group">
    <label for="formGroupExampleInput2">Billing:</label>
    <%String paymentPage = "payment.jsp";%>
	<input type="button" value="Update Billing" onClick="javascript:window.location='<%= paymentPage %>';"> 
	</div>

</form>
	</body>
</html>