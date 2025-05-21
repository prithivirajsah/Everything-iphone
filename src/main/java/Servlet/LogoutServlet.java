package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import util.CookieUtil;
import util.SessionUtil;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the session and remove all session attributes
        SessionUtil.invalidateSession(request);
        
        // Remove cookies - using the correct method names
        CookieUtil.deleteCookie(response, "username");
        CookieUtil.deleteRoleCookie(response);
        
        // Redirect to login page with a logout message
        response.sendRedirect(request.getContextPath() + "/login?logout=true");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}