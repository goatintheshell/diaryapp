<%-- 
    Document   : login
    Created on : Aug 2, 2019, 11:40:11 AM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Salt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hilarysturges.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<jsp:setProperty name="user" property="name" param="userName" />
<jsp:setProperty name="user" property="password" param="password" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
          session.setMaxInactiveInterval(1800);  
          Salt salt = new Salt();
          String saltedPassword = user.getPassword().concat(salt.getSalt());
          int hashedAndSalted = saltedPassword.hashCode();
          user.login(user.getName(), String.valueOf(hashedAndSalted));
          if(user.isLoggedIn()) {
            user.setEntriesFromDB();
            response.sendRedirect("index.jsp");  
            return; 
          } else {
            out.println("Invalid login<br />");
            out.println("<a href = 'login.html'>Try Again</a>");
          }
        %>
    </body>
</html>
