<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/shared/validatesession.jspf" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/shared/resources.jspf" %>
		<meta charset="ISO-8859-1">
		<title>Cinema Central</title>
	</head>
	<body>
		<%@ include file="/WEB-INF/shared/header.jspf" %>
		<h1 style="text-align:center"><font color="red">Cinema Central</font></h1>
		<div style="background-color:lightgreen; border-style:grove; border-color:grey">
		<b><i><a href ="fdfd" style="margin-left:750px">My Account</a></i></b>
	    <form style="margin-left:10px; margin-bottom:40px">
	      <input style="width: 200px; margin-bottom: 20px; height:20px" type="text" placeholder="Search.." name="search">
	    </form>
			</div>	
		<div style="margin-bottom: 100px">
			<h1 style="text-align:center"><font color="red">Queue</font></h1>
		</div>
		<div style="margin: 50px">
			<h1 style="text-align:center"><font color="red">Featured</font></h1>
		</div>
		<div style="margin-top: 100px">
			<h1 style="text-align:center"><font color="red">Recommended</font></h1>
		</div>
		
	</body>
</html>