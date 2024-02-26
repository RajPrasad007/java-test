<%@page import="org.apache.struts.loginstruts.ProcessSettings" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
              <div class="sidebarContent"><img src="image/trs.jpg" class="img-fluid" ></div>
           </div>
       </div>
       <div class="row">
           <div class="col-lg-121">
              <ul class="nav nav-tabs ">
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
               <div class="col-lg-4">

           </div>
               <div class="col-lg-4">
                   <br>
                   <br>
                   <h3 class="text-primary">Settings</h3><br />
                <form method="POST">


                                               <div class="form-group">
                                                   <label for="name">Username</label>
                                                   <input type="text" id="name" name="name" />
                                               </div>



                                               <button type="submit" class="btn btn-primary">Update</button>
                                           </form>
                 <%
                 if (request.getMethod().equals("POST")) {

                     String name = request.getParameter("name");


                     String message = ProcessSettings.update(name);
                     %>
                                              <div style="color: <%= message.startsWith("Error") ? "red" : "green" %>;"><%= message %></div>
                                      <%
                 }
                 %>

           </div>
           </div>

       </div>
    </body>
</html>
