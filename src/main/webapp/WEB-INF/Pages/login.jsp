<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Login.css">
</head>

<body>
	<div class="image-section">
                <img src="https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg" alt="Login Illustration" />
    </div>
    <div class="container">
        <div class="form-container">
            <div class="title">Login</div>
            
            <form action="${pageContext.request.contextPath}/loginServlet" method="post">
                <div class="Details">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required>
                </div>

                <div class="Details">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>

                <div class="button input-box">
                    <input type="submit" value="Submit">
                </div>

                <div class="text sign-up-text">
                    Don't have an account? 
                    <a href="${pageContext.request.contextPath}/Register">Register now</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
