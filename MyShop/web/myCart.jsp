<%-- 
    Document   : myCart.jsp
    Created on : Jun 22, 2022, 6:09:43 PM
    Author     : Kayt
--%>

<%@page import="DTO.ProductDTO"%>
<%@page import="DTO.UserDTO"%>
<%@page import="DTO.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>My Cart</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <header>
            <div class="container">
                <div class="logo">
                    <h1><a href="index1.jsp">Asyn Shop</a></h1>
                    <h6>Little shop for the love of milk tea.</h6>
                </div>
            </div>
            <nav class="navbar navbar-expand-sm justify-content-center">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="container">
                    <div class="collapse navbar-collapse col-8" id="Navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link hyper" href="index1.jsp"><span class="fa fa-home fa-lg"></span> Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link hyper" href="mainController?action=viewCart"><span class="fa fa-shopping-cart my-cart-icon"></span> Cart</a>
                            </li>
                        </ul>
                    </div>
                    <%
                        if (user == null) {
                    %>
                    <div class="col-2 d-flex">
                        <a class="btn border-none nav-link" type="button" href="login.jsp">Login</a>
                        <a class="btn border-none nav-link" type="button" href="register.jsp">Register</a>
                    </div>
                    <%
                    } else {
                    %>
                    <a class="btn border-none nav-link" type="button" href="userPage.jsp"><%= user.getFullName()%></a>
                    <%
                        }
                    %> 
                </div>
            </nav>
            <!--end of navbat-->
        </header>
        <div class="container">
            <h3>Your Cart</h3>
            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
            %>
            <div class="d-flex flex-row mt-3 mb-3 col-12">
                <label class="col-4">Product Infomation</label>
                <label class="col-1 ml-4">Quantity</label>
                <label class="col-1 ml-3">Total</label>
            </div>
            <div class="my-cart d-flex col-12">
                <div class="cart-form col-9 ml-3">

                    <%
                        double total = 0;
                        for (ProductDTO o : cart.getCart().values()) {
                            total += o.getQuantity() * o.getPrice();
                    %>

                    <form action="mainController" method="POST">
                        <div class="d-flex flex-row mt-3 mb-3 col-12">
                            <div class="col-2">
                            <img src="<%= o.getImgPath()%>" class="img-responsive" alt="<%= o.getProductName()%>">
                            </div>
                            <div class="col-7 d-flex">
                                <div class="col-6">
                                    <div class="col-12">
                                        <h6><strong><%= o.getProductName()%></strong></h6>							
                                    </div>
                                    <div class="col-12">
                                        <p><%= o.getDescription()%></p>							
                                    </div>
                                    <div class="col-12">
                                        <p><%= o.getPrice()%> $</p>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <input type="number" name="quantity" value="<%= o.getQuantity()%>">
                                </div>
                                <div class="col-3"><%= o.getQuantity() * o.getPrice()%> $</div>
                            </div>
                            <div class=col-3>
                                <input type="hidden" name="productId" value="<%= o.getProductId()%>">
                                <button class="btn btn-dark" type="submit" name="action" value="edit">Edit</button>
                                <button class="btn btn-danger" type="submit" name="action" value="remove">Remove</button>
                            </div>
                        </div>
                    </form>
                               <hr>

                    <%
                        }
                    %>
                </div>
                <div class="checkout-form col-3">
                    <form action="mainController" method="POST">
                        <div class="totals-item totals-item-total">
                            <label>Grand Total:</label>
                            <div class="totals-value" id="cart-total"><%= total%> $</div>
                        </div>
                        <button class="checkout" name="action" value="checkout">Checkout</button>
                    </form>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="p-3 mb-2 bg-danger text-white">Your Cart is empty!</div>
            <%
                }
            %>
        </div>
    </div>



    <div style="height: 260px;"></div>
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
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
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
