package Servlet;

import Dao.ProductModelDAO;
import model.ProductModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductModelDAO productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productIdParam = request.getParameter("productId");
            if (productIdParam != null && !productIdParam.isEmpty()) {
                int productId = Integer.parseInt(productIdParam);
                ProductModel product = productDao.getProductById(productId);
                request.setAttribute("product", product);
            }
            
            List<ProductModel> products = productDao.getAllProducts();
            request.setAttribute("products", products);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading products: " + e.getMessage());
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/ProductsManagement.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String errorMessage = null;
        String successMessage = null;

        try {
            if ("add".equals(action)) {
                addProduct(request);
                successMessage = "Product added successfully!";
            } else if ("update".equals(action)) {
                updateProduct(request);
                successMessage = "Product updated successfully!";
            } else if ("delete".equals(action)) {
                deleteProduct(request);
                successMessage = "Product deleted successfully!";
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid number format: " + e.getMessage();
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        } catch (ClassNotFoundException e) {
            errorMessage = "Database driver error: " + e.getMessage();
        } catch (Exception e) {
            errorMessage = "Unexpected error: " + e.getMessage();
        }

        if (errorMessage != null) {
            request.getSession().setAttribute("errorMessage", errorMessage);
        }
        if (successMessage != null) {
            request.getSession().setAttribute("successMessage", successMessage);
        }
        
        response.sendRedirect(request.getContextPath() + "/AdminProductServlet");
    }

    private void addProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        ProductModel product = extractProductFromRequest(request);
        productDao.addProduct(product);
    }

    private void updateProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        ProductModel product = extractProductFromRequest(request);
        productDao.updateProduct(product);
    }

    private void deleteProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        productDao.deleteProduct(productId);
    }

    private ProductModel extractProductFromRequest(HttpServletRequest request) {
        ProductModel product = new ProductModel();
        

        if (request.getParameter("productId") != null && !request.getParameter("productId").isEmpty()) {
            product.setProductId(Integer.parseInt(request.getParameter("productId")));
        }
        
        product.setProductName(request.getParameter("productName"));
        product.setProductPrice(Double.parseDouble(request.getParameter("productPrice")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setProductDesc(request.getParameter("productDesc"));
        product.setCategory(request.getParameter("category"));
        product.setImageUrl(request.getParameter("imageUrl"));
        
        return product;
    }
}