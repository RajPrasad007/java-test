<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
    <%@ page import="org.apache.struts.loginstruts.Logout" %>
    <%
        // Call the logout method from ProcessLogout class
        Logout.logout(request, response);
    %>
    <script>


                    window.location.href = 'Home.jsp';

            </script>

</body>
</html>
