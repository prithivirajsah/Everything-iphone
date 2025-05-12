<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="Servlet.css"/>
<nav class="navbar center-nav">
  <ul>
  <div class="Admin"> <h1>Admin Panel</h1> </div>
  	<li><a href="${pageContext.request.contextPath}/ProductManagementcontroller" class="active">Products Details</a></li>
  	<li><a href="${pageContext.request.contextPath}/OrderManagementcontroller">Order Management</a></li>
  	<li><a href="${pageContext.request.contextPath}/ReportsandAnalyticcontroller">Reports and Analytics</a></li>
    <li><a href="${pageContext.request.contextPath}/UserManagementcontroller">User Management</a></li>
  </ul>
</nav>