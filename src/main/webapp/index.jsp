<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharma Assistant</title>
<style>
body {
	background-color: #FFFFFF; /* Green background color */
	font-family: Arial, sans-serif;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
	margin: 0;
}

img.background {
	position: absolute;
	left: 0px;
	top: 0px;
	z-index: -1;
	width: 100%;
	height: 100%;
	filter: blur(10px);
}

.header {
	background-color: #45bbd2	;
	color: #FFFFFF;
	/* padding: 10px; */
	text-align: center;
	width: 100%;
}

form {
	width: 300px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	text-align: center;
	
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	width: 100%;
	background-color: #39829a;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #5d919f;
}

.container {
	text-align: left;
}
</style>
</head>
<body>
	<img class="background"
		src="./pharmacyAssistant.jpg"
		alt="Aleq">
	<div class="header">
		<h1>Pharma Assistant</h1>
	</div>
	<h2>Login Page</h2>
	<h5 style="color: red">${sessionScope.error}</h5>
	<%
	session.removeAttribute("error");
	%>
	<form action="login" method="post" class="container">
		Username: <input type="text" required name="username"><br>
		Password: <input type="password" required name="password" id="passwordField"><br>
		<input type="submit" value="Login">
	</form>
</body>
</html>