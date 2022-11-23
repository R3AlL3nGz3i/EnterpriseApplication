<%-- 
    Document   : editStaffProcess
    Created on : Feb 24, 2022, 12:41:19 AM
    Author     : alext
--%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
    String url = "jdbc:derby://localhost:1527/sample";
%>

<%
    String id = request.getParameter("id");
    String name= request.getParameter("Name");
    String Category= request.getParameter("Category");
    int quantity = Integer.parseInt(request.getParameter("Quantity"));
    double price = Double.parseDouble(request.getParameter("Price"));
    
    if(id != null)
    {
        PreparedStatement ps = null;
        String userID = (id);
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            Connection conn = DriverManager.getConnection (url, "app", "app");
            String sql="Update APP.PRODUCT set id=?, name =?,category=?,price= ?,quantity=? where id= '"+id +"'";
            ps = conn.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2, name);
            ps.setString(3, Category);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
       

            int i = ps.executeUpdate();
            if(i > 0)
            {
                out.print("Record Updated Successfully");
            }
            else
            {
                out.print("There is a problem in updating Record.");
            }
            }
            catch(SQLException sql)
            {
                request.setAttribute("error", sql);
            out.println(sql);
    }
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
