package Dao;

import model.CartItemModels;

import View.DBConnection;


import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class CartItemModelsDAO {

    public void addCartItem(CartItemModels item) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Cart_Items(cartId, productId, quantity, totalProductPrice) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, item.getCartId());
            stmt.setInt(2, item.getProductId());
            stmt.setInt(3, item.getQuantity());
            stmt.setDouble(4, item.getTotalProductPrice());
            stmt.executeUpdate();
        }
    }

    public void updateCartItem(CartItemModels item) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Cart_Items SET quantity=?, totalProductPrice=? WHERE cartId=? AND productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, item.getQuantity());
            stmt.setDouble(2, item.getTotalProductPrice());
            stmt.setInt(3, item.getCartId());
            stmt.setInt(4, item.getProductId());
            stmt.executeUpdate();
        }
    }

    public void deleteCartItem(int cartId, int productId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart_Items WHERE cartId=? AND productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        }
    }
    public List<CartItemModels> getCartItemsByCartId(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT ci.*, p.productName, p.productPrice FROM Cart_Items ci " +
                     "JOIN Product p ON ci.productId = p.productId WHERE ci.cartId=?";
        List<CartItemModels> items = new ArrayList<>();
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                CartItemModels item = new CartItemModels();
                item.setCartId(rs.getInt("cartId"));
                item.setProductId(rs.getInt("productId"));
                item.setQuantity(rs.getInt("quantity"));
                item.setTotalProductPrice(rs.getDouble("totalProductPrice"));
                // Set transient product info
                item.setProductName(rs.getString("productName"));
                item.setProductPrice(rs.getDouble("productPrice"));
                items.add(item);
            }
        }
        return items;
    }
    
    public void deleteAllCartItems(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart_Items WHERE cartId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
        }
    }
    
    

    public CartItemModels getCartItem(int cartId, int productId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Cart_Items WHERE cartId=? AND productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                CartItemModels item = new CartItemModels();
                item.setCartId(rs.getInt("cartId"));
                item.setProductId(rs.getInt("productId"));
                item.setQuantity(rs.getInt("quantity"));
                item.setTotalProductPrice(rs.getDouble("totalProductPrice"));
                return item;
            }
        }
        return null;
    }
}