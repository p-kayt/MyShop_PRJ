<%-- 
    Document   : register
    Created on : Jul 7, 2022, 4:07:18 PM
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
        <title>Register</title>
    </head>
    <body>
        <%
            UserError error = (UserError) request.getAttribute("USER_ERROR");
            if (error == null) {
                error = new UserError();
            }
        %>
        <div class="login">
            <div class="main-agileits">
                <div class="form-w3agile form1">
                    <h3>Register</h3>
                    <form action="mainController" method="POST">
                        <p>Name</p><p class="text-danger ml-2"><%= error.getFullName()%></p>
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>

                            <input  type="text" placeholder="Name" name="fullName" value="<%= (request.getParameter("fullName") == null) ? "" : request.getParameter("fullName")%>" required="">
                            <div class="clearfix"></div>
                        </div>
                        <p>Email</p><p class="text-danger ml-2"><%= error.getEmail()%></p>
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" placeholder="Email" name="email" value="<%= (request.getParameter("email") == null) ? "" : request.getParameter("email")%>" required="">

                            <div class="clearfix"></div>
                        </div>
                        <p>Phone</p><p class="text-danger ml-2"><%= error.getPhone()%></p>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="text" placeholder="Phone" name="phone" value="<%= (request.getParameter("phone") == null) ? "" : request.getParameter("phone")%>" required="">

                            <div class="clearfix"></div>
                        </div>

                        <p>Password</p>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" placeholder="Password" name="password" required="">
                            <div class="clearfix"></div>
                        </div>
                        <p>Confirm Password</p><p class="text-danger ml-2"><%= error.getConfirmPws()%></p>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" placeholder="Confirm Password" name="confirmPws" required="">
                            <div class="clearfix"></div>
                        </div>

                        <input type="submit" name="action" value="Register">
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
