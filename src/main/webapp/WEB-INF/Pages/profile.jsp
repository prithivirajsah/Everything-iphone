<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/profile.css">
    
</head>
<body>
    <div class="container">
        <h2>My Profile</h2>
        <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" name="firstName" value="${firstName}" required>

            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" name="lastName" value="${lastName}" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${username}" required>

            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" value="${dob}" required>

            <label for="gender">Gender</label>
            <select name="gender" id="gender" required>
                <option value="" disabled <c:if test="${empty gender}">selected</c:if>>Choose option</option>
                <option value="male" ${gender == 'male' ? 'selected' : ''}>Male</option>
                <option value="female" ${gender == 'female' ? 'selected' : ''}>Female</option>
            </select>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${email}" required>

            <label for="phoneNumber">Phone Number</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${phoneNumber}" required>

            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" value="${subject}" required>

            <label for="password">New Password (optional)</label>
            <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">

            <label for="image">Profile Image</label>
            <input type="file" id="image" name="image" accept="image/*">

            <button type="submit" class="btn">Save Changes</button>
        </form>
    </div>
</body>
</html>
