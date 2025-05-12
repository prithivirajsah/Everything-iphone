<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <c:if test="${not empty error}">
                <div class="error-message" style="color: red;">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="Details">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
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
                    <a href="register">Register now</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
