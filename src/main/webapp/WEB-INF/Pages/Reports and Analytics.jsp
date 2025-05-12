<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Servlet.css"/>
</head>
<body>
  <!-- servlet Include -->
	<jsp:include page="Servlet.jsp"/>
    <!-- Reports & Analytics -->
    <div id="analytics" class="section">
      <h3>Reports and Analytics</h3>
      <table>
        <tr>
        <th>Metric</th>
        <th>Value</th>
        </tr>
        
        <tr>
        <td>Top-Selling Product</td>
        <td>Wireless Headphones</td>
        </tr>
        
        <tr>
        <td>Monthly Sales</td>
        <td>$15,000</td>
        </tr>
        
        <tr>
        <td>Returning Customers</td>
        <td>45%</td>
        </tr>
        
        <tr>
        <td>Average Order Value</td>
        <td>$75</td>
        </tr>
      </table>
    </div>
</body>
</html>