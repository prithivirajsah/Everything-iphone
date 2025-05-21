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
import util.CookieUtil;
import util.SessionUtil;
@WebServlet({"/","/login"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserModelDAO userDao;

    public LoginServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        userDao = new UserModelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is already logged in
        UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
        if (loggedInUser != null) {
            redirectBasedOnRole(response, loggedInUser.getRole());
            return;
        }

        // Forward to login page
        request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserModel user = userDao.getUserByUsernameAndPassword(username, password);

            if (user != null) {
                // Set session attributes
                SessionUtil.setAttribute(request, "loggedInUser", user);
                
                // Set cookies
                CookieUtil.addCookie(response, "username", user.getUserName(), 60 * 60 * 24 * 7); // 7 days
                CookieUtil.addRoleCookie(response, user.getRole(), 60 * 60 * 24 * 7); // 7 days
                
                // Role-based redirection
                redirectBasedOnRole(response, user.getRole());
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Login failed due to system error.");
            request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
        }
    }
    
    private void redirectBasedOnRole(HttpServletResponse response, String role) throws IOException {
        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect("AdminProductServlet"); // This is the admin redirect
        } else {
            response.sendRedirect("HomeServlet"); 
        }
    }
}