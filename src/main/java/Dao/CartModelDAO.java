package Dao;

import model.CartModel;
import View.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartModelDAO {
    public void addCart(CartModel cart) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Cart(cartId, userId, cartQty) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cart.getCartId());
            stmt.setInt(2, cart.getUserId());
            stmt.setInt(3, cart.getCartQty());
            stmt.executeUpdate();
        }
    }

    public CartModel getCartById(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Cart WHERE cartId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                CartModel cart = new CartModel();
                cart.setCartId(rs.getInt("cartId"));
                cart.setUserId(rs.getInt("userId"));
                cart.setCartQty(rs.getInt("cartQty"));
                return cart;
            }
        }
        return null;
    }
    public CartModel getCartByUserId(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Cart WHERE userId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                CartModel cart = new CartModel();
                cart.setCartId(rs.getInt("cartId"));
                cart.setUserId(rs.getInt("userId"));
                cart.setCartQty(rs.getInt("cartQty"));
                return cart;
            }
        }
        return null;
    }

    public void deleteAllCartItems(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart_Items WHERE cartId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
        }
    }
    public void updateCart(CartModel cart) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Cart SET userId=?, cartQty=? WHERE cartId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cart.getUserId());
            stmt.setInt(2, cart.getCartQty());
            stmt.setInt(3, cart.getCartId());
            stmt.executeUpdate();
        }
    }

    public void deleteCart(int cartId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Cart WHERE cartId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
        }
    }
}