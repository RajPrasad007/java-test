package org.apache.struts.loginstruts;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDetails {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public static List<Map<String, String>> getUserDetails() throws Exception {
        Connection c1 = null;
        Statement st = null;
        ResultSet rs1 = null;
        List<Map<String, String>> resultList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c1 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            st = c1.createStatement();
            String q = "SELECT * FROM users";
            rs1 = st.executeQuery(q);
            while (rs1.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs1.getString("id"));
                row.put("name", rs1.getString("name"));
                row.put("mobile", rs1.getString("mobile"));
                row.put("email", rs1.getString("email"));
                resultList.add(row);
            }
        } finally {
            // Close resources in a finally block to ensure they are always closed
            if (rs1 != null) {
                rs1.close();
            }
            if (st != null) {
                st.close();
            }
            if (c1 != null) {
                c1.close();
            }
        }
        return resultList;
    }
}
