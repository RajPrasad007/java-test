package org.apache.struts.loginstruts;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

public class AdminAuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code goes here, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        System.out.println("Authentication Filter is running 1");

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
//        if (session != null) {
//            Enumeration<String> attributeNames = session.getAttributeNames();
//            if (!attributeNames.hasMoreElements()) {
//                System.out.println("No attributes in the session.");
//            }
//            while (attributeNames.hasMoreElements()) {
//                String attributeName = attributeNames.nextElement();
//                Object attributeValue = session.getAttribute(attributeName);
//                System.out.println("Attribute Name: " + attributeName + ", Value: " + attributeValue);
//            }
//        }else {
//            System.out.println("Session is null.");
//        }



        // Check if the user is logged in
        boolean isLoggedIn = (session != null &&  session.getAttribute("role") != null && session.getAttribute("username") != null);
        System.out.println(isLoggedIn);
        // Check if the user is an admin
        boolean isAdmin = false;
        if (isLoggedIn) {
            String username = (String) session.getAttribute("username");
            System.out.println(username);
            String userRole = null;
            try {
                userRole = UsernameServlet.getUserRole(username);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            System.out.println(userRole);
            isAdmin = session.getAttribute("role").equals(userRole);
            System.out.println(isAdmin);
        }

        // Determine the login URI
        String error401 = httpRequest.getContextPath() + "/error401.jsp";

        // Check if the user is allowed to access the requested resource
        boolean isAllowed = (isLoggedIn && isAdmin);
        System.out.println("Authentication Filter is running 2");
        System.out.println(isAllowed);
        if (isAllowed) {
            // User is authenticated and authorized, proceed with the request
            chain.doFilter(request, response);
        } else {
            // User is not authenticated or authorized, redirect to the login page
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            httpResponse.sendRedirect(error401);
        }

    }


    @Override
    public void destroy() {
        // Cleanup code goes here, if needed
    }

    // Other filter lifecycle methods (init, destroy) if needed
}