<%-- 
    Document   : login
    Created on : Jun 4, 2022, 12:48:02 PM
    Author     : Kayt
--%>

<%@page import="DTO.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>Login</title>
    </head>
    <body>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <div class="login">

            <div class="main-agileits">
                <div class="form-w3agile">
                    <h3>Login</h3>
                    <form action="mainController" method="POST">
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" placeholder="Email" name="email" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" placeholder="Password" name="password"required="">
                            <div class="clearfix"></div>
                        </div>
                        <input type="submit" name="action" value="Login">
                    </form>
                </div>
                <p class="text-danger ml-2"><%= error%></p>
                <div class="forg">
                    
                    <a href="register.jsp" class="forg-right">Register</a>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </body>
</html>
