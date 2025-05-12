<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Everything iPhone - Products Page">
  <title>Products - Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Product.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>
  <jsp:include page="header.jsp"/>
  <section class="product-header">
    <h1> Our Products</h1>
    <p>Discover our collection of premium iPhones</p>
    <div class="search-filter">
      <input type="text" placeholder="Search iPhones..." class="search-input">
      <select class="storage-select">
        <option value="all">All Storage</option>
        <option value="64">64GB</option>
        <option value="128">128GB</option>
        <option value="256">256GB</option>
        <option value="512">512GB</option>
        <option value="1TB">1TB</option>
      </select>
    </div>
  </section>

  <section class="product-grid">
   <c:forEach var="product" items="${products}">
    <div class="product-card">
        <div class="product-image">
            <img src="${product.imageUrl}" alt="${product.productName}">
            <span class="storage-badge">${product.stock}GB</span>
            <c:choose>
                <c:when test="${product.productPrice > 1000}">
                    <span class="new-badge">New</span>
                </c:when>
                <c:otherwise>
                    <span class="new-badge"></span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="product-info">
            <h3 class="product-name">${product.productName}</h3>
            <p class="product-description">${product.productDesc}</p>
            <div class="color-info">
                <span class="color-name">${product.category}</span>
            </div>
            <div class="price-action">
                <span class="price">${product.productPrice} NPR</span>
                <form action="AddtoCartServlet" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="number" name="quantity" value="1" min="1" style="width: 50px;">
                    <button type="submit" class="buy-button">Add To Cart</button>
                </form>
            </div>
        </div>
    </div>
   </c:forEach>
  </section>

  <jsp:include page="footer.jsp"/>
</body>
</html>