<%-- 
    Document   : index1
    Created on : Jul 5, 2022, 9:16:19 AM
    Author     : Kayt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="document.forms['initProduct'].submit()">
        <form name="initProduct" id="1" action="mainController" method="POST">
            <input type=hidden name="search" value="<%= (request.getParameter("search") == null) ? "" : request.getParameter("search")%>">
            <input type="hidden" name="location" value="index.jsp">
            <input type="hidden" name="action" value="search">
        </form>
    </body>
</html>
