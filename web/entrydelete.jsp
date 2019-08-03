<%-- 
    Document   : entrydelete
    Created on : Aug 3, 2019, 12:36:27 PM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Entry</title>
    </head>
    <body>
        <%  String stringIndex = request.getParameter("index");
            int index = Integer.parseInt(stringIndex);
            Entry entry = user.getEntry(index);
            
            entry.removeFromDB();
            user.removeEntry(index);
            
            response.sendRedirect("viewentries.jsp");
            
        %>
    </body>
</html>
