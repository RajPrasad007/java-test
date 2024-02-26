<%@page import="org.apache.struts.loginstruts.ProcessLogin" %>
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
           <div class="col-lg-12"> <!-- Corrected column size -->
              <ul class="nav nav-tabs ">
                 <li class="nav-item">
                                     <a class="nav-link" href="Home.jsp">Home</a>
                                 </li>
                                <li class="nav-item">
                                     <a class="nav-link" href="UserLogin.jsp">User Login</a>
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
                              <h3 class="text-primary">User Login</h3><br />

                           <form method="POST">
                               <div class="form-group">
                                   <label for="inputName">Username</label>
                                   <input class="form-control" type="text" name="name" placeholder="Enter Username" required />
                               </div>

                               <div class="form-group">
                                   <label for="inputPass">Password</label>
                                   <input class="form-control" type="password" name="password" placeholder="Enter Password" required />
                               </div>
                               <%
                                                                                 if (request.getMethod().equals("POST")) {
                                                                                     String username = request.getParameter("name");
                                                                                     String password = request.getParameter("password");

                                                                                     session = request.getSession();
                                                                                     boolean loginSuccess = ProcessLogin.validateUser(username, password,session);
                                                                                     if (loginSuccess) { %>

                                                                                         <h3>Welcome <%= username %></h3>
                                                                                         <script>window.location.href = 'Booking.jsp';</script>
                                                                                     <% } else { %>
                                                                                         <div style="color: red;">Invalid Login</div>
                                                                                     <% }
                                                                                 } %>
                                                                                 <br>
                               <button type="submit" class="btn btn-primary">Login</button>
                               <br>
                           </form>

                      </div>

           </div>
           </div>

       </div>
    </body>
</html>

