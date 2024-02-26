<%@page import="org.apache.struts.loginstruts.ProcessRegistration" %>

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
                  <li class="nav-item">
                                      <a class="nav-link" href="Home.jsp">Home</a>
                                  </li>
                                 <li class="nav-item">
                                      <a class="nav-link active" href="UserLogin.jsp">User Login</a>
                                  </li>
                                  <li class="nav-item">
                                  <a class="nav-link" href="AdminLogin.jsp">Admin Login</a>
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
                   <h3 class="text-primary">User Register</h3><br />
                <form method="POST">
                    <div class="form-group">
                        <label for="inputName">Username</label>
                        <input class="form-control" type="text" name="name" placeholder="Enter Username" required />
                    </div>

                    <div class="form-group">
                        <label for="inputPass">Password</label>
                        <input class="form-control" type="password" name="password" placeholder="Enter Password" required />
                    </div>                    

                    <div class="form-group">
                        <label for="inputMobile">Mobile</label>
                        <input class="form-control" type="text" name="mobile" placeholder="Enter Mobile" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input class="form-control" type="text" name="email" placeholder="Enter Email" required />
                    </div>
                    <%
                                        if (request.getMethod().equals("POST")) {
                                            String username = request.getParameter("name");
                                            String password = request.getParameter("password");
                                            String mobile = request.getParameter("mobile");
                                            String email = request.getParameter("email");


                                            if (username.isEmpty() || password.isEmpty() || mobile.isEmpty() || email.isEmpty()) {
                                        %>
                                                <div style="color: red;">All fields are mandatory</div>
                                        <%
                                            } else {

                                                String message = ProcessRegistration.registerUser(username, password, mobile, email);
                                        %>
                                                <div style="color: <%= message.startsWith("Error") ? "red" : "green" %>;"><%= message %></div>
                                        <%
                                            }
                                        }
                                        %>
                                        <br>
                    <button type="submit" class="btn btn-primary">Register</button>
                    <br>                    
                </form> 

           </div>
           </div> 

       </div>
    </body>
</html>
