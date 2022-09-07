<%-- 
    Document   : addProduct.jsp
    Created on : Jul 7, 2022, 12:52:59 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user != null) {
                if ("US".equals(user.getRoleId())) {
                    response.sendRedirect("index1.jsp");
                }
            } else {
                response.sendRedirect("index1.jsp");
            }
        %>
        <header>
            <div class="container">
                <div class="logo">
                    <h1 ><a href="index1.jsp">Asyn Shop</a></h1>
                </div>
            </div>
            <nav class="navbar navbar-expand-sm">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="col-2"></div>
                <div class="collapse navbar-collapse col-6" id="Navbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="mainController?action=viewProduct">Product Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mainController?action=viewUser">User Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addProduct.jsp">Add Product</a>
                        </li>
                    </ul>
                </div>
                <a class="btn border-none nav-link col-3" type="button" href="mainController?action=logout">Logout</a>
            </nav>
            <!--end of navbat-->


        </header>

        <div class="container">
            <div class="d-flex mt-3 mb-3 col-12">




            </div>

            <div class="add-form">
                <form action="mainController" method="POST" class="col-12">
                    <label class="col-2">Image Path</label>
                    <input type="text" name="imgPath" placeholder="" required="">

                    <div class="d-flex">
                        <label class="col-2">Product Infomation</label>
                        <div>
                            <input type="text" name="productName" placeholder="Product Name" required=""><br>
                            <input type="text" name="description" placeholder="Description"> <br>
                            <select name="cateId">
                                <option value="1">Milk</option>
                                <option value="2">Bubble Milk Tea</option>
                                <option value="3">Milk Tea</option>
                                <option value="4">Others</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <label class="col-2">Price</label>
                        <input type="number" name="price" placeholder="Price" required="" min="0">
                    </div>
                    <label class="col-2">Quantity</label>
                    <input type="number" name="qty" placeholder="Quantity" required="" min="0">
                    <div class="btn-group">
                        <button type="submit" name="action" value="addProduct">Add</button>
                        <input type="reset" value="Reset" />
                    </div>
                </form>
            </div>

        </div>
        <div style="height: 300px"></div>
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
                        <li><a href="mainController?action=logout">Logout</a></li>
                            <%
                                }
                            %> 
                    </ul>
                </div>
            </div>
        </footer>
    </body>
</html>
