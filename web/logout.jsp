<%-- 
    Document   : logout
    Created on : Aug 2, 2019, 11:48:52 AM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
          user.logOut();
          response.sendRedirect("login.html");
        %>
    </body>
</html>
