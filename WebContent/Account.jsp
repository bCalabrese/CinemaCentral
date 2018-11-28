<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "object.User" %>
<%@page import = "dao.UserDao" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/shared/header.jspf"%>
	<%User user = UserDao.getUserByID(userBean.getMemberID()); %>
<form class="needs-validation" novalidate>
<h1>Account Details:</h1>
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">First name</label>
      <input type="text" class="form-control" id="validationCustom01" 
      placeholder="First name" value="<% 
      if(userBean.getFirstName() != null){
    	  out.print(user.getFirstName());
    	  }
      else 
    	  out.print("First Name"); %>">
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Last name</label>
      <input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="
      <%out.print(user.getLastName());%>">
    </div>
    
    <div class="col-md-4 mb-3">
      <label for="validationCustomUsername">Username</label>
      <div class="input-group">
        <input type="text" class="form-control" id="validationCustomUsername" placeholder="Username" value="<%out.print(user.getUserName());%>">
      </div>
    </div>
  </div>
  
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">City</label>
      <input type="text" class="form-control" id="validationCustom03" placeholder="City" value="
      <%out.print(user.getCity());%>">
    </div>
    
    <div class="col-md-3 mb-3">
      <label for="validationCustom04">State</label>
      <input type="text" class="form-control" id="validationCustom04" placeholder="State" value="
      <%out.print(user.getState());%>">
    </div>
    
    <div class="col-md-3 mb-3">
      <label for="validationCustom05">Zip</label>
      <input type="text" class="form-control" id="validationCustom05" placeholder="Zip" value="
      <%out.print(user.getZipcode());%>">
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Save Changes</button>
</form>
			<div class="row-sm-offset-6 row-sm-6">
				<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
				<h1>Plan:</h1>
				<div class="form-group">
					<label for="planlevel" class="form-control" id="planlevel">Plan Level:</label>
					<%String myPage = "plan.jsp";%>
					<input type="button" value="Upgrade Plan" onClick="javascript:window.location='<%= myPage %>';"> 
				</div>
			</div>
			<div class="row-sm-offset-6 row-sm-6">
				<%@ include file="/WEB-INF/shared/handleerror.jspf" %>
				<h1>Billing:</h1>
				<div class="form-group">
					<label for="planlevel">Billing Details:</label>
					<%String paymentPage = "payment.jsp";%>
					<input type="button" value="Update Billing" onClick="javascript:window.location='<%= paymentPage %>';"> 
				</div>
			</div>
	</body>
</html>