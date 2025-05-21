package Servlet;

import Dao.ProductModelDAO;
import model.ProductModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductModelDAO productDAO = new ProductModelDAO();
        
        // Get search and filter parameters
        String searchTerm = request.getParameter("search");
        String storageFilter = request.getParameter("storage");
        
        try {
            List<ProductModel> productList;
            
            if ((searchTerm != null && !searchTerm.isEmpty()) || (storageFilter != null && !storageFilter.equals("all"))) {
                // Apply filters if parameters exist
                productList = productDAO.getFilteredProducts(searchTerm, storageFilter);
            } else {
                // Get all products if no filters
                productList = productDAO.getAllProducts();
            }
            
            request.setAttribute("products", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/Product.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading products.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}