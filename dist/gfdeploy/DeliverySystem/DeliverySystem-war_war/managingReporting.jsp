<%-- 
    Document   : managingReporting
    Created on : Mar 4, 2022, 3:36:06 AM
    Author     : alext
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DeliveryStaff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%    HttpSession s = request.getSession();
    DeliveryStaff user_id = (DeliveryStaff) s.getAttribute("login");

    String userID = user_id.getId();
    String cus_name = user_id.getName();//cus name
    int cus_contact = user_id.getPhone();//cus contact

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;

    query = "select * from APP.CUSTOMERORDER WHERE delivery_id = '" + userID + "'";

    resultSet = statement.executeQuery(query);
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
    .register a:hover, .register a:active {
        background-color: #add8e6;
        cursor:auto
    }

    .tableManaging {
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse; /* Collapse borders */
        background-color: #99ccff; 
        width: 100%; /* Full-width */

        overflow:scroll;
    }
    p>input {
        font-size: 23px;
    }

    .tableManaging th, #tableManaging td {
        text-align: left; /* Left-align text */
        padding: 12px; /* Add padding */
    }

    .tableManaging tr {
        /* Add a bottom border to all table rows */
        border-bottom: 1px solid #ddd;
    }

    .tableManaging tr.header{
        /* Add a grey background color to the table header and on hover */
        background-color: #F1C40F;
    }
    #tableManaging tr:hover {

    }

</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporting Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
