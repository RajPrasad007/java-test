package org.apache.struts.loginstruts;
import javax.servlet.http.HttpSession;
import java.sql.*;

import static org.apache.struts.loginstruts.ProcessRegistration.sha1Hash;

public class ProcessLogin {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public static boolean validateUser(String username, String password, HttpSession session) {
        Connection c1 = null;
        PreparedStatement st = null;
        ResultSet rs1;
        String q = "";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c1 = DriverManager.getConnection(DB_URL, DB_URL, DB_PASSWORD);

            // Fetch the stored password hash from the database
            q = "SELECT password FROM users WHERE name = ?";
            st = c1.prepareStatement(q);
            st.setString(1, username);
            rs1 = st.executeQuery();

            if (rs1.next()) {
                String storedHash = rs1.getString("password");
                System.out.println(storedHash);
                // Hash the entered password to compare with the stored hash
                String enteredHash = sha1Hash(password);
                if (storedHash.equals(enteredHash)) {
                    // If login successful, create session and add attributes

                    session.setAttribute("username", username);
                    session.setAttribute("role", "user");
                    return true;
                } else {
                    return false;
                }
            } else {
                // User not found
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
    }
}
