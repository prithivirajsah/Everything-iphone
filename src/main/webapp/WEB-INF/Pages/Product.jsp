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
  <script>
    function submitSearch() {
        document.forms['searchForm'].submit();
    }
  </script>
</head>
<body>
  <jsp:include page="header.jsp"/>
  <section class="product-header">
    <h1>Our Products</h1>
    <p>Discover our collection of premium iPhones</p>
    <form id="searchForm" action="${pageContext.request.contextPath}/ProductServlet" method="get" class="search-filter">
        <input type="text" name="search" placeholder="Search iPhones..." class="search-input" 
               value="${param.search}" onkeyup="submitSearch()">
       
    </form>
  </section>
<section class="product-grid">
    <c:choose>
        <c:when test="${empty products}">
            <div class="no-products">
                <p>No products found matching your criteria.</p>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="product" items="${products}">
                <a href="${pageContext.request.contextPath}/ProductDetailsServlet?productId=${product.productId}" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="${product.imageUrl}" alt="${product.productName}">
                            <span class="storage-badge">${product.stock}GB</span>
                            <c:if test="${product.productPrice > 1000}">
                                <span class="new-badge">New</span>
                            </c:if>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">${product.productName}</h3>
                            <p class="product-description">${product.productDesc}</p>
                            <div class="color-info">
                                <span class="color-name">${product.category}</span>
                            </div>
                            <div class="price-action">
                                <span class="price">${product.productPrice} NPR</span>
                                <!-- Form moved outside the anchor to prevent nested forms -->
                            </div>
                        </div>
                <form action="${pageContext.request.contextPath}/AddtoCartServlet" method="post" class="add-to-cart-form">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="number" name="quantity" value="1" min="1" style="width: 50px; height:30px;">
                    <button type="submit" class="buy-button">Add To Cart</button>
                </form>
                    </div>
                </a>
                <!-- Add to Cart form placed outside the anchor -->
            </c:forEach>
        </c:otherwise>
    </c:choose>
</section>

  <jsp:include page="footer.jsp"/>
</body>
</html>