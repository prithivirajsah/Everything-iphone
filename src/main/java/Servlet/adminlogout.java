package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import util.CookieUtil;
import util.SessionUtil;

/**
 * Servlet implementation class adminlogout
 */
@WebServlet("/logout")
public class adminlogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminlogout() {
        super();
        // TODO Auto-generated constructor stub
    }

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SessionUtil.invalidateSession(request);
        
        CookieUtil.deleteCookie(response, "username");
        CookieUtil.deleteRoleCookie(response);
        
        response.sendRedirect(request.getContextPath() + "/login?logout=true");
}

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}