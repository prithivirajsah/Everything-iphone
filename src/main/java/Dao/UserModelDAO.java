package Dao;

import model.UserModel;
import View.DBConnection;

import java.sql.*;

public class UserModelDAO {

    public void addUser(UserModel user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO User(userId, userName, fullName, email, phoneNumber, gender, city, state, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, user.getUserId());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhoneNumber());
            stmt.setString(6, user.getGender());
            stmt.setString(7, user.getCity());
            stmt.setString(8, user.getState());
            stmt.setString(9, user.getPassword());
            stmt.executeUpdate();
        }
    }

    public UserModel getUserById(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM User WHERE userId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setFullName(rs.getString("fullName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        }
        return null;
    }

    public UserModel getUserByUsername(String username) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM User WHERE userName=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setFullName(rs.getString("fullName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        }
        return null;
    }

    public UserModel getUserByUsernameAndPassword(String username, String password)
            throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM User WHERE userName=? AND password=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setFullName(rs.getString("fullName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        }
        return null;
    }
    
    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM User WHERE userId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }
}