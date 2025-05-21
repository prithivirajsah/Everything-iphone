<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, model.ProductModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/home.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
</head>
<body>

<jsp:include page="header.jsp" />

<section class="header">
  <div class="textbox">
    <h1>Everything iPhone</h1>
    <p>Explore every iPhone model from iPhone X to iPhone 16 Pro Max</p>
    <a href="ProductServlet" class="shop-button">Shop More</a>
    <div class="launch-section">
      <h2>Newly Launched</h2>
      <img src="https://forums.macrumors.com/attachments/img_4125-jpeg.2414694/" alt="Newly Launched iPhone" class="launch-img"/>
    </div>
  </div>
</section>

<section class="product-grid">
<c:forEach var="product" items="${products}" varStatus="status">
  <c:if test="${status.index lt 3}">
    <div class="product-card">
      <div class="product-image">
        <img src="${product.imageUrl}" alt="${product.productName}">
        <span class="storage-badge">${product.category}</span>
        <span class="new-badge">New</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">${product.productName}</h3>
        <p class="product-description">${product.productDesc}</p>
        <div class="color-info">
          <div class="color-dot" style="background: #ccc;"></div>
          <span class="color-name">${product.category}</span>
        </div>
        <div class="price-action">
          <span class="price">${product.productPrice} NPR</span>
        </div>
        <form action="AddtoCartServlet" method="post" style="display: inline;">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productId" value="${product.productId}">
            <input type="number" name="quantity" value="1" min="1" style="width: 50px; height:30px;">
            <button type="submit" class="buy-button">Add To Cart</button>
          </form>
      </div>
    </div>
  </c:if>
</c:forEach>
</section>

<jsp:include page="footer.jsp" />

</body>
</html>