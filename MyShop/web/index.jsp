<%-- 
    Document   : wellcome
    Created on : Jun 4, 2022, 12:48:17 PM
    Author     : Kayt
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>Home</title>

    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user != null) {
                if ("AD".equals(user.getRoleId())) {
                    response.sendRedirect("adminPage.jsp");
                }
            }
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

            <div class="container">
                <div style="background-color: #faf9cb; border-bottom-left-radius:10%;border-bottom-right-radius:10%">
                    <div class="search-form">
                        <form action="mainController" method="POST" class="m-auto">
                            <input type="text" name="search" placeholder="Search" 
                                   value="<%= (request.getParameter("search") == null) ? "" : request.getParameter("search")%>"/>
                            <input type="hidden" name="location" value="index.jsp"/>
                            <input type="submit" name="action" value="Search"/>
                        </form>
                    </div>
                </div>
            </div> 
        </header>
        <!--==-->
        <div class="container">

            <div class="row d-flex align-items-start m-1">
                <%
                    List<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("PRODUCT_LIST");
                    if (productList != null && productList.size() > 0) {
                        for (ProductDTO o : productList) {
                %>

                <div class="product col-3 mt-3 mb-3 m-wthree">
                    <form action="mainController" method="POST">
                        <div class="col-12">
                            <img src="<%= o.getImgPath()%>" class="img-responsive" style="height: 240px;" alt="<%= o.getProductName()%>">
                        </div>
                        <div class="mid-1">
                            <div class="">
                                <h6><%= o.getProductName()%></h6>							
                            </div>
                            <div class="">
                                <p><%= o.getDescription()%></p>							
                            </div>
                            <div class="mid-2">
                                <p ><em class="item_price"><%= o.getPrice()%></em></p>
                            </div>
                            <div class="add add-2">
                                <input type="hidden" name="productId" value="<%= o.getProductId()%>">
                                <input type="hidden" name="productName" value="<%= o.getProductName()%>">
                                <input type="hidden" name="imgPath" value="<%= o.getImgPath()%>">
                                <input type="hidden" name="description" value="<%= o.getDescription()%>">
                                <input type="hidden" name="cateId" value="<%= o.getCategoryId()%>">
                                <input type="hidden" name="price" value="<%= o.getPrice()%>">
                                <input type="hidden" name="search" value="<%= (request.getParameter("search") == null) ? "" : request.getParameter("search")%>"/>
                                <button class="btn my-cart-btn my-cart-btn1" name="action" value="addToCart">Add to Cart</button>
                            </div>
                        </div>
                    </form>

                </div>

                <%
                        }
                    }
                %>
            </div>

        </div>
        <div style="height: 260px;"></div>
        <!--==-->
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
