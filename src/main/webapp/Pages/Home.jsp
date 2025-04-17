<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Everything iPhone - Authorized Apple iPhone Seller" />
  <meta name="author" content="Everything iPhone"/>
  <title>Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Home.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/footer.css"/>
</head>
<body>

  <!-- Header Include -->
	<jsp:include page="header.jsp"/>
	
  <!-- Hero Section -->	
  <section class="header">
    <div class="textbox">
      <h1>Everything iPhone</h1>
      <p>Explore every iPhone model from iPhone X to iPhone 16 Pro Max</p>
      <a href="Product.jsp" class="shop-button">Shop Now</a>
      <div class="launch-section">
        <h2>Newly Launched</h2>
        <img src="../Resources/image/iphone16promax.jpg" alt="Newly Launched iPhone"  class="launch-img"/>
      </div>
    </div>
  </section>

  <!-- Customer Reviews -->
  <section class="reviews">
    <h2>Customers Review</h2>
    <div class="review-container">
      <div class="review-card"> 
        <p><strong>“Everything iPhone meets our needs perfectly.”</strong></p>
        <div class="stars">★★★★★</div>
        <span class="company">– Anonymous</span>
      </div>
      <div class="review-card">
        <p><strong>“Smooth checkout.”</strong></p>
        <div class="stars">★★★★★</div>
        <span class="company">– Anonymous</span>
      </div>
      <div class="review-card">
        <p><strong>“Great discount.”</strong></p>
        <div class="stars">★★★★★</div>
        <span class="company">– Anonymous</span>
      </div>
    </div>
  </section>
  
  <!-- Footer Include -->
	<jsp:include page="footer.jsp" />	

</body>
</html>