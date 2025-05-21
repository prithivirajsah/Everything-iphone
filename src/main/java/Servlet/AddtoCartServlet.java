package Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.CartItemModels;
import model.CartModel;
import model.ProductModel;
import model.UserModel;
import Dao.CartItemModelsDAO;
import Dao.CartModelDAO;
import Dao.ProductModelDAO;
import Dao.UserModelDAO;
import util.CookieUtil;

@WebServlet("/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartModelDAO cartDao;
    private CartItemModelsDAO cartItemDao;
    private ProductModelDAO productDao;
    private UserModelDAO userDao;

    @Override
    public void init() throws ServletException {
        cartDao = new CartModelDAO();
        cartItemDao = new CartItemModelsDAO();
        productDao = new ProductModelDAO();
        userDao = new UserModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // First check session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        // If no session, check cookie
        if (userId == null) {
            Cookie usernameCookie = CookieUtil.getCookie(request, "username");
            if (usernameCookie != null) {
                try {
                    String username = CookieUtil.getDecodedValue(usernameCookie);
                    UserModel user = userDao.getUserByUsername(username);
                    if (user != null) {
                        userId = user.getUserId();
                        session.setAttribute("userId", userId); // Set in session for future requests
                    } else {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    response.sendRedirect("login.jsp");
                    return;
                }
            } else {
                response.sendRedirect("login.jsp");
                return;
            }
        }

        try {
            // Get user's cart
            CartModel cart = cartDao.getCartByUserId(userId);
            if (cart != null) {
                // Get cart items with product details
                List<CartItemModels> cartItems = cartItemDao.getCartItemsByCartId(cart.getCartId());
                request.setAttribute("cartItems", cartItems);
                
                // Calculate total price
                double total = cartItems.stream()
                    .mapToDouble(CartItemModels::getTotalProductPrice)
                    .sum();
                request.setAttribute("totalPrice", total);
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/addcart.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading cart");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/addcart.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // First check session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        // If no session, check cookie
        if (userId == null) {
            Cookie usernameCookie = CookieUtil.getCookie(request, "username");
            if (usernameCookie != null) {
                try {
                    String username = CookieUtil.getDecodedValue(usernameCookie);
                    UserModel user = userDao.getUserByUsername(username);
                    if (user != null) {
                        userId = user.getUserId();
                        session.setAttribute("userId", userId); // Set in session for future requests
                    } else {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    response.sendRedirect("login.jsp");
                    return;
                }
            } else {
                response.sendRedirect("login.jsp");
                return;
            }
        }

        try {
            String action = request.getParameter("action");
            
            if ("add".equals(action)) {
                addToCart(request, response, userId);
            } else if ("remove".equals(action)) {
                removeFromCart(request, response, userId);
            } else if ("update".equals(action)) {
                updateCartItem(request, response, userId);
            } else if ("clear".equals(action)) {
                clearCart(request, response, userId);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing cart operation");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/addcart.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response, int userId)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String quantityParam = request.getParameter("quantity");
            int quantity = quantityParam != null ? Integer.parseInt(quantityParam) : 1;

            // Get or create cart
            CartModel cart = cartDao.getCartByUserId(userId);
            if (cart == null) {
                cart = new CartModel();
                cart.setUserId(userId);
                cart.setCartQty(0);
                cartDao.addCart(cart);
                cart = cartDao.getCartByUserId(userId);
            }

            // Get product
            ProductModel product = productDao.getProductById(productId);
            if (product == null) {
                request.setAttribute("errorMessage", "Product not found");
                doGet(request, response);
                return;
            }

            // Check stock availability
            if (product.getStock() < quantity) {
                request.setAttribute("errorMessage", "Not enough stock available");
                doGet(request, response);
                return;
            }

            // Check if item exists
            CartItemModels existingItem = cartItemDao.getCartItem(cart.getCartId(), productId);
            
            if (existingItem != null) {
                // Check if total quantity exceeds stock
                if (product.getStock() < (existingItem.getQuantity() + quantity)) {
                    request.setAttribute("errorMessage", "Not enough stock available");
                    doGet(request, response);
                    return;
                }
                
                // Update existing item
                existingItem.setQuantity(existingItem.getQuantity() + quantity);
                existingItem.setTotalProductPrice(product.getProductPrice() * existingItem.getQuantity());
                cartItemDao.updateCartItem(existingItem);
            } else {
                // Add new item
                CartItemModels newItem = new CartItemModels();
                newItem.setCartId(cart.getCartId());
                newItem.setProductId(productId);
                newItem.setQuantity(quantity);
                newItem.setTotalProductPrice(product.getProductPrice() * quantity);
                cartItemDao.addCartItem(newItem);
            }

            // Update cart quantity
            cart.setCartQty(cart.getCartQty() + quantity);
            cartDao.updateCart(cart);

            request.setAttribute("successMessage", "Product added to cart successfully!");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred");
        }
        doGet(request, response);
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response, int userId)
            throws SQLException, ClassNotFoundException, IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        CartModel cart = cartDao.getCartByUserId(userId);
        if (cart == null) {
            request.setAttribute("errorMessage", "Cart not found");
            doGet(request, response);
            return;
        }

        CartItemModels item = cartItemDao.getCartItem(cart.getCartId(), productId);
        if (item != null) {
            // Update cart quantity
            cart.setCartQty(cart.getCartQty() - item.getQuantity());
            cartDao.updateCart(cart);
            
            // Remove item
            cartItemDao.deleteCartItem(cart.getCartId(), productId);
            
            request.setAttribute("successMessage", "Item removed from cart");
        }

        doGet(request, response);
    }

    private void updateCartItem(HttpServletRequest request, HttpServletResponse response, int userId)
            throws SQLException, ClassNotFoundException, IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
        
        CartModel cart = cartDao.getCartByUserId(userId);
        if (cart == null) {
            request.setAttribute("errorMessage", "Cart not found");
            doGet(request, response);
            return;
        }

        CartItemModels item = cartItemDao.getCartItem(cart.getCartId(), productId);
        if (item != null) {
            ProductModel product = productDao.getProductById(productId);
            
            // Check stock availability
            if (product.getStock() < newQuantity) {
                request.setAttribute("errorMessage", "Not enough stock available");
                doGet(request, response);
                return;
            }
            
            // Calculate quantity difference
            int quantityDiff = newQuantity - item.getQuantity();
            
            // Update item
            item.setQuantity(newQuantity);
            item.setTotalProductPrice(product.getProductPrice() * newQuantity);
            cartItemDao.updateCartItem(item);
            
            // Update cart quantity
            cart.setCartQty(cart.getCartQty() + quantityDiff);
            cartDao.updateCart(cart);
            
            request.setAttribute("successMessage", "Cart updated successfully");
        }

        doGet(request, response);
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response, int userId)
            throws ServletException, IOException {
        try {
            CartModel cart = cartDao.getCartByUserId(userId);
            if (cart != null) {
                cartItemDao.deleteAllCartItems(cart.getCartId());
                cart.setCartQty(0);
                cartDao.updateCart(cart);
                request.setAttribute("successMessage", "Cart cleared successfully");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred");
        }
        doGet(request, response);
    }
}

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