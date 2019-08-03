<%-- 
    Document   : changepassword
    Created on : Aug 2, 2019, 6:36:18 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <% 
            session.setMaxInactiveInterval(1800);  
        if (user.getPassword().equals(request.getParameter("currentpassword"))) {
            user.setPassword(request.getParameter("newpassword"));
            user.changePassword(request.getParameter("newpassword"));
          String passwordChanged = "Password Updated";
          request.setAttribute("passwordChanged", passwordChanged);
          request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else {
            out.println("Incorrect current password");
            out.println("<br><a href = 'changepassword.html'>Try Again</a>");
        }
        %>
    </body>
</html>
