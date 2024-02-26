<%@page import="org.apache.struts.loginstruts.ProcessBooking" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Tour Booking</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="cstyle.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $.ajax({
                            url: "http://localhost:8080/web/get-username", // URL of your servlet
                            method: "GET",
                            success: function(response) {

                                $("#username").text(response); // Update DOM element with username
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching username:", error); // Log error to console
                            }
                        });
                    });
                </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="sidebarContent"><img src="image/trs.jpg" class="img-fluid"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs">
                    <li>
                        <a class="nav-link disabled" href="#"><span id="username"></span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddTourPackage.jsp">Add Tour Package</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewPackage.jsp">View Packages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ViewBooking.jsp">View Bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewUser.jsp">View Users</a>
                    </li>
                    <li class="nav-item">
                                        <a class="nav-link" href="Settings.jsp">Settings</a>
                                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogOut.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>


            <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-50">
                            <%
                                try {
                                   List<Map<String, String>> bookingDetails = ProcessBooking.getBookingDetails();
                                   if (bookingDetails.isEmpty()) {
                            %>
                            <div class="text-center">
                                <br>
                                <p>No data found.</p>
                            </div>
                            <%
                                    } else {
                            %>
                            <br>
                            <div class="row">
                            <%
                                        for (Map<String, String> bookingDetail : bookingDetails) {
                            %>
                                <div class="col-lg-6">
                                    <div class="card">
                                        <img src="image/booking.jpg" class="card-img-top" alt="<%= bookingDetail.get("name") %>" height=150 width=10>
                                        <div class="card-body">
                                            <h3 class="card-title">
                                                <a href="#" class="toggle-info" data-target="info<%= bookingDetail.get("id") %>">
                                                    <%= bookingDetail.get("name") %>
                                                </a>
                                            </h3>
                                            <div id="info<%= bookingDetail.get("id") %>" class="additional-info" style="display: none;">
                                                <p>ID: <%= bookingDetail.get("id") %></p>
                                                <p>Place Name: <%= bookingDetail.get("place_name") %></p>
                                                <p>Mobile: <%= bookingDetail.get("mobile") %></p>
                                                <p>Description: <%= bookingDetail.get("description") %></p>
                                                <p>Total Amount: <%= bookingDetail.get("amount") %></p>

                                                <p>No of Days: <%= bookingDetail.get("no_of_days") %></p>
                                                <p>No of Nights: <%= bookingDetail.get("no_of_nights") %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <%
                                        } // End of for loop
                            %>
                            </div> <!-- Close the row div -->
                            <%
                                    } // End of else
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                        </div> <!-- Close the col-lg-50 div here -->
                    </div> <!-- Close the col-lg-12 div here -->
                </div> <!-- Close the row div here -->
                </div>
 <!-- Bootstrap JS -->

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 <script>
     $(document).ready(function() {
         $('.toggle-info').click(function(e) {
             e.preventDefault();
             var target = $(this).data('target');
             $('#' + target).toggle();
         });
     });
 </script>
 </body>
 </html>
