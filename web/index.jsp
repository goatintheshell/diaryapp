<%-- 
    Document   : index
    Created on : Aug 1, 2019, 8:06:28 PM
    Author     : Hilary
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hilarysturges.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.hilarysturges.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Secret Keeper</title>
        <script>
            function deleteAccount() {
                window.location.href = "deleteaccount.jsp";
            }            
        </script>
    </head>
    <body>
        <div class="messages">
        ${entryUpdated}
        ${passwordChanged}
        ${usernameChanged}
        </div>
        <%
          if(!user.isLoggedIn())
          {
           response.sendRedirect("login.html");  // Tell the browser to go to this page
           return; // do nothing more
          }
          

     %>
        
     <div class="headerwithmessages"><h1>Welcome to your online diary, <%= user.getName() %>!</a></h1></div>
     <main><article><textarea id="entrytextarea" name="entries" rows="30" cols="150" >
    Thank you for choosing Secret Keeper for your personal diary!
             </textarea></article>
    </main>
     <nav><h3> Your most recent entries </h3><br>
         <%  
             
             
         String stringIndex = request.getParameter("index");
         int index = 0;
         if (stringIndex!=null) {
            index = Integer.parseInt(stringIndex);
            Entry entry = user.getEntry(index);
            %><script>
                function viewEntry() {
                    var entrytextarea = document.getElementById('entrytextarea');
                    entrytextarea.innerHTML = '<%= entry.getWords() %>';
                }
                viewEntry();
                                </script><%
         }
        ArrayList<Entry> entries = new ArrayList<Entry>();
            entries = user.getEntries();
            int limit = 0;
            if (entries!=null) {
                if (entries.size() > 5) {
                    limit = 5;
                } else {
                    limit = entries.size();
                }
            for (int i=0 ; i<limit ; i++) {
                String title = entries.get(i).getName();
                out.println("<a id ='entrylinks' href='index.jsp?index=" + i + "'>" + title + "</a><br>");
                }
            }
            
            %>
            
            <br><h3><a id ="addnewentry" href="addentry.html">Add Diary Entry</a><br><br>
                Browse entries by Month:<br></h3>
            <select id="monthviewer" onchange="entriesByMonth.entriesByMonth(this.id)">
                <option id="Jan">January</option>
                <option id="Feb">February</option>
                <option id="Mar">March</option>
                <option id="Apr">April</option>
                <option id="May">May</option>
                <option id="Jun">June</option>
                <option id="Jul">July</option>
                <option id="Aug">August</option>
                <option id="Sep">September</option>
                <option id="Oct">October</option>
                <option id="Nov">November</option>
                <option id="Dec">December</option>
            </select>
            
     </nav>
            
     <footer>
         <div class="accountlinks">
             <a href="logout.jsp">Logout</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="changeusername.html">Change Username</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="changepassword.html">Change Password</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="deleteaccount.jsp" onclick="if(confirm('Are you sure?')) deleteAccount(); return false">Delete Account</a>
         </div>
     </footer>
    </body>
</html>
