<%-- 
    Document   : createuser
    Created on : Aug 2, 2019, 3:48:16 PM
    Author     : Hilary
--%>

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
          session.setMaxInactiveInterval(1800);  // 30 minute time out
          boolean userExists = newuser.checkForUser(newuser.getName());
          if (!userExists) {
            newuser.createUser(newuser.getName(), newuser.getPassword());
            response.sendRedirect("login.html");
          } 
          String message = "Username already exists";
          request.setAttribute("message", message);
          request.getRequestDispatcher("/newuser.jsp").forward(request, response);
        %>
    </head>
    <body>
       
    </body>
</html>
