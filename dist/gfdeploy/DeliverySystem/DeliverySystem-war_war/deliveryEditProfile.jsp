<%-- 
    Document   : register
    Created on : Feb 21, 2022, 7:04:41 PM
    Author     : alext
--%>

<%@page import="model.DeliveryStaff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");
%>
<style>
    .register a:link, .register a:visited   {
        background-color: #ADD8E6; /* Green background */
        border: 1px solid blue; /* Green border */
        color: white; /* White text */
        padding: 30px 30px; /* Some padding */
        cursor: pointer; /* Pointer/hand icon */
        width: 100%; /* Set a width if needed */
        display: inline; /* Make the buttons appear below each other */
        margin: 0 auto;
        font-size: 100%;
    }
    #search{
        background-position: 10px 12px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        width: 30%; /* Full-width */
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
    }
    /* Add a background color on hover */
    .p:hover, .p:active {
        background-color: #add8e6;
        cursor:auto
    }
    .tableCart {
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse; /* Collapse borders */
        background-color: #99ccff; 
       
        overflow:scroll;
    }
    p>input, p>button {
        font-size: 23px;
    }
    .tableCart th, #tableCart td {
        text-align: left; /* Left-align text */
        padding: 12px; /* Add padding */
    }
    .tableCart tr {
        /* Add a bottom border to all table rows */
        border-bottom: 1px solid #ddd;
    }
    .tableCart tr.header{
        /* Add a grey background color to the table header and on hover */
        background-color: #F1C40F;
    }
    #tableCart tr:hover {

    }

</style>

<%
    HttpSession s = request.getSession();
    DeliveryStaff user_id = (DeliveryStaff) s.getAttribute("login");

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from APP.DELIVERYSTAFF WHERE ID = '" + user_id.getId() + "' ");

    while (resultSet.next()) {

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>

    <body>
    <center>

        <form action="DeliveryEditProfile" method="POST">             
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="id" size="20"  value="<%=resultSet.getString("ID")%>" readonly></td>
                </tr>
                <tr>
                    <td>Identification Number: </td>
                    <td><input type="text" name="ic" size="20"  value="<%=resultSet.getString("IC")%>" readonly></td>
                </tr>
                <tr>
                    <td>Full Name: </td>
                    <td><input type="text" name="name" size="20"  value="<%=resultSet.getString("NAME")%>"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pass" size="20"  value="<%=resultSet.getString("PASSWORD")%>"></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="pass" size="20"  value="<%=resultSet.getString("GENDER")%>"></td>
                </tr>
                <tr>
                    <td>Contact:</td>
                    <td><input type="text" name="contact" size="20"  value="<%=resultSet.getString("PHONE")%>"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20"  value="<%=resultSet.getString("ADDRESS")%>"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" size="20"  value="<%=resultSet.getString("EMAIL")%>"></td>
                </tr>
            </table>    
            <%
                }
            %>
            <p>
                <input type="reset" value="Clear"> 
                <input type="submit" value="Update">
            </p>        
        </form>   
    </center>
</body>
</html>
