<%-- 
    Document   : editCustomerProcess
    Created on : Mar 3, 2022, 12:53:58 PM
    Author     : alext
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
         String id = request.getParameter("id");
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");

        String gender = (request.getParameter("gender"));
        String address = request.getParameter("address");
        String con = "60" + (request.getParameter("contact"));
        String IC = request.getParameter("ic");
        String email = request.getParameter("email");
        int contact = Integer.parseInt(con);


        String url = "jdbc:derby://localhost:1527/sample";

    if(id != null)
    {
        PreparedStatement ps = null;
        String userID = (id);
        try
        {

            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            Connection conn = DriverManager.getConnection (url, "app", "app");
            String sql="Update APP.CUSTOMER set id=?, name =?,password=?,gender= ?,phone=?,address=?,IC=?,email=? where id= '"+id +"'";
            ps = conn.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.setString(4, gender);
            ps.setInt(5, contact);
            ps.setString(6, address);
            ps.setString(7, IC);
            ps.setString(8, email);

            Statement st = conn.createStatement();

            int i = ps.executeUpdate();
            if(i > 0)
            {
                    out.println("<script>" + "alert('Record Update!')" + "</script>");

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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Editing Page</title>
    </head>
    <body>
    </body>
</html>
