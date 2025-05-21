package Servlet;

import Dao.OrderModelDAO;
import Dao.UserModelDAO;
import model.OrderModel;
import model.UserModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/OrderManagementServlet")
public class OrderManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderModelDAO orderDao;
    private UserModelDAO userDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderModelDAO();
        userDao = new UserModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<OrderModel> orders = orderDao.getAllOrders();
            request.setAttribute("orders", orders);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading orders");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/OrderManagement.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            switch (action) {
                case "update":
                    String status = request.getParameter("status");
                    orderDao.updateOrderStatus(orderId, status);
                    break;
                case "delete":
                    orderDao.deleteOrder(orderId);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("OrderManagementServlet");
    }
}