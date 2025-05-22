<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/UserManagement.css"/>
</head>
<body>
<div class="sidebar">
   <h2>Admin Panel</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/DashboardServlet" class="active">Dashboard</a></li>
    		<li><a href="${pageContext.request.contextPath}/AdminProductServlet" class="active">Products Management</a></li>
    		<li><a href="${pageContext.request.contextPath}/OrderManagementServlet" class="active">Orders Management</a></li>
    		<li><a href="${pageContext.request.contextPath}/AdminUserServlet" class="active">User Management</a></li>
        </ul>
</div>
    
<div class="container" style="padding-left: 120px;">

        <h2 class="dashboard">User Management</h2>
         
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/AdminUserServlet" method="post">
                <input type="hidden" name="userId" value="${user.userId}">
                <input type="hidden" name="action" value="${empty user ? 'add' : 'update'}">
                
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="userName" value="${user.userName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" value="${user.email}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" name="phoneNumber" value="${user.phoneNumber}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Gender</label>
                        <select class="form-select" name="gender">
                            <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                            <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">City</label>
                        <input type="text" class="form-control" name="city" value="${user.city}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">State</label>
                        <input type="text" class="form-control" name="state" value="${user.state}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Role</label>
                        <select class="form-select" name="role">
                        
                            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>admin</option>
                        </select>
                    </div>
                    <c:if test="${not empty user}">
                        <div class="col-md-6">
                            <label class="form-label">New Password</label>
                            <input type="password" class="form-control" name="newPassword">
                        </div>
                    </c:if>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">
                            ${empty user ? 'Add User' : 'Update User'}
                        </button>
                        <c:if test="${not empty user}">
                            <a href="${pageContext.request.contextPath}/AdminUserServlet" class="btn btn-secondary">Cancel</a>
                        </c:if>
                    </div>
                </div>
            </form>
        </div>
        
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.userId}</td>
                        <td>${u.userName}</td>
                        <td>${u.fullName}</td>
                        <td>${u.email}</td>
                        <td>${u.role}</td>
                        <td class="action-btns">
                            <a href="${pageContext.request.contextPath}/AdminUserServlet?userId=${u.userId}" class="btn btn-sm btn-warning">Edit</a>
                            <form action="${pageContext.request.contextPath}/AdminUserServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="userId" value="${u.userId}">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>