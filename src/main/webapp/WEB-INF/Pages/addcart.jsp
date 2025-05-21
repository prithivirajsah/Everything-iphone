<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Cart - Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/addcart.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
  		<jsp:include page="header.jsp"/>

  <div class="container">
    <h1>Cart</h1>
    
    <c:if test="${not empty successMessage}">
        <div class="success-message">${successMessage}</div>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
    
    <table>
        <thead>
          <tr>
            <th>Product</th>
            <th>Price (NPR)</th>
            <th>Quantity</th>
            <th>Subtotal (NPR)</th>
            <th>Action</th>
          </tr>
        </thead>
        
        <tbody>
          <c:choose>
            <c:when test="${empty cartItems}">
              <tr>
                <td colspan="5">Your cart is empty</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="item" items="${cartItems}">
                <tr>
                  <td>${item.productName}</td>
                  <td>${item.productPrice}</td>
                  <td>
                      <form action="AddtoCartServlet" method="post" style="display: inline;">
                          <input type="hidden" name="action" value="update">
                          <input type="hidden" name="productId" value="${item.productId}">
                          <input type="number" name="quantity" value="${item.quantity}" min="1">
                          <button type="submit">Update</button>
                      </form>
                  </td>
                  <td>${item.totalProductPrice}</td>
                  <td>
                      <form action="AddtoCartServlet" method="post" style="display: inline;">
                          <input type="hidden" name="action" value="remove">
                          <input type="hidden" name="productId" value="${item.productId}">
                          <button type="submit" class="remove-btn">Remove</button>
                      </form>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
    </table>

    <div class="total">Total: ${totalPrice} NPR</div>
    
    <c:if test="${not empty cartItems}">
        <form action="AddtoCartServlet" method="post">
            <input type="hidden" name="action" value="clear">
            <button type="submit" class="clear-btn">Clear Cart</button>
        </form>
        
        <!-- Simplified Checkout Button -->
        <form action="CheckoutServlet" method="post">
            <button type="submit" class="checkout-btn">Checkout</button>
        </form>
    </c:if>
  </div>
  
  <jsp:include page="footer.jsp"/>
</body>
</html>