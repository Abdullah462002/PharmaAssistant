<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pharma Assistant - Login</title>
    <script type="text/javascript">
    // Function to mask password input with asterisks
    function maskPassword() {
        var passwordField = document.getElementById("passwordField");
        var maskedPassword = "";
        for (var i = 0; i < passwordField.value.length; i++) {
            maskedPassword += "*";
        }
        passwordField.value = maskedPassword;
    }

    // Attach the maskPassword function to the input field's oninput event
    document.getElementById("passwordField").oninput = maskPassword;

    </script>
</head>
<body>
    <div class="header">
        <img class="logo" src="logo.png" alt="Company Logo">
        <h1>Pharma Assistant</h1>
    </div>
    <div class="content">
        <div class="login-form">
            <h2>Login</h2>
            <form action="loginServlet" method="post"> <!-- Replace "loginServlet" with your actual servlet URL -->
                <input class="input-field" type="text" placeholder="Username" name="username" required><br>
<input class="input-field" type="password" placeholder="Password" name="password" id="passwordField" required>
                <button class="login-button" type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>

