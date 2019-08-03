<%-- 
    Document   : addentry
    Created on : Aug 2, 2019, 9:09:59 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<jsp:useBean id="entry" scope="page" class="com.hilarysturges.Entry" />
<jsp:setProperty name="entry" property="name" param="entryname" />
<jsp:setProperty name="entry" property="words" param="diaryentry" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Entry</title>
    </head>
    <body>
        <% entry.addEntry(user.getId());
           entry.setUser_id(user.getId());
           entry.setDateAndId();
           user.setEntry(entry);
           response.sendRedirect("viewentries.jsp");
            %>
    </body>
</html>
