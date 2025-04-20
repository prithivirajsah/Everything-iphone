<%@ page import="java.util.*" %>
<%
  String currentPage = request.getRequestURI();
%>
<link rel="stylesheet" href="header.css" />

<nav class="navbar center-nav">
  <ul>
    <li><a href="${pageContext.request.contextPath}/homecontroller" class="<%= currentPage.endsWith("Home.jsp") ? "active" : "" %>">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/productcontroller" class="<%= currentPage.endsWith("product.jsp") ? "active" : "" %>">Products</a></li>
    <li><a href="${pageContext.request.contextPath}/AboutUscontroller" class="<%= currentPage.endsWith("aboutus.jsp") ? "active" : "" %>">About Us</a></li>
    <li><a href="${pageContext.request.contextPath}/Contactuscontroller" class="<%= currentPage.endsWith("contact us.jsp") ? "active" : "" %>">Contact us</a></li>
    
    
    <li>
		<a href="${pageContext.request.contextPath}/addcardcontroller">
    		<img src="${pageContext.request.contextPath}/Resources/image/shopping-cart.png" alt="Cart" style=" width: 20px; height: 20px; vertical-align: middle; margin-left: 5px;" />
  		</a>
	</li>

    <li> 
    	<a href="${pageContext.request.contextPath}/logincontroller"> Login </a> 
    </li>
  	
  </ul>
</nav>