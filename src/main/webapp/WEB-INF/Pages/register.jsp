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
            
            <!-- User Data from Model -->
            <c:set var="user" value="${userData}" />
            
            <div class="form-group">
                <label for="userName">Username:</label>
                <input type="text" id="userName" name="userName" 
                       value="${not empty user ? user.userName : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" 
                       value="${not empty user ? user.fullName : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled <c:if test="${empty user.gender}">selected</c:if>>Choose option</option>
                    <option value="male" <c:if test="${not empty user && user.gender == 'male'}">selected</c:if>>Male</option>
                    <option value="female" <c:if test="${not empty user && user.gender == 'female'}">selected</c:if>>Female</option>
                    <option value="other" <c:if test="${not empty user && user.gender == 'other'}">selected</c:if>>Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" 
                       value="${not empty user ? user.email : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" 
                       value="${not empty user ? user.phoneNumber : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" 
                       value="${not empty user ? user.city : ''}">
            </div>
            
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" 
                       value="${not empty user ? user.state : ''}">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="retypePassword">Confirm Password:</label>
                <input type="password" id="retypePassword" name="retypePassword" required>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-submit">Register</button>
            </div>
        </form>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>

    <!-- Client-side validation script -->
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const retypePassword = document.getElementById('retypePassword').value;
            
            if (password !== retypePassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
            
           
            return true;
        });
    </script>
</body>
</html>