<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Management</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Servlet.css"/>
</head>
<body>
  <!-- servlet Include -->
	<jsp:include page="Servlet.jsp"/>
    <!-- User Management -->
    <div id="users" class="section">
      <h3>User Management</h3>
      <form>
        <input type="text" placeholder="Username" />
        <input type="email" placeholder="Email" />
        <select>
          <option>Customer</option>
          <option>Delivery Staff</option>
          <option>Support Team</option>
          <option>Admin</option>
        </select>
        
        <button type="submit">Create/Update User</button>
      </form>
      
      <table>
        <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Action</th>
        </tr>
        
        <tr>
        <td>john_d</td>
        <td>john@example.com</td>
        <td>Customer</td>
        <td><button>Delete</button></td>
        </tr>
        
        <tr>
        <td>kate_admin</td>
        <td>kate@shop.com</td>
        <td>Admin</td>
        <td><button>Delete</button></td>
        </tr>
      </table>
    </div>
</body>
</html>