<%-- 
    Document   : createuser
    Created on : Aug 2, 2019, 3:48:16 PM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Salt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="newuser" scope="session" class="com.hilarysturges.User" />
<jsp:setProperty name="newuser" property="name" param="username" />
<jsp:setProperty name="newuser" property="password" param="password" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Account</title>
        <%
          session.setMaxInactiveInterval(1800);  
          boolean userExists = newuser.checkForUser(newuser.getName());
          if (!userExists) {
              Salt salt = new Salt();
              String saltedPassword = newuser.getPassword().concat(salt.getSalt());
              int hashedAndSalted = saltedPassword.hashCode();
            newuser.createUser(newuser.getName(), String.valueOf(hashedAndSalted));
            response.sendRedirect("login.html");
          } else {
          String message = "Username already exists";
          request.setAttribute("message", message);
          request.getRequestDispatcher("/newuser.jsp").forward(request, response);
          }
        %>
    </head>
    <body>
       
    </body>
</html>
