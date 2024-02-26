<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="org.apache.struts.loginstruts.ProcessAdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Booking</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="cstyle.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="sidebarContent"><img src="image/trs.jpg" class="img-fluid" alt="Logo"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-tabs">
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
            <h3 class="text-primary">Admin Login</h3><br />
            <form method="POST">
                <div class="form-group">
                    <label for="inputName">Username</label>
                    <input class="form-control" type="text" name="name" placeholder="Enter Username" />
                </div>
                <div class="form-group">
                    <label for="inputPass">Password</label>
                    <input class="form-control" type="password" name="password" placeholder="Enter Password" />
                </div>
                <% if (request.getMethod().equals("POST")) {
                    String username = request.getParameter("name");
                    String password = request.getParameter("password");
                    if (username != null && password != null) {
                        session = request.getSession();
                        boolean loginSuccess = ProcessAdminLogin.validateUser(username, password, session);
                        if (loginSuccess) { %>
                            <h3>Welcome <%= username %></h3>
                            <script>window.location.href = 'AdminHome.jsp';</script>
                        <% } else { %>
                            <div style="color: red;">Invalid Login</div>
                        <% }
                    } else { %>
                        <div style="color: red;">Username or password cannot be null</div>
                    <% } } %>
                <br>
                <button type="submit" class="btn btn-primary">Login</button>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
