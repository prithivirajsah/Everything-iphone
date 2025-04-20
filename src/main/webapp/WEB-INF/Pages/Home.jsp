<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  
  <meta name="description" content="Everything iPhone - Authorized Apple iPhone Seller" />
  <meta name="author" content="Everything iPhone"/>
  <title>Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/home.css"/>
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
      <a href="productcontroller" class="shop-button">Shop More</a>
      <div class="launch-section">
        <h2>Newly Launched</h2>
        <img src="${pageContext.request.contextPath}/Resources/image/iphone16promax.jpg" alt="Newly Launched iPhone"  class="launch-img"/>
      </div>
    </div>
  </section>
  
  <section class="product-grid">
    <!-- iPhone 16 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-max-2.jpg" alt="iPhone 16 Pro Max">
        <span class="storage-badge">1TB</span>
        <span class="new-badge">New</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 16 Pro Max</h3>
        <p class="product-description">Revolutionary spatial computing with A18 Pro chip.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #4F4E4C;"></div>
          <span class="color-name">Natural Titanium</span>
        </div>
        <div class="price-action">
          <span class="price">234000 NPR</span>
          <a href="addcart.jsp"><button class="buy-button" >Buy Now</button></a> 
        </div>
      </div>
    </div>

    <!-- iPhone 16 Pro -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn.gsmarena.com/imgroot/reviews/24/apple-iphone-16-pro/lifestyle/-1024w2/gsmarena_011.jpg" alt="iPhone 16 Pro">
        <span class="storage-badge">512GB</span>
        <span class="new-badge">New</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 16 Pro</h3>
        <p class="product-description">Pro camera system with next-gen AI capabilities.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #3B4245;"></div>
          <span class="color-name">Space Black Titanium</span>
        </div>
        <div class="price-action">
          <span class="price">200000 NPR</span>
          <button class="buy-button">Buy Now</button>
        </div>
      </div>
    </div>

    <!-- iPhone 16 -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/v/iphone-16/f/images/overview/design/all_colors__flhn5cmb1t26_xlarge_2x.jpg" alt="iPhone 16">
        <span class="storage-badge">256GB</span>
        <span class="new-badge">New</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 16</h3>
        <p class="product-description">Powerful features in a beautiful design.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #B8C0C2;"></div>
          <span class="color-name">Silver</span>
        </div>
        <div class="price-action">
          <span class="price">180000 NPR</span>
          <button class="buy-button">Buy Now</button>
        </div>
      </div>
    </div>
    
        <!-- iPhone 15 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-15-pro-max-1.jpg" alt="iPhone 15 Pro Max">
        <span class="storage-badge">256GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 15 Pro Max</h3>
        <p class="product-description">Titanium design with A17 Pro chip.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #635C74;"></div>
          <span class="color-name">Natural Titanium</span>
        </div>
        <div class="price-action">
          <span class="price">150000 NPR</span>
          <button class="buy-button">Buy Now</button>
        </div>
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