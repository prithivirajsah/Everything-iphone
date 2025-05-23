package util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {
    public static Object getAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(name) : null;
    }

    public static void setAttribute(HttpServletRequest request, String name, Object value) {
        request.getSession().setAttribute(name, value);
    }

    public static void removeAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(name);
        }
    }
    
    
    
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}