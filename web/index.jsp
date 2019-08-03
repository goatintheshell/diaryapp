<%-- 
    Document   : index
    Created on : Aug 1, 2019, 8:06:28 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secret Keeper</title>
        
        <script>
            function deleteAccount() {
                window.location.href = "deleteaccount.jsp";
            }            
        </script>
    </head>
    <body>
        ${passwordChanged}
        ${usernameChanged}
        <%
          if(!user.isLoggedIn())
          {
           response.sendRedirect("login.html");  // Tell the browser to go to this page
           return; // do nothing more
          }
     %>
        
     <h1>Welcome to your online diary, <%= user.getName() %>!</a></h1>
    <a href="logout.jsp">Logout</a><br>
    <a href="changeusername.html">Change Username</a><br>
    <a href="changepassword.html">Change Password</a><br>
    <a href="deleteaccount.jsp" onclick="if(confirm('Are you sure?')) deleteAccount(); return false">Delete Account</a><br><br>
    <a href="addentry.html">Add Diary Entry</a><br>
    <a href="viewentries.jsp">View Diary Entries</a>
    </body>
</html>
