package org.apache.struts.loginstruts;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout {
    public static void logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Invalidate the session
            HttpSession session = request.getSession(false);
            if (session != null) {
                // Delete cookies associated with the session
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("JSESSIONID")) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            System.out.println("Cookie " + cookie.getName() + " deleted.");
                            break;
                        }
                    }
                }
                session.invalidate();
                System.out.println("Session invalidated successfully.");
            }

            // Redirect to the login page or any other appropriate page after logout
            response.sendRedirect("Home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

