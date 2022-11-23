<%-- 
    Document   : deleteStaff
    Created on : Feb 24, 2022, 1:26:17 PM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>

<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>

<%
    String id=request.getParameter("id");
    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName ("org.apache.derby.jdbc.ClientDriver").newInstance ();
    try{
        Connection conn = DriverManager.getConnection (url, "app", "app");

        Statement statement = conn.createStatement() ;
        int i=statement.executeUpdate("DELETE FROM APP.DELIVERYSTAFF WHERE id= '"+id +"' ");
        out.println("Data Deleted Successfully!");

    }catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
