<%-- 
    Document   : viewentries
    Created on : Aug 2, 2019, 9:31:21 PM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Entry"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diary Entries</title>
    </head>
    <body>
        ${entryUpdated}
        <h1>Viewing your diary entries</h1>
        <%  ArrayList<Entry> entries = new ArrayList<Entry>();
            entries = user.getEntries();
            if (entries!=null) {
            for (int i=0 ; i<entries.size() ; i++) {
                String title = entries.get(i).getName();
                out.println("<a href='entrydetails.jsp?index=" + i + "'>" + title + "</a><br>");
                }
            }
            %>
    </body>
</html>
