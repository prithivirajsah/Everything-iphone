package util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;

public class CookieUtil {

    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        try {
            String encodedValue = URLEncoder.encode(value, "UTF-8");
            Cookie cookie = new Cookie(name, encodedValue);
            cookie.setMaxAge(maxAge);
            cookie.setPath("/");
            cookie.setHttpOnly(true); // For security
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public static void addRoleCookie(HttpServletResponse response, String role, int maxAge) {
        addCookie(response, "userRole", role, maxAge);
    }

    public static Cookie getCookie(HttpServletRequest request, String name) {
        if (request.getCookies() != null) {
            return Arrays.stream(request.getCookies())
                    .filter(cookie -> name.equals(cookie.getName()))
                    .findFirst()
                    .orElse(null);
        }
        return null;
    }
    
    public static void removeCookie(HttpServletResponse response, String name) {
        deleteCookie(response, name);
    }

    public static String getRoleFromCookie(HttpServletRequest request) {
        Cookie roleCookie = getCookie(request, "userRole");
        if (roleCookie != null) {
            return getDecodedValue(roleCookie);
        }
        return null;
    }

    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public static void deleteRoleCookie(HttpServletResponse response) {
        deleteCookie(response, "userRole");
    }

    public static String getDecodedValue(Cookie cookie) {
        try {
            return cookie != null ? URLDecoder.decode(cookie.getValue(), "UTF-8") : null;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
}