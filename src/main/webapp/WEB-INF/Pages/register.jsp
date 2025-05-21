<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Register.css">
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        
        <!-- Display success or error messages -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <!-- Registration Form -->
        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="register">
            
            <div class="form-group">
                <label for="userName">Username:</label>
                <input type="text" id="userName" name="userName" 
                       value="${not empty userName ? userName : ''}" required
                       minlength="4" maxlength="20">
            </div>
            
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" 
                       value="${not empty fullName ? fullName : ''}">
            </div>
            
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender">
                    <option value="" disabled <c:if test="${empty gender}">selected</c:if>>Choose option</option>
                    <option value="male" <c:if test="${not empty gender && gender == 'male'}">selected</c:if>>Male</option>
                    <option value="female" <c:if test="${not empty gender && gender == 'female'}">selected</c:if>>Female</option>
                    <option value="other" <c:if test="${not empty gender && gender == 'other'}">selected</c:if>>Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" 
                       value="${not empty email ? email : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" 
                       value="${not empty phoneNumber ? phoneNumber : ''}">
            </div>
            
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" 
                       value="${not empty city ? city : ''}">
            </div>
            
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" 
                       value="${not empty state ? state : ''}">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required
                       pattern="^(?=.*[A-Za-z])(?=.*\d).{8,}$"
                       title="Must contain at least 8 characters including at least one letter and one number">
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-submit">Register</button>
            </div>
        </form>

        <p>Already have an account? <a href="${pageContext.request.contextPath}/login">login here</a></p>
    </div>

    <!-- Client-side validation script -->
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
            
            return true;
        });

        // Real-time password validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (confirmPassword && password !== confirmPassword) {
                this.setCustomValidity('Passwords do not match');
            } else {
                this.setCustomValidity('');
            }
        });
    </script>
</body>
</html>