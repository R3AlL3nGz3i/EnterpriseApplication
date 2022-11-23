<%-- 
    Document   : managingEditOrder
    Created on : Mar 2, 2022, 4:36:51 PM
    Author     : alext
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    int ID = Integer.parseInt(request.getParameter("id"));

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    try {
        Connection conn = DriverManager.getConnection(url, "app", "app");

        Statement statement = conn.createStatement();
        String sql = "select * from APP.CUSTOMERORDER  where id = " + ID;
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
%>


<style>   
    h1 {
        margin: 0;
        height: 100px;
        padding-left: 20px;
        font-size: 40px;
        line-height: 100px;
        background-color: #b9a795;
        text-align: center;
    }
    table.scrolldown {
        width: 100%;
        /* border-collapse: collapse; */
        border-spacing: 0;
        border: 2px solid black;
    }

    /* To display the block as level element */
    table.scrolldown tbody, table.scrolldown thead {
        display: block;
    } 

    table, tr, td {
        margin: 10px;
        padding: 10px;
    }
    td {
        font-size: 23px;
    }
    input[type=text]{
        width: 300px;
        height: 30px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    p>input {
        width: 20%;
        height: 40px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 20px;
        background-color: #ffffcc;
        cursor: pointer;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Order Managing</title>
    </head>

    <body>
        <jsp:include page="banner.jsp"/>
        <form action="EditOrder" method="POST">             
            <center>
                <table>
                    <tr>
                        <td>Order ID</td>
                        <td readonly><input type="text" name="order_id" size="20"  value="<%=resultSet.getInt("ID")%>" > </td>
                    </tr>
                    <tr>
                        <td>Customer ID:</td>
                        <td><input type="text" name="cus_ID" size="20" value="<%=resultSet.getString("CUS_ID")%> " readonly></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" size="20" value="<%=resultSet.getString("ADDRESS")%>" ></td>
                    </tr>
                    <tr>
                        <td>Total Order Price (RM):</td>
                        <td><input type="text" name="price" min="0" size="20" value="<%=resultSet.getDouble("PRICE")%> " readonly> </td>
                    </tr>

                    <tr>
                        <td>Delivery status:</td>
                        <td> <input type="radio"  name="order_status" value="Pending">
                            <label>Pending</label>
                            <input type="radio" name="order_status" value="Delivering">
                            <label>Delivering</label>
                            <input type="radio" name="order_status" value="Delivered">
                            <label>Delivered</label>
                        </td>
                    </tr>
                    <tr>
                        <td>Order Date: </td>
                        <td><input type="text" name="order_date" min="0" size="20" value="<%=resultSet.getString("ORDER_DATE")%>" readonly></td>
                    </tr>

                    <tr>
                        <td>Delivery ID: </td>
                        <td><input type="text" name="deliver_ID" size="20" value="<%=resultSet.getString("DELIVERY_ID")%>"></td>
                    </tr>
                    <tr>
                        <td>Feedback: </td>
                        <td><input type="text" name="feedback" min="0" size="20" value="<%=resultSet.getString("FEEDBACK")%>" readonly></td>
                    </tr>

                </table>
                <% }%>

                <p><input type="reset"value="Clear">  &nbsp &nbsp &nbsp
                    <input type="submit" value="Update"></p>        
            </center>

        </form>   

        <%

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </body>
</html>
