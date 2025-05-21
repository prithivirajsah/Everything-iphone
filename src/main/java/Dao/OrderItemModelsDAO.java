package Dao;

import model.OrderItemModels;

import View.DBConnection;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;


public class OrderItemModelsDAO {

	public void addOrderItem(OrderItemModels item) throws SQLException, ClassNotFoundException {
	    String sql = "INSERT INTO OrderDetails(orderId, productId, quantity, price) VALUES (?, ?, ?, ?)";
	    try (Connection conn = DBConnection.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, item.getOrderId());
	        stmt.setInt(2, item.getProductId());
	        stmt.setInt(3, item.getQuantity());
	        stmt.setDouble(4, item.getPrice());
	        stmt.executeUpdate();
	    }
	}
    public List<OrderItemModels> getOrderItemsByOrderId(int orderId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM OrderDetails WHERE orderId=?";
        List<OrderItemModels> items = new ArrayList<>();
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                OrderItemModels item = new OrderItemModels();
                item.setOrderId(rs.getInt("orderId"));
                item.setProductId(rs.getInt("productId"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                items.add(item);
            }
        }
        return items;
    }

    public void deleteOrderItem(int orderId, int productId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM OrderDetails WHERE orderId=? AND productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        }
    }
}