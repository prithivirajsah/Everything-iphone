<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Cart - Everything iPhone</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/addcart.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Footer.css"/>
  
</head>
<body>

<!-- Header Include -->
	<jsp:include page="header.jsp"/>

<div class="container">
<h1>Cart</h1>
  
<table>
    <thead>
      <tr>
        <th>Product</th>
        <th>Price (NPR)</th>
        <th>Quantity</th>
        <th>Subtotal (NPR)</th>
      </tr>
    </thead>
    
    <tbody id="cart-items"></tbody>
 </table>

  <div class="total" id="total-price">Total: 0 NPR</div>
  
    <button onclick="clearCart()">Clear Cart</button>
    
  </div>
  
  <!-- Footer Include -->
	<jsp:include page="footer.jsp"/>

  <script>
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartItemsContainer = document.getElementById('cart-items');
    const totalPriceElement = document.getElementById('total-price');

    let total = 0;

    if (cart.length === 0) {
        cartItemsContainer.innerHTML = "<tr> <td colspan='4'>Your cart is empty</td> </tr>";
      } 
    else {
        cart.forEach(item => {
          const subtotal = item.price * item.quantity;
          total += subtotal;

      const row = `
        <tr>
          <td>${item.name}</td>
          <td>${item.price}</td>
          <td>${item.quantity}</td>
          <td>${subtotal}</td>
        </tr>
      `;
      cartItemsContainer.innerHTML += row;
    });

    totalPriceElement.innerText = ⁠ Total: ${total} NPR ⁠;
    
    function clearCart() {
        localStorage.removeItem('cart');
        alert("Cart has been cleared!");
        window.location.reload();
      }
  </script>
  
</body>
</html>