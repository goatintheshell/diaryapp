<%-- 
    Document   : entryupdate
    Created on : Aug 3, 2019, 12:59:53 PM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Entry</title>
    </head>
    <body>
        <%  String stringIndex = request.getParameter("index");
            String words = request.getParameter("words");
            int index = Integer.parseInt(stringIndex);
            Entry entry1 = user.getEntry(index);
            entry1.setWords(words);
            entry1.updateInDB();
            String entryUpdated = "Entry Updated";
            request.setAttribute("entryUpdated", entryUpdated);
            request.getRequestDispatcher("/viewentries.jsp").forward(request, response);
            %>
    </body>
</html>
