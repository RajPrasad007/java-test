package org.apache.struts.loginstruts;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.*;
import java.util.UUID;

public class ProcessRegistration {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    // Method to hash password using SHA-1
    public static String sha1Hash(String password) {
        String sha1 = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes(StandardCharsets.UTF_8));
            sha1 = String.format("%040x", new java.math.BigInteger(1, digest.digest()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sha1;
    }
    public static String registerUser(String name, String password, String mobile, String email) {
        String message = "";
        Connection c1 = null;
        PreparedStatement st = null;
        ResultSet rs1;
        String q="";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c1=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

            // Check if the username already exists
            q = "SELECT * FROM users WHERE name = ?";
            st = c1.prepareStatement(q);
            st.setString(1, name);
            rs1 = st.executeQuery();

            if (rs1.next()) {
                message = "Username already exists";
            } else {
                // Hash the password
                String hashedPass = sha1Hash(password);
                String id = UUID.randomUUID().toString();
                // Insert the user if the username doesn't exist
                q = "INSERT INTO users(id,name, password, mobile, email) VALUES(?,?, ?, ?, ?)";
                st = c1.prepareStatement(q);
                st.setString(1, id);
                st.setString(2, name);
                st.setString(3, hashedPass);
                st.setString(4, mobile);
                st.setString(5, email);
                int rowsAffected = st.executeUpdate();

                if (rowsAffected > 0) {
                    message = "User added successfully";
                } else {
                    message = "Failed to add user";
                }
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            message = "Error occurred. Please try again.";
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
                if (c1 != null) {
                    c1.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return message;
    }
}
