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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/Profile.css">
</head>
<body>
    <div class="container">
        <h2>My Profile</h2>
        <form action="UpdateProfileServlet" method="post">
            <label for="FullName">Full Name</label>
            <input type="text" id="FullName" name="fullName" required>

            <label for="NICKName">User Name</label>
            <input type="text"  id="NickName" name="nickName" required>

            <label for="Email">Email</label>
            <input type="email" name="email" required>

            <label for="Phone Number">Phone Number</label>
            <input type="text" name="phone"  required>

            <label for="School"></label>
            <input type="text" name="" required>

            <label for="Location"></label>
            <input type="text" name="" required>

            <button type="submit" class="btn">Save Changes</button>
        </form>
    </div>
</body>
</html>