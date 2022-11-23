<%-- 
    Document   : addOrder
    Created on : Feb 26, 2022, 5:40:24 PM
    Author     : alext
--%>

<%@page import="model.ManagingStaff"%>
<%@page import="model.CustomerOrder"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession s = request.getSession();
    ManagingStaff user_id = (ManagingStaff) s.getAttribute("login");
    s.setAttribute("managingOrderList", user_id);

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;

    query = "select * from APP.CUSTOMERORDER";

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
        <title>List of Order</title>
    </head>

    <body>
    <center>
        <form action = "managingStaffHome.jsp" method="POST">
            <jsp:include page="banner.jsp"/>

            <h2 align="center"><font><strong> List of Order</strong></font></h2>
            <div id = "tableManaging" align="center" style="height:400px;width:100%; ">             
                <TABLE  >
                    <tr>
                        <td><b>Order ID</b></td>
                        <td><b>Customer ID</b></td>
                        <td><b>Address</b></td>
                        <td><b>Delivery ID</b></td>
                        <td><b>Order Date</b></td>
                        <td><b>Total Price (RM)</b></td>
                        <td><b>Delivery Status</b></td>  
                        <td><b>Feedback</b></td>           
                    </tr>        

                    <% while (resultSet.next()) {%>
                    <tr>
                        <td> <%= resultSet.getInt(1)%></td>
                        <td> <%= resultSet.getString("CUS_ID")%></td>
                        <td> <%= resultSet.getString("ADDRESS")%></td>
                        <td> <%= resultSet.getString("DELIVERY_ID")%></td>
                        <td> <%= resultSet.getString("ORDER_DATE")%></td>
                        <td> <%= resultSet.getDouble("PRICE")%></td>
                        <td> <%= resultSet.getString("DELIVERY_STATUS")%></td>
                        <td> <%= resultSet.getString("FEEDBACK")%></td>
                        <td> <input id = "id" name="id" value="<%=resultSet.getInt("id")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "cus_ID" name="cus_ID" value="<%=resultSet.getString("cus_ID")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "address" name="address" value="<%=resultSet.getString("address")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "delivery_status" name="delivery_status" value="<%=resultSet.getString("delivery_status")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "order_date" name="order_date" value="<%=resultSet.getString("order_date")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "price_order" name="price_order" value="<%= resultSet.getDouble("PRICE")%>"  hidden></td>

                        <td> <input id = "delivery_id" name="delivery_id" value="<%=resultSet.getString("delivery_id")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "feedback" name="feedback" value="<%=resultSet.getString("feedback")%>" type="text" min="0" max ="20" hidden></td>

                        <td>        
                            <a href="managingEditOrder.jsp?id=<%=resultSet.getInt("id")%>" target="_blank" >Edit</a>  &emsp;  &emsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="ManagingDeleteOrder?id=<%=resultSet.getInt("id")%>&price_order=<%=resultSet.getString("PRICE")%>" target="_blank" >Delete</a>  
                        </td>
                    </tr>
                    <% }%>
                <p><input type="submit" value="Done"></p>        

                    </center>
                </table>

        </form>
    </body>
</html>
