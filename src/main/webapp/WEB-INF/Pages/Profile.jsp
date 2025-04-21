<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String fullName = (String) session.getAttribute("fullName");
    String nickName = (String) session.getAttribute("nickName");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String school = (String) session.getAttribute("school");
    String location = (String) session.getAttribute("location");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/Profile.css ">
</head>
<body>
    <div class="container">
        <h2>My Profile</h2>
        <form action="UpdateProfileServlet" method="post">
            <label for="FullName">Full Name</label>
            <input type="text" name="fullName" value="<%= fullName %>" required>

            <label for="NICKName">Nick Name</label>
            <input type="text" name="nickName" value="<%= nickName %>">

            <label for="Email">Email Address</label>
            <input type="email" name="email" value="<%= email %>" readonly>

            <label for="Phone Number">Phone Number</label>
            <input type="text" name="phone" value="<%= phone %>">

            <label for="School">School</label>
            <input type="text" name="school" value="<%= school %>">

            <label for="Location">Location</label>
            <input type="text" name="location" value="<%= location %>" readonly>

            <button type="submit" class="btn">Save Changes</button>
        </form>
    </div>
</body>
</html>