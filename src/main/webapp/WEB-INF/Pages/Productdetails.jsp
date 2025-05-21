<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName} - Everything iPhone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Productdetails.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <section class="product-details-container">
        <div class="product-images">
            <img src="${product.imageUrl}" alt="${product.productName}" class="main-image">
        </div>
        
        <div class="product-info">
            <h1>${product.productName}</h1>
            <div class="price-section">
                <span class="price">${product.productPrice} NPR</span>
                <c:if test="${product.productPrice > 1000}">
                    <span class="new-badge">New</span>
                </c:if>
            </div>
            
            <div class="storage-section">
                <span class="storage-badge">${product.stock}GB Storage</span>
            </div>
            
            <div class="description-section">
                <h3>Description</h3>
                <p>${product.productDesc}</p>
            </div>
            
            <div class="category-section">
                <span>Category: ${product.category}</span>
            </div>
            
            <form action="AddtoCartServlet" method="post" class="add-to-cart-form">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="productId" value="${product.productId}">
                <div class="quantity-selector">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
                </div>
                <button type="submit" class="buy-button">Add to Cart</button>
            </form>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>