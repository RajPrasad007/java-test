package org.apache.struts.loginstruts;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TestServlet extends HttpServlet {

        private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
        private static final String DB_USER = "root";
        private static final String DB_PASSWORD = "Xander@123";
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                String name = request.getParameter("name"); // Fetch the username using UserDAO
                String template = "<html><body>Hello, " + name + "</body></html>";
                // Check if the request is coming from localhost
                String remoteHost = request.getRemoteHost();
                System.out.println(remoteHost);

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println(template);


            } catch (Exception e) {
                e.printStackTrace(); // Handle or log the exception as needed
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving username");
            }

}}
