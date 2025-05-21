package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import model.CartItemModels;
import model.CartModel;
import model.OrderModel;
import model.OrderItemModels;
import model.ProductModel;
import Dao.CartItemModelsDAO;
import Dao.CartModelDAO;
import Dao.OrderItemModelsDAO;
import Dao.OrderModelDAO;
import Dao.ProductModelDAO;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartModelDAO cartDao;
    private CartItemModelsDAO cartItemDao;
    private OrderModelDAO orderDao;
    private OrderItemModelsDAO orderItemDao;
    private ProductModelDAO productDao;

    @Override
    public void init() throws ServletException {
        cartDao = new CartModelDAO();
        cartItemDao = new CartItemModelsDAO();
        orderDao = new OrderModelDAO();
        orderItemDao = new OrderItemModelsDAO();
        productDao = new ProductModelDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get user's cart
            CartModel cart = cartDao.getCartByUserId(userId);
            if (cart == null || cart.getCartQty() == 0) {
                session.setAttribute("errorMessage", "Your cart is empty");
                request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
                return;
            }

            // Get cart items
            List<CartItemModels> cartItems = cartItemDao.getCartItemsByCartId(cart.getCartId());
            
            // Calculate total quantity and amount
            int totalQuantity = cartItems.stream().mapToInt(CartItemModels::getQuantity).sum();
            double totalAmount = cartItems.stream()
                .mapToDouble(CartItemModels::getTotalProductPrice)
                .sum();

            // Create new order
            OrderModel order = new OrderModel();
            order.setUserId(userId);
            order.setOrderDate(new Date());
            order.setTotalQuantity(totalQuantity);
            order.setTotalAmount(totalAmount);
            order.setOrderStatus("Processing");
            
            // Add order to database and get the generated ID
            int orderId = orderDao.addOrder(order);
            
            // Add order items
            for (CartItemModels cartItem : cartItems) {
                OrderItemModels orderItem = new OrderItemModels();
                orderItem.setOrderId(orderId);
                orderItem.setProductId(cartItem.getProductId());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getProductPrice());
                orderItemDao.addOrderItem(orderItem);
                
                // Update product stock
                ProductModel product = productDao.getProductById(cartItem.getProductId());
                product.setStock(product.getStock() - cartItem.getQuantity());
                productDao.updateProduct(product);
            }
            
            // Clear the cart
            cartItemDao.deleteAllCartItems(cart.getCartId());
            cart.setCartQty(0);
            cartDao.updateCart(cart);
            
            // Set success message and redirect back to cart
            session.setAttribute("successMessage", "Order #" + orderId + " placed successfully!");
            response.sendRedirect("HomeServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error processing your order: " + e.getMessage());
            response.sendRedirect("addcart.jsp");
        }
    }
}