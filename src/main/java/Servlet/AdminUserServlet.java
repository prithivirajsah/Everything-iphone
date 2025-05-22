package Servlet;

import Dao.UserModelDAO;
import model.UserModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserModelDAO userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdParam = request.getParameter("userId");
            if (userIdParam != null && !userIdParam.isEmpty()) {
                int userId = Integer.parseInt(userIdParam);
                UserModel user = userDao.getUserById(userId);
                request.setAttribute("user", user);
            }
            
            List<UserModel> users = userDao.getAllUsers();
            request.setAttribute("users", users);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading users: " + e.getMessage());
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pages/UsersManagement.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String errorMessage = null;
        String successMessage = null;

        try {
            if ("add".equals(action)) {
                addUser(request);
                successMessage = "User added successfully!";
            } else if ("update".equals(action)) {
                updateUser(request);
                successMessage = "User updated successfully!";
            } else if ("delete".equals(action)) {
                deleteUser(request);
                successMessage = "User deleted successfully!";
            } else if ("updatePassword".equals(action)) {
                updateUserPassword(request);
                successMessage = "Password updated successfully!";
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
        
        response.sendRedirect(request.getContextPath() + "/AdminUserServlet");
    }
    private void addUser(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        UserModel user = extractUserFromRequest(request);
        userDao.addUser(user);
    }

    private void updateUser(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        UserModel user = extractUserFromRequest(request);
        userDao.updateUser(user);
    }

    private void deleteUser(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userDao.deleteUser(userId);
    }

    private void updateUserPassword(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String newPassword = request.getParameter("newPassword");
        userDao.updateUserPassword(userId, newPassword);
    }

    private UserModel extractUserFromRequest(HttpServletRequest request) {
        UserModel user = new UserModel();
        
 
        if (request.getParameter("userId") != null && !request.getParameter("userId").isEmpty()) {
            user.setUserId(Integer.parseInt(request.getParameter("userId")));
        }
        
        user.setUserName(request.getParameter("userName"));
        user.setFullName(request.getParameter("fullName"));
        user.setEmail(request.getParameter("email"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.setGender(request.getParameter("gender"));
        user.setCity(request.getParameter("city"));
        user.setState(request.getParameter("state"));
        user.setRole(request.getParameter("role"));
        

        if (user.getUserId() == 0) {
            user.setPassword("defaultPassword123");
        }
        
        return user;
    }
}