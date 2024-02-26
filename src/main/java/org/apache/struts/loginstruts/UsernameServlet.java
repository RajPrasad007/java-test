package org.apache.struts.loginstruts;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class UsernameServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = getUsername(); // Fetch the username using UserDAO
            String template = "Hello, " + username;
            // Check if the request is coming from localhost
            String remoteHost = request.getRemoteHost();
            System.out.println(remoteHost);
            if ("localhost".equals(remoteHost) || "127.0.0.1".equals(remoteHost)) {
                // Allow access only if the request is coming from localhost
                response.setHeader("Access-Control-Allow-Origin", "*"); // Allow requests from any origin
                response.setHeader("Access-Control-Allow-Methods", "GET");
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println(template);
            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            }

        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception as needed
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving username");
        }
    }
    public static String getUsername() throws Exception {
        Connection c1 = null;
        Statement st = null;
        String q = "";
        ResultSet rs1 = null;
        String username = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        c1 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        q = "SELECT name FROM admin_users LIMIT 1";
        st = c1.createStatement();

        rs1 = st.executeQuery(q);
        if (rs1.next()) {
            username = (String) rs1.getObject("name");
            System.out.println(username);
        }

        return username;
    }
    public static String getUserRole(String username) throws Exception {
        String role = null;
        Connection c1 = null;

        PreparedStatement statement = null;
        ResultSet resultSet = null;



        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c1 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);


            // Prepare SQL query to retrieve user role
            String query = "SELECT role FROM users WHERE name = ?";
            statement = c1.prepareStatement(query);
            statement.setString(1, username);

            // Execute query
            resultSet = statement.executeQuery();

            // If a result is found, retrieve the user role
            if (resultSet.next()) {
                role = resultSet.getString("role");
            } else {
                String query_1 = "SELECT role FROM admin_users WHERE name = ?";
                statement = c1.prepareStatement(query_1);
                statement.setString(1, username);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    role = resultSet.getString("role");
                }

            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            // Close JDBC objects in reverse order of their creation
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (c1 != null) {
                try {
                    c1.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return role;
    }
}
