<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta name="description" content="Everything iPhone - Products Page">
  <title>Products - Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Product.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/footer.css"/>
  
  
</head>
<body>

	<jsp:include page="header.jsp" />
  

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
          <button class="buy-button">Add To Cart</button>
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
          <button class="buy-button">Add To Cart</button>
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
          <button class="buy-button">Add To Cart</button>
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
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 15 Pro -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-color-lineup-230912_big.jpg.large_2x.jpg" alt="iPhone 15 Pro">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 15 Pro</h3>
        <p class="product-description">Pro camera system for mind-blowing detail.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #4B4F5E;"></div>
          <span class="color-name">Blue Titanium</span>
        </div>
        <div class="price-action">
          <span class="price">125000</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 15 -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-15-2.jpg" alt="iPhone 15">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 15</h3>
        <p class="product-description">A magical new way to experience iPhone.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #FAE0E2;"></div>
          <span class="color-name">Pink</span>
        </div>
        <div class="price-action">
          <span class="price">110000 NPR</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 14 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-14-pro-4.jpg" alt="iPhone 14 Pro Max">
        <span class="storage-badge">256GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 14 Pro Max</h3>
        <p class="product-description">Dynamic Island and Always-On display.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #635C74;"></div>
          <span class="color-name">Deep Purple</span>
        </div>
        <div class="price-action">
          <span class="price">140000 NPR</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 14 Pro -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-14-pro-4.jpg" alt="iPhone 14 Pro">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 14 Pro</h3>
        <p class="product-description">Pro camera system with 48MP main.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #F4E8CE;"></div>
          <span class="color-name">Gold</span>
        </div>
        <div class="price-action">
          <span class="price">125000 NPR</span>
         <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>
    
    <!-- iPhone 14 -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://hukut.com/_next/image?url=https%3A%2F%2Fcdn.hukut.com%2Fiphone_14_midnight.webp&w=3840&q=75" alt="iPhone 14">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 14</h3>
        <p class="product-description">The looongest battery life of any iPhone Ever.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #F4E8CE;"></div>
          <span class="color-name">Gold</span>
        </div>
        <div class="price-action">
          <span class="price">100000 NPR</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>
    
    <!-- iPhone 14 plus -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://qualitycomputer.com.np/web/image/product.product/49134/image_1024/Apple%20iPhone%2014%20Plus%20%28Midnight%2C%20128GB%29?unique=42f7f38" alt="iPhone 14Plus">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 14 Plus</h3>
        <p class="product-description">The longest battery life of any iPhone Ever.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #F4E8CE;"></div>
          <span class="color-name">Gold</span>
        </div>
        <div class="price-action">
          <span class="price">110000 NPR</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 13 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iPhone-13-Pro_Colors_09142021_big.jpg.large_2x.jpg" alt="iPhone 13 Pro Max">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 13 Pro Max</h3>
        <p class="product-description">Huge camera upgrades and ProMotion.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #A7C1D9;"></div>
          <span class="color-name">Sierra Blue</span>
        </div>
        <div class="price-action">
          <span class="price">90000 NPR</span>
         <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 12 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone12pro-stainless-steel-gold_10132020_inline.jpg.large_2x.jpg" alt="iPhone 12 Pro Max">
        <span class="storage-badge">128GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 12 Pro Max</h3>
        <p class="product-description">5G speed and A14 Bionic chip.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #005687;"></div>
          <span class="color-name">Pacific Blue</span>
        </div>
        <div class="price-action">
          <span class="price">80000 NPR</span>
         <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone 11 Pro Max -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iPhone-11-Pro_Colors_091019_big.jpg.large_2x.jpg" alt="iPhone 11 Pro Max">
        <span class="storage-badge">64GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 11 Pro Max</h3>
        <p class="product-description">Triple-camera system with Night mode.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #4E5851;"></div>
          <span class="color-name">Midnight Green</span>
        </div>
        <div class="price-action">
          <span class="price">70000 NPR</span>
          <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>
    
     <!-- iPhone 11 Pro -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.olizstore.com/media/catalog/product/cache/a04ec30316eb04ee0a0c68cae51f73f4/i/p/iphone-11-pro-select-2019_1_1.jpeg" alt="iPhone 11 Pro">
        <span class="storage-badge">64GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 11 Pro</h3>
        <p class="product-description">Triple-camera system with Night mode.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #4E5851;"></div>
          <span class="color-name">Midnight Green</span>
        </div>
        <div class="price-action">
          <span class="price">65000 NPR</span>
         <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>
    
    <!-- iPhone 11 -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone_11-rosette-family-lineup-091019_big.jpg.large_2x.jpg" alt="iPhone 11 Pro">
        <span class="storage-badge">64GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone 11</h3>
        <p class="product-description">Night mode.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #4E5851;"></div>
          <span class="color-name">Midnight Green</span>
        </div>
        <div class="price-action">
          <span class="price">60000 NPR</span>
        <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>

    <!-- iPhone X -->
    <div class="product-card">
      <div class="product-image">
        <img src="https://www.apple.com/newsroom/images/product/iphone/standard/iphonex_front_back_glass_big.jpg.large_2x.jpg" alt="iPhone X">
        <span class="storage-badge">64GB</span>
      </div>
      <div class="product-info">
        <h3 class="product-name">iPhone X</h3>
        <p class="product-description">The all-screen design that started it all.</p>
        <div class="color-info">
          <div class="color-dot" style="background: #E4E4E2;"></div>
          <span class="color-name">Silver</span>
        </div>
        <div class="price-action">
          <span class="price">4000 NPR</span>
     <button class="buy-button">Add To Cart</button>
        </div>
      </div>
    </div>
  </section>

    <jsp:include page="footer.jsp"/>

  <script>
    const searchInput = document.querySelector('.search-input');
    const storageSelect = document.querySelector('.storage-select');
    const productCards = document.querySelectorAll('.product-card');

    function filterProducts() {
      const searchTerm = searchInput.value.toLowerCase();
      const selectedStorage = storageSelect.value;

      productCards.forEach(card => {
        const name = card.querySelector('.product-name').textContent.toLowerCase();
        const storage = card.querySelector('.storage-badge').textContent;
        const matchesText = name.includes(searchTerm);
        const matchesStorage = selectedStorage === 'all' || storage.includes(selectedStorage);
        card.style.display = matchesText && matchesStorage ? 'block' : 'none';
      });
    }

    searchInput.addEventListener('input', filterProducts);
    storageSelect.addEventListener('change', filterProducts);
  </script>
</body>
</html>