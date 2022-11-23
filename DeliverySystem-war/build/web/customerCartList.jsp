<%-- 
    Document   : addToCart1
    Created on : Feb 28, 2022, 1:44:05 AM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    double total = 0;
    double total_price = 0;
%>

<%    
    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;

    query = "select * from APP.CART";

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
    .p:hover, .p:active {
        background-color: #add8e6;
        cursor:auto
    }

    .tableCart {
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse; /* Collapse borders */
        background-color: #99ccff; 
        width: 100%; /* Full-width */

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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
        <jsp:include page="customerBanner.jsp"/>

        <h2 align="center" ><font><strong> Your Cart</strong></font></h2>
        <form action="AddOrder" method="POST" >             

            <div id = "tableCart" align="center" style="height:400px;width:100%; ">             
                <TABLE>
                    <tr>
                        <td><b>Product ID</b></td>
                        <td><b>Price</b></td>
                        <td><b>Quantity</b></td>
                        <td><b>Item Grand Price</b></td>
                    </tr>        
                    <% while (resultSet.next()) {%>
                    <tr>

                        <td ><%= resultSet.getString("product_id")%></td>
                        <td> <%= resultSet.getDouble("price")%></td>
                        <td><%= resultSet.getInt("quantity")%></td>
                        <td><%= resultSet.getDouble("total_item")%></td>
                        <td> <a href ="deleteCustomerCart?id=<%=resultSet.getLong("id")%>"  style= "font-size: 20px;">Delete </a>  
                        <td> <input id = "quantity" name="quantity" value="<%=resultSet.getInt("quantity")%>" type="text" min="0" max ="20" hidden></td>

                        </td>         
                    </tr>

                    <%{
                            total = resultSet.getDouble("total_item");
                            total_price += total;
                            
                        }%>

                    <% }%>
                    </TABLE>

                <td><b>Total Price (RM):</b></td>
                <input id = "total_price" name="total_price" value="<%=total_price%>" type="text" min="0" max ="20">

                <p><button type="button" name="back" onclick="history.back()">back</button>  &nbsp &nbsp &nbsp
                    <input type="submit" value="Checkout"></p>        

            </div>
        </form>

    </body>
</html>
