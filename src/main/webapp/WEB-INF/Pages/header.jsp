<%@ page import="java.util.*" %>
<%
  String currentPage = request.getRequestURI();
%>
<link rel="stylesheet" href="Header.css"/>

<nav class="navbar center-nav">
  <ul>
    <li><a href="${pageContext.request.contextPath}/HomeServlet" class="<%= currentPage.endsWith("Home.jsp") ? "active" : "" %>">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/ProductServlet" class="<%= currentPage.endsWith("Product.jsp") ? "active" : "" %>">Products</a></li>
    <li><a href="${pageContext.request.contextPath}/AboutServlet" class="<%= currentPage.endsWith("aboutus.jsp") ? "active" : "" %>">About Us</a></li>
    <li><a href="${pageContext.request.contextPath}/ContactServlet" class="<%= currentPage.endsWith("contactus.jsp") ? "active" : "" %>">Contact us</a></li>
	<li><a href="${pageContext.request.contextPath}/AddtoCartServlet" class="<%= currentPage.endsWith("addcart.jsp") ? "active" : "" %>">Cart</a></li>
    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
  </ul>
</nav>