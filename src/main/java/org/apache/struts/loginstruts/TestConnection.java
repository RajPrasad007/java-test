package org.apache.struts.loginstruts;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false", "root", "7777");

            // Check if connection is successful
            if (connection != null) {
                System.out.println("Database connection successful!");

                // Check if the user1 table exists
                DatabaseMetaData metaData = connection.getMetaData();
                String[] types = {"TABLE"};
                String tableNamePattern = "user1";
                if (metaData.getTables(null, null, tableNamePattern, types).next()) {
                    System.out.println("Table 'user1' exists in the database.");
                } else {
                    System.out.println("Table 'user1' does not exist in the database.");
                }
            } else {
                System.out.println("Failed to make database connection!");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("MySQL JDBC driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to connect to database!");
        } finally {
            // Close the connection
            try {
                if (connection != null && !connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Failed to close database connection!");
            }
        }
    }
}
