package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Dao.UserModelDAO;
import model.UserModel;
import util.CookieUtil;
import util.SessionUtil;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
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
        // Check if a user is already logged in via session
        Object sessionUser = SessionUtil.getAttribute(request, "loggedInUser");
        if (sessionUser != null) {
            // Redirect to home if already logged in
            request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
            return;
        }

        // Forward to login page
        request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Attempt to retrieve user from DB
            UserModel user = userDao.getUserByUsernameAndPassword(username, password);

            if (user != null) {
                // Set user in session
                SessionUtil.setAttribute(request, "loggedInUser", user);

                // Create cookie for user (e.g., storing username for quick access)
                CookieUtil.addCookie(response, "username", user.getUserName(), 60 * 60 * 24 * 7); // 7 days

                // Forward to Home.jsp
                request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
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
}