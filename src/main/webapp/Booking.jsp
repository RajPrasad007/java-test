<%@page import="org.apache.struts.loginstruts.ProcessBooking" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tour Booking</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="cstyle.css" rel="stylesheet"/>
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

                                  <a class="nav-link disabled" href="#">Welcome ${UserDAO.getUsername()}</a>
                                </li>


                <li class="nav-item">
                    <a class="nav-link" href="Booking.jsp">Booking</a>
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
                   <h3 class="text-primary">Add Booking</h3><br />
                <form method="POST">

                    <div class="form-group">
                        <label for="inputPass">Name</label>
                        <input class="form-control" type="text" name="name" placeholder="Enter Name" required />
                    </div>                    

                    <div class="form-group">
                        <label for="inputMobile">Mobile</label>
                        <input class="form-control" type="text" name="mobile" placeholder="Enter Mobile" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">Place Name</label>
                        <input class="form-control" type="text" name="place_name" placeholder="Enter Place Name" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">Description</label>
                        <input class="form-control" type="text" name="description" placeholder="Enter Description" />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">Total Amount</label>
                        <input class="form-control" type="text" name="amount" placeholder="Enter Total Amount" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">No. Of Days</label>
                        <input class="form-control" type="text" name="days" placeholder="Enter No. Of Days" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">No. Of Nights</label>
                        <input class="form-control" type="text" name="nights" placeholder="Enter No. Of Nights" required />
                    </div>
                    <button type="submit" class="btn btn-primary">Book Tour</button>
                    <br>                    
                </form> 
                    <%
                                    if (request.getMethod().equals("POST")) {
                                        String name = request.getParameter("name");
                                        String mobile = request.getParameter("mobile");
                                        String place_name = request.getParameter("place_name");
                                        String description = request.getParameter("description");
                                        String amount = request.getParameter("amount");
                                        String days = request.getParameter("days");
                                        String nights = request.getParameter("nights");

                                        try {
                                            String encodedName = Base64.getEncoder().encodeToString(name.getBytes());
                                            String encodedMobile = Base64.getEncoder().encodeToString(mobile.getBytes());
                                            String encodedPlaceName = Base64.getEncoder().encodeToString(place_name.getBytes());
                                            String encodedDescription = Base64.getEncoder().encodeToString(description.getBytes());
                                            ProcessBooking.addBooking(encodedName, encodedMobile, encodedPlaceName, encodedDescription, amount, days, nights);
                                            out.println("<div class='text-success'>Booking added successfully!</div>");
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
