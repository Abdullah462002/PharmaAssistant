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
		<h3 style="color: #5b1b0b">Search Batch</h3>
		<form action="SearchServ" method="get">
			Batch Code: <input type="text" name="bcode" class="form-control"
				required> <br> <input type="submit" value="Search"
				style="background-color: #5b1b0b;border-radius: 5px;color: white;border-style: hidden;padding: 10px">
		</form>
		<br>
		<c:if test="${sessionScope.smg ne null }">
			<table class="table">
			<tr>
			<th>Name</th>
			<th>Value</th>
			</tr>
				<c:forEach items="${sessionScope.smg}" var="d">
					<tr>
						<th>Batch Code</th>
						<td>${d.batchCode()}</td>
					</tr>
					<tr>
						<th>Medicine Code</th>
						<td>${d.medicineCode()}</td>
					</tr>
					<tr>
						<th>Weight</th>
						<td>${d.weight()}</td>
					</tr>
					<tr>
						<th>Price</th>
						<td>${d.price()}</td>
					</tr>
					<tr>
						<th>Medicine Type</th>
						<td>${d.medicineType()}</td>
					</tr>
					<tr>
						<th>Refrigeration</th>
						<td>${d.refrigeration()}</td>
					</tr>
					<tr>
						<th>Level</th>
						<td>${sessionScope.lvl}</td>
					</tr>
					<tr>
						<th>Shipping Cost</th>
						<td>${sessionScope.sc}</td>
					</tr>
				</c:forEach>
			</table>
			<%
			session.removeAttribute("smg");
			%>
		</c:if>
		<c:if test="${sessionScope.fmg ne null }">
			<h2 class="text text-danger">${sessionScope.fmg}</h2>
			<%
			session.removeAttribute("fmg");
			%>
		</c:if>
	</div>
</body>
</html>