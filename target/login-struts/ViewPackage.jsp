<%@ page import="org.apache.struts.loginstruts.ProcessTourPackage" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <a class="nav-link active" href="ViewPackage.jsp">View Packages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewBooking.jsp">View Bookings</a>
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
                        List<Map<String, String>> packageDetails = ProcessTourPackage.getPackageDetails();
                        if (packageDetails.isEmpty()) {
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
                            for (Map<String, String> packageDetail : packageDetails) {
                %>
                    <div class="col-lg-6">
                        <div class="card">
                            <img src="image/holiday.jpg" class="card-img-top" alt="<%= packageDetail.get("place_name") %>" height=150 width=10>
                            <div class="card-body">
                                <h3 class="card-title">
                                    <a href="#" class="toggle-info" data-target="info<%= packageDetail.get("id") %>">
                                        <%= packageDetail.get("place_name") %>
                                    </a>
                                </h3>
                                <div id="info<%= packageDetail.get("id") %>" class="additional-info" style="display: none;">
                                    <p>No of Adults: <%= packageDetail.get("no_of_adults") %></p>
                                    <p>No of Children: <%= packageDetail.get("no_of_children") %></p>
                                    <p>Description: <%= packageDetail.get("description") %></p>
                                    <p>Stay Amount: <%= packageDetail.get("stay_amount") %></p>
                                    <p>Other Amount: <%= packageDetail.get("other_amount") %></p>
                                    <p>No of Days: <%= packageDetail.get("no_of_days") %></p>
                                    <p>No of Nights: <%= packageDetail.get("no_of_nights") %></p>
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
</div> <!-- Close the container div here -->

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