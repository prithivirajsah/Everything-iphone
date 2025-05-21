package Dao;

import model.OrderModel;

import View.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class OrderModelDAO {

	public int addOrder(OrderModel order) throws SQLException, ClassNotFoundException {
	    String sql = "INSERT INTO `Order`(userId, orderDate, total_quantity, total_amount, orderStatus) VALUES (?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnection.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	        stmt.setInt(1, order.getUserId());
	        stmt.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));
	        stmt.setInt(3, order.getTotalQuantity());
	        stmt.setDouble(4, order.getTotalAmount());
	        stmt.setString(5, order.getOrderStatus());
	        
	        stmt.executeUpdate();
	        
	        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1);
	            }
	        }
	        throw new SQLException("Creating order failed, no ID obtained.");
	    }
	}
    public OrderModel getOrderById(int orderId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM `Order` WHERE orderId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalQuantity(rs.getInt("total_quantity"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("orderStatus"));
                return order;
            }
        }
        return null;
    }
    public int getTotalOrders() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) AS total FROM `Order`";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        }
        return 0;
    }

    public int getDeliveredOrders() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) AS total FROM `Order` WHERE orderStatus = 'Delivered'";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        }
        return 0;
    }

    public double getTotalRevenue() throws SQLException, ClassNotFoundException {
        String sql = "SELECT SUM(total_amount) AS total FROM `Order` WHERE orderStatus = 'Delivered'";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("total");
            }
        }
        return 0;
    }

    public Map<String, Integer> getOrderStatusDistribution() throws SQLException, ClassNotFoundException {
        Map<String, Integer> statusMap = new HashMap<>();
        String sql = "SELECT orderStatus, COUNT(*) AS count FROM `Order` GROUP BY orderStatus";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                statusMap.put(rs.getString("orderStatus"), rs.getInt("count"));
            }
        }
        return statusMap;
    }
  
    
    
    
    
    
    
    public List<OrderModel> getOrdersByUserId(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM `Order` WHERE userId=? ORDER BY orderDate DESC";
        List<OrderModel> orders = new ArrayList<>();
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalQuantity(rs.getInt("total_quantity"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("orderStatus"));
                orders.add(order);
            }
        }
        return orders;
    }

    // Add this method if you need to get the last inserted ID (MySQL specific)
    public int getLastInsertedId(Connection conn) throws SQLException {
        try (Statement stmt = conn.createStatement(); 
             ResultSet rs = stmt.executeQuery("SELECT LAST_INSERT_ID()")) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }

    
    public List<OrderModel> getAllOrders() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM `Order` ORDER BY orderDate DESC";
        List<OrderModel> orders = new ArrayList<>();
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalQuantity(rs.getInt("total_quantity"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("orderStatus"));
                orders.add(order);
            }
        }
        return orders;
    }
    
    
    

    public void updateOrderStatus(int orderId, String status) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE `Order` SET orderStatus=? WHERE orderId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        }
    }

    public void deleteOrder(int orderId) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBConnection.getDbConnection()) {
            conn.setAutoCommit(false); // Begin transaction

            // Step 1: Delete related order items first
            try (PreparedStatement stmt1 = conn.prepareStatement("DELETE FROM OrderDetails WHERE orderId=?")) {
                stmt1.setInt(1, orderId);
                stmt1.executeUpdate();
            }

            // Step 2: Then delete the order itself
            try (PreparedStatement stmt2 = conn.prepareStatement("DELETE FROM `Order` WHERE orderId=?")) {
                stmt2.setInt(1, orderId);
                stmt2.executeUpdate();
            }

            conn.commit(); // Commit transaction
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}