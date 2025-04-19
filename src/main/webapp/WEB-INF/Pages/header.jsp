<%@ page import="java.util.*" %>
<%
  String currentPage = request.getRequestURI();
%>
<link rel="stylesheet" href="header.css" />

<nav class="navbar center-nav">
  <ul>
    <li><a href="${pageContext.request.contextPath}/homecontroller" class="<%= currentPage.endsWith("Home.jsp") ? "active" : "" %>">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/productcontroller" class="<%= currentPage.endsWith("product.jsp") ? "active" : "" %>">Products</a></li>
    <li><a href="${pageContext.request.contextPath}/Researchcontroller" class="<%= currentPage.endsWith("research.jsp") ? "active" : "" %>">Research</a></li>
    <li><a href="${pageContext.request.contextPath}/AboutUscontroller" class="<%= currentPage.endsWith("aboutus.jsp") ? "active" : "" %>">About Us</a></li>
    <li><a href="${pageContext.request.contextPath}/Contactuscontroller" class="<%= currentPage.endsWith("contact us.jsp") ? "active" : "" %>">Contact us</a></li>
    
    
    <li><a href="addcart.jsp">My Cart</a></li>
    <li><a href="login.jsp"> Login </a></li>
  	
  </ul>
</nav>