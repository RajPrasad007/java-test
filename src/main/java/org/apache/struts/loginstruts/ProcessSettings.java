package org.apache.struts.loginstruts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;




public class ProcessSettings {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public static String update(String name) {
        String message = "";
        Connection connection = null;
        //PreparedStatement statement = null;
        Statement st = null;
        ResultSet rs1 = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            //String hashed_password = ProcessRegistration.sha1Hash(password);
            String query = "UPDATE admin_users SET name= '" + name + "'";

            st = connection.createStatement();


            int rowsAffected = st.executeUpdate(query);

            if (rowsAffected > 0) {
                message = "Updated to " + name;
            } else {
                message = "Failed to update";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error occurred. Please try again.";
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return message;
    }
}
