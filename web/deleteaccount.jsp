<%-- 
    Document   : deleteaccount
    Created on : Aug 2, 2019, 7:41:50 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
       
            <% user.deleteUser(); 
               user.logOut();
               response.sendRedirect("login.html");
            %>
       
    </head>
    <body>
    </body>
</html>
