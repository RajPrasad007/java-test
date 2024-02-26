<%@page import="org.apache.struts.loginstruts.ProcessTourPackage" %>



<%@ page import="java.sql.SQLException" %>
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
                    <a class="nav-link active" href="AddTourPackage.jsp">Add Tour Package</a>
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
               <div class="col-lg-4" >
                   <br>
                   <br>
                   <h4 class="text-primary">Add Tour Package</h4><br />
                <form method="POST">
                    <div class="form-group">
                        <label for="inputName">Place Name</label>
                        <input class="form-control" type="text" name="place_name" placeholder="Enter Username" required />
                    </div>

                    <div class="form-group">
                        <label for="inputPass">No. Of Adults</label>
                        <input class="form-control" type="text" name="no_of_adults" placeholder="Enter No. Of Adults" required />
                    </div>                    

                    <div class="form-group">
                        <label for="inputMobile">No. Of Childs</label>
                        <input class="form-control" type="text" name="no_of_children" placeholder="Enter No. Of Childs" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">Description</label>
                        <input class="form-control" type="text" name="description" placeholder="Enter Description" />
                    </div>
                    
                     <div class="form-group">
                        <label for="inputEmail">Stay Amount</label>
                        <input class="form-control" type="text" name="stay_amount" placeholder="Enter Stay Amount" required />
                    </div>
                   
                     <div class="form-group">
                        <label for="inputEmail">Other Amount</label>
                        <input class="form-control" type="text" name="other_amount" placeholder="Enter Username" />
                    </div>
                   
                     <div class="form-group">
                        <label for="inputEmail">No. Of Days</label>
                        <input class="form-control" type="text" name="no_of_days" placeholder="Enter No. Of Days" required />
                    </div>
                   
                     <div class="form-group">
                        <label for="inputEmail">No. Of Nights</label>
                        <input class="form-control" type="text" name="no_of_nights" placeholder="Enter No. Of Nights" required />
                    </div>
                   
                    <button type="submit" class="btn btn-primary">Add Tour</button>
                    <br>                    
                </form> 
                    <%
                                    if (request.getMethod().equals("POST")) {
                                        String place_name = request.getParameter("place_name");
                                        String no_of_adults = request.getParameter("no_of_adults");
                                        String no_of_children = request.getParameter("no_of_children");
                                        String description = request.getParameter("description");
                                        String stay_amount = request.getParameter("stay_amount");
                                        String other_amount = request.getParameter("other_amount");
                                        String no_of_days = request.getParameter("no_of_days");
                                        String no_of_nights = request.getParameter("no_of_nights");

                                        try {
                                            ProcessTourPackage.addTourPackage(place_name, no_of_adults, no_of_children, description, stay_amount, other_amount, no_of_days, no_of_nights);
                                            out.println("<div class='text-success'>Tour Package added successfully!</div>");
                                        } catch (Exception e) {
                                            out.println("<div class='text-danger'>Error: " + e.getMessage() + "</div>");
                                        }
                                    }
                                    %>
               </div>
           </div> 
            

       </div>
    </body>
</html>
