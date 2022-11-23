<%-- 
    Document   : deliveryStaffHome
    Created on : Mar 2, 2022, 4:22:28 PM
    Author     : alext
--%>
<%@page import="model.DeliveryStaff"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    a {
        text-decoration: none;
    }
    table, tr, td {
        padding: 10px;
    }
    .editbtn, .logoutbtn, .paymentbtn {
        position: absolute;
        padding: 20px;
        background-color: #ADD8E6; 
        color: white; 
        border: 1px solid blue;
        border-radius: 5px;
    }
    .editbtn {
        right: 20%;
        width: 100px;
    }
    .logoutbtn {
        position: absolute;
        right: 10%;
        width: 70px;
    }

    .editbtn:hover, .logoutbtn:hover, .paymentbtn:hover {
        cursor: pointer;
        background-color: #6a6f8c;
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

    query = "select * from APP.CUSTOMERORDER WHERE DELIVERY_ID = ' " + userID + "' ";

    resultSet = statement.executeQuery(query);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Staff Home</title>
    </head>

    <body>
    <center>
        <div>
            <a href="deliveryEditProfile.jsp" target="_blank" class="editbtn">Edit Profile</a>  &emsp;  &emsp;
            <a href="Logout" target="_blank" class="logoutbtn">Log Out</a>  &emsp;  &emsp;
        </div>
        <h2 align="center"><font><strong> List of Order</strong></font></h2>
        <div id = "tableManaging" align="center">             
            <table>

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
                <form action = "DeliveryPayment" method="POST">

                    <td> <input name="id" value="<%=resultSet.getInt("id")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="cus_ID" value="<%=resultSet.getString("cus_ID")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="address" value="<%=resultSet.getString("address")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="delivery_status" value="<%=resultSet.getString("delivery_status")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="order_date" value="<%=resultSet.getString("order_date")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="price_order" value="<%= resultSet.getDouble("PRICE")%>"  hidden></td>
                    <td> <input name="delivery_id" value="<%=resultSet.getString("delivery_id")%>" type="text" min="0" max ="20" hidden></td>
                    <td> <input name="feedback" value="<%=resultSet.getString("feedback")%>" type="text" min="0" max ="20" hidden></td>
                    <td><input type="submit" value = " Payment and Receipt">   
                    </td>    
                    </tr>
                </form>
                <%
                    }
                %>
            </table>
        </div>
    </center>

</body>
</html>
