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

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModelDAO productDAO = new ProductModelDAO();
		try {
			List<ProductModel> productList = productDAO.getAllProducts();
			request.setAttribute("products", productList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp");
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