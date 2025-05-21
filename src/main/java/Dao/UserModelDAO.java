package Dao;

import model.UserModel;
import util.PasswordUtil;
import View.DBConnection;

import java.sql.*;
import java.util.*;


public class UserModelDAO {

    public void addUser(UserModel user) throws SQLException, ClassNotFoundException {
        // Generate salt and hash password before storing
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(user.getPassword(), salt);
        
        String sql = "INSERT INTO User(userName, fullName, email, phoneNumber, gender, city, state, password, role, salt) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getFullName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getCity());
            stmt.setString(7, user.getState());
            stmt.setString(8, hashedPassword);
            stmt.setString(9, user.getRole() != null ? user.getRole() : "user");
            stmt.setString(10, salt);
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setUserId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        }
    }
    
    
    public void addAdminUser(UserModel adminUser) throws SQLException, ClassNotFoundException {
        // Ensure the role is set to admin
        if (adminUser.getRole() == null || !adminUser.getRole().equals("admin")) {
            adminUser.setRole("admin");
        }
        
        // Generate salt and hash password before storing
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(adminUser.getPassword(), salt);
        
        String sql = "INSERT INTO User(userName, fullName, email, phoneNumber, gender, city, state, password, role, salt, isAdmin) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, adminUser.getUserName());
            stmt.setString(2, adminUser.getFullName());
            stmt.setString(3, adminUser.getEmail());
            stmt.setString(4, adminUser.getPhoneNumber());
            stmt.setString(5, adminUser.getGender());
            stmt.setString(6, adminUser.getCity());
            stmt.setString(7, adminUser.getState());
            stmt.setString(8, hashedPassword);
            stmt.setString(9, adminUser.getRole());
            stmt.setString(10, salt);
            stmt.setBoolean(11, true);
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating admin user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    adminUser.setUserId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating admin user failed, no ID obtained.");
                }
            }
        }
    }


    public UserModel getUserById(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM User WHERE userId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapUserFromResultSet(rs);
            }
        }
        return null;
    }

    public UserModel getUserByUsername(String username) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM User WHERE userName=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return mapUserFromResultSet(rs);
            }
        }
        return null;
    }

    public UserModel getUserByUsernameAndPassword(String username, String password) 
            throws SQLException, ClassNotFoundException {
        // First get the user by username to retrieve salt and stored hash
        UserModel user = getUserByUsername(username);
        
        if (user != null) {
            // Verify the password
            boolean isValid = PasswordUtil.verifyPassword(
                password, 
                user.getPassword(), 
                user.getSalt()
            );
            
            if (isValid) {
                return user;
            }
        }
        return null;
    }
    
    public List<UserModel> getAllUsers() throws SQLException, ClassNotFoundException {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT * FROM User";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                users.add(mapUserFromResultSet(rs));
            }
        }
        return users;
    }
    public void updateUser(UserModel user) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE User SET userName=?, fullName=?, email=?, phoneNumber=?, " +
                     "gender=?, city=?, state=?, role=? WHERE userId=?";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getFullName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getCity());
            stmt.setString(7, user.getState());
            stmt.setString(8, user.getRole());
            stmt.setInt(9, user.getUserId());
            
            stmt.executeUpdate();
        }
    }
    
    public void updateUserPassword(int userId, String newPassword) throws SQLException, ClassNotFoundException {
        // Generate new salt and hash for the password
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(newPassword, salt);
        
        String sql = "UPDATE User SET password=?, salt=? WHERE userId=?";
        
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, hashedPassword);
            stmt.setString(2, salt);
            stmt.setInt(3, userId);
            
            stmt.executeUpdate();
        }
    }
    
    
    public int getTotalUsers() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) AS total FROM User";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        }
        return 0;
    }
    
    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM User WHERE userId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }
    
    // Helper method to map ResultSet to UserModel
    private UserModel mapUserFromResultSet(ResultSet rs) throws SQLException {
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
        user.setRole(rs.getString("role"));
        user.setSalt(rs.getString("salt"));
        return user;
    }
}