<%-- 
    Document   : editStaff
    Created on : Feb 23, 2022, 11:42:08 PM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

        <%
        String ID = request.getParameter("id");

        String url = "jdbc:derby://localhost:1527/sample";
        Class.forName ("org.apache.derby.jdbc.ClientDriver").newInstance ();
        try{
            Connection conn = DriverManager.getConnection (url, "app", "app");
        
            Statement statement = conn.createStatement() ;
            String sql ="select * from APP.MANAGINGSTAFF  where id = '"+ID +"' ";
            ResultSet resultSet = statement.executeQuery(sql) ;
        
        
        while(resultSet.next()){
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <h1> Update Page</h1>
       
    </head>
    <body>
        <center>
         <form method="post" action="editStaffProcess.jsp">
        <input type="hidden" name="id" value="<%=resultSet.getString("ID") %>">
        <input type="text" name="id" value="<%=resultSet.getString("ID") %>" readonly>
        <br>
           UserID<br>
           <input type="text" name="first_name" value="<%=resultSet.getString("ID") %>">
           <br>
           User Name: <br>
           <input type="text" name="name" value="<%=resultSet.getString("NAME") %>">
           <br>
           Identification Number: <br>
           <input type="text" name="IC" value="<%=resultSet.getString("IC")  %>">
           <br>
           Password: <br>
           <input type="text" name="password" value="<%=resultSet.getString("PASSWORD") %>">
           <br>
           Gender: <br>
           <input type="text" name="gender" value="<%=resultSet.getString("GENDER") %>">
           <br>
           Position: <br>
           <input type="text" name="position" value="<%=resultSet.getString("POSITION") %>">
           <br>
           Phone: <br>
           <input type="text" name="phone" value="<%=resultSet.getInt("PHONE") %>">
           <br>
           Address: <br>
           <input type="text" name="address" value="<%=resultSet.getString("ADDRESS") %>">
           <br>
           Email:<br>
           <input type="email" name="email" value="<%=resultSet.getString("EMAIL") %>">
           <br><br>
           <input type="submit" value="submit">
           </form>
            </center>

        <%
        }
        conn.close();
        }    catch (Exception e) {
        e.printStackTrace();
        }
        %>
    </body>
</html>
