<%-- 
    Document   : newuser
    Created on : Aug 2, 2019, 5:13:40 PM
    Author     : Hilary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a new user account</title>
    </head>
    <body>
        ${message}
        <h1>Please fill out the form below:</h1>
        <form action="createuser.jsp" method="POST">
            User Name: <input type="text" name="username" value="User Name" /><br>
            Password: <input type="password" name="password" value="Password" /><br>
            <input type="submit" value="Submit" name="submit" />
            <input type="reset" value="Reset" name="reset" />
        </form>
    </body>
</html>
