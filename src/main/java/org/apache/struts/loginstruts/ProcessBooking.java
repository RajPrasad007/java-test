package org.apache.struts.loginstruts;
import java.sql.*;
import java.util.*;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class ProcessBooking {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tour?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Xander@123";
    public static void addBooking(String name, String mobile, String place_name, String description, String amount, String days, String nights) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "";

        try {
            String id = UUID.randomUUID().toString();
            name = decodeIfBase64(name);
            mobile = decodeIfBase64(mobile);
            place_name = decodeIfBase64(place_name);
            description = decodeIfBase64(description);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            Booking bookingDetails = new Booking(id, name, mobile, place_name, description, amount, days, nights);
            oos.writeObject(bookingDetails);
            byte[] serializedBooking = baos.toByteArray();

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            query = "INSERT INTO booking(id, booking_data) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.setObject(2, serializedBooking);
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

    private static String decodeIfBase64(String str) {
        try {
            byte[] decodedBytes = Base64.getDecoder().decode(str);
            ByteArrayInputStream bais = new ByteArrayInputStream(decodedBytes);
            ObjectInputStream ois = new ObjectInputStream(bais);
            String decodedStr = (String) ois.readObject();
            ois.close();
            return decodedStr;
        } catch (Exception e) {
            // If decoding fails or it's not a valid serialized object, return the original string
            return str;
        }
    }
    public static List<Map<String, String>> getBookingDetails() throws Exception {
        List<Map<String, String>> bookingDetailsList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT id, booking_data FROM booking";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                byte[] serializedPackage = resultSet.getBytes("booking_data");
                ByteArrayInputStream bais = new ByteArrayInputStream(serializedPackage);
                ObjectInputStream ois = new ObjectInputStream(bais);
                Booking bookingdetails = (Booking) ois.readObject();

                Map<String, String> packageMap = new HashMap<>();
                packageMap.put("id", bookingdetails.getId());
                packageMap.put("name", bookingdetails.getName());
                packageMap.put("mobile", bookingdetails.getMobile());
                packageMap.put("place_name", bookingdetails.getPlaceName());
                packageMap.put("description", bookingdetails.getDescription());
                packageMap.put("amount", bookingdetails.getAmount());
                packageMap.put("no_of_days", bookingdetails.getNoOfDays());
                packageMap.put("no_of_nights", bookingdetails.getNoOfNights());

                bookingDetailsList.add(packageMap);
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
        return bookingDetailsList;
    }
}

class Booking implements Serializable {
    private String id;
    private String name;
    private String mobile;
    private String placeName;
    private String description;
    private String amount;
    private String noOfDays;
    private String noOfNights;

    public Booking(String id, String name, String mobile, String placeName, String description, String amount, String noOfDays, String noOfNights) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.placeName = placeName;

        this.description = description;
        this.amount = amount;

        this.noOfDays = noOfDays;
        this.noOfNights = noOfNights;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }

    public String getPlaceName() {
        return placeName;
    }


    public String getDescription() {
        return description;
    }

    public String getAmount() {
        return amount;
    }


    public String getNoOfDays() {
        return noOfDays;
    }

    public String getNoOfNights() {
        return noOfNights;
    }
}
