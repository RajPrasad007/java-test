<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1=1 Tour Booking</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="cstyle.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="sidebarContent"><img src="image/trs.jpg" class="img-fluid" alt="Tours and Travels Logo"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
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
    <br>
    <div class="row">
        <div class="col-lg-12">
            <h2>1=1 Welcome to Online Tours and Travels Agency!</h2>
            <p>Explore the world with us and create unforgettable memories.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <h3>2=2 Featured Destinations</h3>
            <ul>
                <li><a href="#">Paris, France</a></li>
                <li><a href="#">Kyoto, Japan</a></li>
                <li><a href="#">Santorini, Greece</a></li>
            </ul>
        </div>
        <div class="col-lg-4">
            <h3>Special Offers</h3>
            <p>Book now and save on your next adventure!</p>
            <p>Limited time offer: 20% off on all tours!</p>
            <a href="#" class="btn btn-primary">View Offers</a>
        </div>
        <div class="col-lg-4">
            <h3>Customer Testimonials</h3>
            <blockquote>
                "Our trip to Italy was fantastic! Thanks to Online Tours and Travels for the amazing experience."
                <footer>- John Doe</footer>
            </blockquote>
            <blockquote>
                "I highly recommend Online Tours and Travels. Their attention to detail made our vacation stress-free."
                <footer>- Jane Smith</footer>
            </blockquote>
        </div>
    </div>

</div>
</body>
</html>

