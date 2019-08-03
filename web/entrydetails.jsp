<%-- 
    Document   : entrydetails.jsp
    Created on : Aug 2, 2019, 10:28:49 PM
    Author     : Hilary
--%>

<%@page import="com.hilarysturges.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entry</title>
        
    </head>
    <body>
        <%  String stringIndex = request.getParameter("index");
            int index = Integer.parseInt(stringIndex);
            Entry entry = user.getEntry(index);
            
            out.println("<h1>" + entry.getName() + "</h1>");
            out.println("<textarea id = 'entry' name = 'entry' rows = '30' cols = '150' action='entryupdate.jsp' method='POST'>" + entry.getWords() + "</textarea><br>");
            %>
            
            <script>
                var index = <%=index%>;
            function deleteEntry() {
                window.location.href = "entrydelete.jsp?index=" + index;
            } 
            function editEntry() {
                var words = document.getElementById('entry').value;
                window.location.href = "entryupdate.jsp?index=" + index + "&words=" + words;
            }
        </script>
            <a href="entryupdate.jsp?" onclick="editEntry(); return false"><input type="button" value="Edit" name="edit" /></a>
            <a href="entrydelete.jsp" onclick="if (confirm('Are you sure?'))deleteEntry(); return false"><input type="button" value="Delete" name="delete" /></a><br>
            <a href="index.jsp">Return to Home</a>
    </body>
</html>
