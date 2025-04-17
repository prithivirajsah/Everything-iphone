<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/register.css"/>
</head>
<body>

    <div class="register-box">
        <div class="title">Registration</div>
        <form action="${pageContext.request.contextPath}/Register" method="post">

			<div class="Signup">
                <div class="detail">
                    <label for="username">Full Name:</label>
                    <input type="text" id="FullName" name="FullName" required>
                </div>
            </div>

            <div class="Signupform">
                <div class="detail">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
            </div>

            <div class="Signup">
                <div class="detail">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required>
                </div>
            </div>

			<div class="Signupform">
                <div class="detail">
                    <label for="username">Phone Number:</label>
                    <input type="text" id="username" name="username" required>
                </div>
            </div>
            
            <div class="Signup">
            <div class="detail">	
            	<span class="details">Gender</span> 
            	<select name="gender" required>
            	
				<option value="" disabled selected>Select your gender</option>

				<option value="male">Male</option>

				<option value="female">Female</option>

				<option value="other">Other</option>

				</select>
            </div>
            </div>
            
            <div class="Signupform">
                <div class="detail">
                    <label for="username">Province:</label>
                    <input type="text" id="province" name="province" required>
                </div>
                
            </div>
            <div class="Signup">
                <div class="detail">
                    <label for="username">City:</label>
                    <input type="text" id="city" name="city" required>
                </div>
            </div>
            <div class="Signupform">
                <div class="detail">
                    <label for="username">State:</label>
                    <input type="text" id="state" name="state" required>
                </div>
            </div>
            
            <div class="Signup">
                <div class="detail">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>
            
            <div class="Signupform">
                <div class="detail">
                    <label for="password">Confirm Password:</label>
                    <input type="password" id="comfirmpassword" name="confirmpassword" required>
                </div>
            </div>

            <div class="button">
                <button type="submit" class="login-button">Register</button>
            </div>

            <div class="signuptext">
                Already have an account? 
                <a href="${pageContext.request.contextPath}/Pages/login.jsp">Login</a>
            </div>

        </form>
    </div>

</body>
</html>