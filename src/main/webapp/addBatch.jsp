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
		<h3 style="color: #5b1b0b">Add New Batch</h3>
		<form action="RegServe" method="post">
			Batch Code: <input type="text" name="bcode" required class="form-control" required> 
			Medicine Code: <select class="form-select" required name="mcode">
								<c:forEach items="${sessionScope.mcli}" var="m">
								<option value="${m}">${m}</option>
								</c:forEach>
							</select> 
			Weight: <input type="text" required name="weight" class="form-control" required> 
			Price: <input type="text" required name="price" class="form-control" required> 
			Medicine Type: <select class="form-select" required name="mtype">
								<option value="Capsule">Capsule</option>
								<option value="Syrup">Syrup</option>
								<option value="Tablet">Tablet</option>
							</select><br> 
			Refrigeration:&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-check form-check-inline">
				<input class="form-check-input" required type="radio" name="Refri"
					id="inlineRadio1" value="Yes"> <label
					class="form-check-label" for="inlineRadio1">Yes</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="Refri"
					id="inlineRadio2" value="No"> <label
					class="form-check-label" for="inlineRadio2">No</label>
			</div>
			<br><br>
			<input type="submit" value="Register" style="background-color: #5b1b0b;border-radius: 5px;color: white;border-style: hidden;padding: 10px"/>
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