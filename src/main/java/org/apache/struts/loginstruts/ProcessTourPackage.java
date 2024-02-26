package org.apache.struts.loginstruts;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
public class ProcessTourPackage {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public static void addTourPackage(String place_name, String no_of_adults, String no_of_children, String description, String stay_amount, String other_amount, String no_of_days, String no_of_nights) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "";

        try {
            String id = UUID.randomUUID().toString();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            Packages packageDetails = new Packages(id, place_name, no_of_adults, no_of_children, description, stay_amount, other_amount, no_of_days, no_of_nights);
            oos.writeObject(packageDetails);
            byte[] serializedPackage = baos.toByteArray();

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            query = "INSERT INTO package_details(id, package_data) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.setBytes(2, serializedPackage);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    public static List<Map<String, String>> getPackageDetails() throws Exception {
        List<Map<String, String>> packageDetailsList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT id, package_data FROM package_details";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                byte[] serializedPackage = resultSet.getBytes("package_data");
                ByteArrayInputStream bais = new ByteArrayInputStream(serializedPackage);
                ObjectInputStream ois = new ObjectInputStream(bais);
                Packages packageDetails = (Packages) ois.readObject();

                Map<String, String> packageMap = new HashMap<>();
                packageMap.put("id", packageDetails.getId());
                packageMap.put("place_name", packageDetails.getPlaceName());
                packageMap.put("no_of_adults", packageDetails.getNoOfAdults());
                packageMap.put("no_of_children", packageDetails.getNoOfChildren());
                packageMap.put("description", packageDetails.getDescription());
                packageMap.put("stay_amount", packageDetails.getStayAmount());
                packageMap.put("other_amount", packageDetails.getOtherAmount());
                packageMap.put("no_of_days", packageDetails.getNoOfDays());
                packageMap.put("no_of_nights", packageDetails.getNoOfNights());

                packageDetailsList.add(packageMap);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return packageDetailsList;
    }
}
