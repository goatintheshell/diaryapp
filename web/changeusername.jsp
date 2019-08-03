<%-- 
    Document   : changeusername
    Created on : Aug 2, 2019, 7:07:33 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Username</title>
    </head>
    <body>
        <% 
            session.setMaxInactiveInterval(1800);  
        if (user.getName().equals(request.getParameter("currentusername"))) {
            if (!user.checkForUser(request.getParameter("newusername"))) {
              user.setName(request.getParameter("newusername"));
              user.changeUsername(request.getParameter("newusername"));
              String usernameChanged = "Username Changed";
              request.setAttribute("usernameChanged", usernameChanged);
              request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
        else {
            out.println("Incorrect current username");
            out.println("<br><a href = 'changeusername.html'>Try Again</a>");
        }
        %>
    </body>
</html>
