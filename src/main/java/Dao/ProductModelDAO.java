package Dao;

import model.ProductModel;


import View.DBConnection;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class ProductModelDAO {

    public void addProduct(ProductModel product) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Product(productId, productDesc, productName, productPrice, category, imageUrl, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, product.getProductId());
            stmt.setString(2, product.getProductDesc());
            stmt.setString(3, product.getProductName());
            stmt.setDouble(4, product.getProductPrice());
            stmt.setString(5, product.getCategory());
            stmt.setString(6, product.getImageUrl());
            stmt.setInt(7, product.getStock());
            stmt.executeUpdate();
        }
    }

    
    public ProductModel getProductById(int productId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Product WHERE productId=?";
        try (Connection conn = DBConnection.getDbConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductId(rs.getInt("productId"));
                product.setProductDesc(rs.getString("productDesc"));
                product.setProductName(rs.getString("productName"));
                product.setProductPrice(rs.getDouble("productPrice"));
                product.setCategory(rs.getString("category"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setStock(rs.getInt("stock"));
                return product;
            }
        }
        return null;
    }
    public void updateProduct(ProductModel product) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Product SET productDesc=?, productName=?, productPrice=?, category=?, imageUrl=?, stock=? WHERE productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getProductDesc());
            stmt.setString(2, product.getProductName());
            stmt.setDouble(3, product.getProductPrice());
            stmt.setString(4, product.getCategory());
            stmt.setString(5, product.getImageUrl());
            stmt.setInt(6, product.getStock());
            stmt.setInt(7, product.getProductId());
            stmt.executeUpdate();
        }
    }
    
    public List<ProductModel> getAllProducts() throws SQLException, ClassNotFoundException {
        ArrayList<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try (Connection conn = DBConnection.getDbConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductId(rs.getInt("productId"));
                product.setProductDesc(rs.getString("productDesc"));
                product.setProductName(rs.getString("productName"));
                product.setProductPrice(rs.getDouble("productPrice"));
                product.setCategory(rs.getString("category"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setStock(rs.getInt("stock"));
                products.add(product);
            }
        }
        return products;
    }
    public void deleteProduct(int productId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Product WHERE productId=?";
        try (Connection conn = DBConnection.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            stmt.executeUpdate();
        }
    }
}