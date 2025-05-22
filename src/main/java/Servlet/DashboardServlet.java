package Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DashboardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Dao.UserModelDAO userDao = new Dao.UserModelDAO();
            Dao.OrderModelDAO orderDao = new Dao.OrderModelDAO();

            int totalUsers = userDao.getAllUsers().size();
            int totalOrders = orderDao.getTotalOrders(); 
            int deliveredOrders = orderDao.getDeliveredOrders();
            double totalRevenue = orderDao.getTotalRevenue();
            Map<String, Integer> statusDistribution = orderDao.getOrderStatusDistribution();

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("deliveredOrders", deliveredOrders);
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("statusDistribution", statusDistribution);

            request.getRequestDispatcher("/WEB-INF/Pages/dashboard.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading dashboard data.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}