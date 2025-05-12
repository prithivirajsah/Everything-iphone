<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation - Everything iPhone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/orderConfirmation.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
    
    <div class="confirmation-container">
        <h1>Order Confirmation</h1>
        
        <c:if test="${not empty successMessage}">
            <div class="success-message">${successMessage}</div>
        </c:if>
        
        <div class="confirmation-details">
            <h2>Thank you for your order!</h2>
            <p><strong>Order Number:</strong> ${orderId}</p>
            <p><strong>Order Date:</strong> <fmt:formatDate value="${orderDate}" pattern="MMM dd, yyyy hh:mm a"/></p>
            <p><strong>Total Amount:</strong> NPR <fmt:formatNumber value="${orderTotal}" type="number" maxFractionDigits="2"/></p>
            <p>We've received your order and will process it shortly.</p>
        </div>
        
        <div class="actions">
            <a href="ProductServlet" class="continue-shopping">Continue Shopping</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>