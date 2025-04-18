<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Cart - Everything iPhone</title>
  <link rel="stylesheet" href="/css/addcart.css">
</head>
<body>

<div class="container">
  <div class="cart">
    <h1>Your Cart</h1>
    <ul id="cart-list"></ul>
    <button onclick="clearCart()">Clear Cart</button>
  </div>
</div>

<script>
function addToCart(name, price, btn) {
  const qtyInput = btn.previousElementSibling;
  const qty = parseInt(qtyInput.value);

  let cart = JSON.parse(localStorage.getItem('cart')) || [];

  const existing = cart.find(item => item.name === name);
  if (existing) {
    existing.quantity += qty;
  } else {
    cart.push({ name, price, quantity: qty });
  }

  localStorage.setItem('cart', JSON.stringify(cart));
  alert(name + " added to cart!");
}

// Display cart on page load
function renderCart() {
  const cart = JSON.parse(localStorage.getItem('cart')) || [];
  const cartList = document.getElementById("cart-list");
  cartList.innerHTML = "";

  cart.forEach(item => {
    const li = document.createElement("li");
    li.textContent = `${item.name} × ${item.quantity} — Rs. ${item.quantity * item.price} NPR`;
    cartList.appendChild(li);
  });
}

function clearCart() {
  localStorage.removeItem('cart');
  renderCart();
}

renderCart(); // Initial render
</script>

</body>
</html>