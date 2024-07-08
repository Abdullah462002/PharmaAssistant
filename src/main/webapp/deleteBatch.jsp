<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharma Assistant</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
<div class="container" style="margin-top:50px;">
	<h3 style="color: #5b1b0b">Delete Batch</h3>
	<form action="DeleteServ" method="post">
		Batch Code: <input type="text" name="bcode" class="form-control" required>
		<br>
		<input type="submit" value="Delete" style="background-color: #5b1b0b;border-radius: 5px;color: white;border-style: hidden;padding: 10px">
	</form>
	<br>
	<c:if test="${sessionScope.smg ne null }">
    	<h2 class="text text-success">${sessionScope.smg}</h2>
    	<% session.removeAttribute("smg"); %>
    	</c:if>
    	<c:if test="${sessionScope.fmg ne null }">
    	<h2 class="text text-danger">${sessionScope.fmg}</h2>
  		<% session.removeAttribute("fmg"); %>
   		</c:if>
</div>
</body>
</html>