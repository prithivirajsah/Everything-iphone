package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import model.UserModel;
import util.CookieUtil;
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

        String userName = request.getParameter("userName");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        if (userName == null || userName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username, email and password are required");
            forwardWithUserData(request, response, userName, fullName, email, phoneNumber, gender, city, state);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            forwardWithUserData(request, response, userName, fullName, email, phoneNumber, gender, city, state);
            return;
        }


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
           
            userDao.addUser(user);
            CookieUtil.addRoleCookie(response, "user", 60 * 60 * 24 * 30); // 30 days
       
            request.getSession().setAttribute("success", "Registration successful! Please login.");
            response.sendRedirect(request.getContextPath() + "/login");
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            

            if (e instanceof SQLException && ((SQLException)e).getErrorCode() == 1062) {
                request.setAttribute("error", "Username or email already exists!");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
            }
            
          
            forwardWithUserData(request, response, userName, fullName, email, phoneNumber, gender, city, state);
        }
    }

    private void forwardWithUserData(HttpServletRequest request, HttpServletResponse response,
                                   String userName, String fullName, String email,
                                   String phoneNumber, String gender, String city,
                                   String state) throws ServletException, IOException {
        request.setAttribute("userName", userName);
        request.setAttribute("fullName", fullName);
        request.setAttribute("email", email);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("gender", gender);
        request.setAttribute("city", city);
        request.setAttribute("state", state);
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }
}