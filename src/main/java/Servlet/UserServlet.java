package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import model.UserModel;
import Dao.UserModelDAO;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserModelDAO userDao;

    public UserServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        userDao = new UserModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to registration page
        request.getRequestDispatcher("/WEB-INF/Pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null && action.equals("register")) {
            registerUser(request, response);
        } else {
            // Handle other actions if needed
            doGet(request, response);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get parameters from request
        String userName = request.getParameter("userName");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String password = request.getParameter("password");
        
        // Create UserModel object
        UserModel user = new UserModel();
        user.setUserName(userName);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setGender(gender);
        user.setCity(city);
        user.setState(state);
        user.setPassword(password);
        
        try {
            // Add user to database
            userDao.addUser(user);
            
            // Set success attribute and forward to registration page
            request.setAttribute("success", "Registration successful! Please login.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            
            // Check if it's a duplicate entry error (MySQL error code for duplicate entry is 1062)
            if (e instanceof SQLException && ((SQLException)e).getErrorCode() == 1062) {
                request.setAttribute("error", "Username or email already exists!");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
            }
            
            // Set user data back to form for correction
            request.setAttribute("userData", user);
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}