<%-- 
    Document   : login
    Created on : Aug 2, 2019, 11:40:11 AM
    Author     : Hilary
--%>

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
          session.setMaxInactiveInterval(1800);  // 30 minute time out
          user.login(user.getName(), user.getPassword());
          if(user.isLoggedIn()) {
            response.sendRedirect("index.jsp");  // Tell the browser to go to this page
           return; // do nothing more;
          } else
            out.println("Invalid login<br />");
          
         
        %>
    </body>
</html>
