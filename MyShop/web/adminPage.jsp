<%-- 
    Document   : adminPage
    Created on : Jun 4, 2022, 12:48:51 PM
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
        <title>Admin Page</title>
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
                    <h6>Little shop for the love of milk tea.</h6>
                </div>
            </div>

            <nav class="navbar navbar-expand-sm">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="container">
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
                </div>

            </nav>
            <!--end of navbat-->


        </header>
        <div class="container">

            <%
                List<ProductDTO> productList = (ArrayList<ProductDTO>) request.getAttribute("PRODUCT_LIST");
                List<UserDTO> userList = (ArrayList<UserDTO>) request.getAttribute("USER_LIST");
                if (productList != null && productList.size() > 0) {
            %>
            <div style="background-color: #faf9cb; border-bottom-left-radius:10%;border-bottom-right-radius:10%">
                <div class="search-form col-12">
                    <form action="mainController"  class="m-auto">
                        <input type="text" name="search" placeholder="Search Product" 
                               value="<%= (request.getParameter("search") == null) ? "" : request.getParameter("search")%>"/>
                        <input type="hidden" name="location" value="adminPage.jsp"/>
                        <input type="submit" name="action" value="Search"/>
                    </form>
                </div>
            </div>

            <div class="product-form col-12">
                <div class="d-flex mt-3 mb-3 col-12">
                    <label class="col-2">Image</label>
                    <label class="col-4">Product Infomation</label>
                    <label class="col-2">Price</label>
                    <label class="col-2">Quantity</label>
                </div>
                <%
                    for (ProductDTO o : productList) {
                %>

                <div class="d-flex col-12">
                    <form action="mainController" method="POST" class="col-12 d-flex">
                        <img src="<%= o.getImgPath()%>" class="col-2" alt="<%= o.getProductName()%>">
                        <div class="col-8 d-flex">
                            <div class="col-6">
                                <div class="col-12">
                                    <h6><%= o.getProductName()%></h6>							
                                </div>
                                <div class="col-12">
                                    <p><%= o.getDescription()%></p>							
                                </div>
                            </div>
                            <div class="col-3">
                                <input type="number" name="price" value="<%= o.getPrice()%>">  $
                            </div>
                            <div class="col-3 ml-3">
                                <input type="number" name="quantity" value="<%= o.getQuantity()%>">
                            </div>

                        </div>
                        <div class ="col-3 ml-3">
                            <input type="hidden" name="productId" value="<%= o.getProductId()%>">
                            <button class="btn btn-dark" type="submit" name="action" value="updateProduct">Update</button>
                            <button class="btn btn-danger" type="submit" name="action" value="deleteProduct">Delete</button>
                        </div>
                    </form>
                </div>
                <hr>


                <%
                    }
                %>
            </div>

            <%
                }
                if (userList != null && userList.size() > 0) {
            %>
            <div style="background-color: #faf9cb; border-bottom-left-radius:10%;border-bottom-right-radius:10%">
                <div class="search-form">
                    <form action="mainController" method="POST" class="m-auto">
                        <input type="text" name="search" placeholder="Search User" 
                               value="<%= (request.getParameter("search") == null) ? "" : request.getParameter("search")%>"/>
                        <input type="hidden" name="location" value="adminPage.jsp"/>
                        <input type="hidden" name="action" value="searchUser"/>
                        <input type="submit" name="" value="Search"/>
                    </form>
                </div>
            </div>

            <div class="user-form col-12">  
                <div class="d-flex flex-row mt-3 mb-3 col-12">
                    <label class="col-6">User Infomation</label>
                    <label class="col-3">Role</label>
                </div>
                <%
                    for (UserDTO o : userList) {
                %>
                <div class="d-flex mt-3 mb-3 col-12">
                    <form action="mainController" method="POST" class="col-12 d-flex">
                        <div class="col-9 d-flex">
                            <div class="col-8">
                                <div class="col-12">
                                    <h6>Name: <%= o.getFullName()%></h6>							
                                </div>
                                <div class="col-12">
                                    <p>Email: <%= o.getEmail()%></p>							
                                </div>
                                <div class="col-12">
                                    <p>Phone number: <%= o.getPhone()%></p>							
                                </div>
                            </div>
                            <div class="col-3">
                                <input type="text" name="roleId" value="<%= o.getRoleId()%>"
                                       <%
                                           if (user.getUserId().equals(o.getUserId())) {
                                       %>
                                       readonly=""
                                       <%
                                           }
                                       %>
                                       >

                            </div>

                        </div>
                        <div class=col-5>
                            <input type="hidden" name="userId" value="<%= o.getUserId()%>">
                            <button class="btn btn-dark" name="action" value="updateUser">Update</button>
                            <button class="btn btn-danger" name="action" value="deleteUser">Delete</button>
                        </div>
                    </form>

                </div>
                <hr>
                <%
                    }
                %>
            </div>
            <%
                }
            %>
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
