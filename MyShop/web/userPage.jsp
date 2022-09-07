<%-- 
    Document   : userPage
    Created on : Jun 4, 2022, 12:49:38 PM
    Author     : Kayt
--%>

<%@page import="DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>Personal page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user != null) {
                if ("AD".equals(user.getRoleId())) {
                    response.sendRedirect("adminPage.jsp");
                }
            }else{
                response.sendRedirect("index1.jsp");
            }
        %>
        <header>
            <div class="container">
                <div class="logo">
                    <h1><a href="index1.jsp">Asyn Shop</a></h1>
                    <h6>Little shop for the love of milk tea.</h6>
                </div>
                
                <nav class="navbar navbar-expand-sm">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="Navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index1.jsp"><span class="fa fa-home fa-lg"></span> Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="mainController?action=viewCart"><span class="fa fa-shopping-cart my-cart-icon"></span> Cart</a>
                            </li>
                        </ul>
                    </div>
                    <a class="btn border-none nav-link" type="button" href="mainController?action=logout">Logout</a>
                </nav>
                <!--end of navbat-->
            </div>
        </header>
        <div class="container">
            <div class="mt-3 mb-3 col-12">
                <form action="mainController" method="POST">
                    <div class="col-12 d-flex">
                        <div class="col-8">
                            <div class="col-12">
                                <p>Email: <%= user.getEmail()%></p>							
                            </div>
                            <div class="col-12">
                                <h6>Name:<br> <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""></h6>	

                            </div>

                            <div class="col-12">
                                <p>Phone number:<br> <input type="text" name="phone" value="<%= user.getPhone()%>" required=""></p>

                            </div>
                        </div>

                    </div>
                    <div class=col-5>
                        <button class="btn btn-dark" name="action" value="updateProfile">Update Profile</button>
                    </div>
                </form>

            </div>
        </div>
        <footer>
            <div class="container d-flex">
                <div class="col-md-4 footer-grid ">
                    <h3>Menu</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="mainController?action=viewCart">My Cart</a></li>
                    </ul>
                </div>
                <div class="col-md-4 footer-grid ">
                    <h3>Customer Services</h3>
                    <ul>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Online Shopping</a></li>						 

                    </ul>
                </div>
                <div class="col-md-4 footer-grid">
                    <h3>My Account</h3>
                    <ul>
                        <%
                            if (user == null) {
                        %>
                        <li><a href="mainController?action=login">Login</a></li>
                        <li><a href="mainController?action=register">Register</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="mainController?action=register">Logout</a></li>
                            <%
                                }
                            %> 
                    </ul>
                </div>
            </div>
        </footer> 
    </body>
</html>
