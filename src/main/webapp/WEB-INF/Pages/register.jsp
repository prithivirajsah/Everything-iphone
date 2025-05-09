<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Register.css"/>
<style>
	form div input{
		width:50%;
	}
</style>
</head>
<body>
	<!-- Image Section -->
            <div class="image-section">
                <img src="https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg" alt="Login Illustration" />
            </div>
    <div class="register-box">
        <div class="register-content">
            <!-- Form Section -->
            <div class="form-section">
            	<h1>Registration</h1>
                <form action="${pageContext.request.contextPath}/Register" method="post">
                <div>
                        <div class="detail">
                            <label for="FullName">Full Name:</label>
                            <input type="text" id="FullName" name="FullName" required>
                        </div>

                        <div class="detail">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="detail">
                            <label for="email">Email:</label>
                            <input type="text" id="email" name="email" required>
                        </div>
                        <div class="detail">
                            <label for="phone">Phone Number:</label>
                            <input type="text" id="phone" name="phone" required>
                        </div>
                        <div class="detail">    
                            <span class="details">Gender</span> 
                            <select name="gender" required>
                                <option value="" disabled selected>Select your gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="detail">
                            <label for="city">City:</label>
                            <input type="text" id="city" name="city" required>
                        </div>
                        <div class="detail">
                             <label for="state">State:</label>
                            <input type="text" id="state" name="state" required>
                        </div>
                        <div class="detail">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="detail">
                            <label for="confirmpassword">Confirm Password:</label>
                            <input type="password" id="confirmpassword" name="confirmpassword" required>
                        </div>
                    <div class="button">
                        <button type="submit" class="login-button">Register</button>
                    </div>

                    <div class="signuptext">
                        Already have an account? 
                        <a href="${pageContext.request.contextPath}/logincontroller">Login</a>
                    </div>
				</div>
                </form>
            </div>
        </div>
    </div>
    
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        form.addEventListener("submit", function (e) {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmpassword").value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert("Passwords do not match!");
            }
        });
    });
</script>

</body>
</html>
