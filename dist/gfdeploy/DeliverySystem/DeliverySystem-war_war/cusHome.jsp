<%-- 
    Document   : customerOrderList
    Created on : Mar 2, 2022, 2:14:15 AM
    Author     : alext
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%    
    HttpSession s = request.getSession();
    Customer user_id = (Customer) s.getAttribute("login");
    s.setAttribute("customerOrderList", user_id);
    
    String userID = user_id.getId();
    String cus_name = user_id.getName();//cus name
    int cus_contact = user_id.getPhone();//cus contact

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;
    
    query = "select * from APP.CUSTOMERORDER WHERE cus_id = '" + userID+"'";
      
    resultSet = statement.executeQuery(query);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
    </head>
    <body>
        <jsp:include page="customerBanner.jsp"/>
        <a name = "Logout" href ="Logout"  style= "font-size: 20px;">Logout</a>

        <h2 align="center"><font><strong> List of Order</strong></font></h2>
        <div id ="tableManaging" align="center"> 
            <TABLE >
                <tr>
                    <td style = "width: 90px"><b>Order ID</b></td>
                    <td style = "width: 90px"><b>Customer ID </b></td>
                    <td style = "width: 90px"><b>Customer Name</b></td>
                    <td style = "width: 90px"><b>Customer Address</b></td>
                    <td style = "width: 90px"><b>Order Date</b></td>

                    <td style = "width: 90px"><b>Delivery Man ID</b></td>
                    <td style = "width: 90px"><b>Delivery Status</b></td>
                    <td style = "width: 90px"><b>Contact</b></td>
                    <td style = "width: 90px"><b>Order Price Total (RM)</b></td>
                    <td style = "width: 90px"><b>Feedback</b></td>           
                </tr>        

                <% while (resultSet.next()) {%>
                <tr>
                    <td> <%= resultSet.getString(1)%></td>
                    <td> <%= resultSet.getString("CUS_ID")%></td>
                    <td> <%= cus_name%></td>
                    <td> <%= resultSet.getString("ADDRESS")%></td>
                    <td> <%= resultSet.getString("ORDER_DATE")%></td>
                    <td> <%= resultSet.getString("DELIVERY_ID")%></td>
                    <td> <%= resultSet.getString("DELIVERY_STATUS")%></td>
                    <td> <%= cus_contact%></td>                    
                    <td> <%= resultSet.getString("PRICE")%></td>
                    <td> <%= resultSet.getString("FEEDBACK")%></td>
                    
             
                           <%  if (resultSet.getString("DELIVERY_STATUS").equals("Delivered")){
                           
                    %>
                     <td><a name = "feedback" href ="customerEditOrder.jsp?id=<%=resultSet.getInt("id")%>"  style= "font-size: 20px;">Feedback</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a name = "cancel" href ="DeleteOrder?id=<%=resultSet.getInt("id")%>"  style= "font-size: 20px;"hidden >Cancel Order</a>        
                    </td>     
                  <%   }else if (resultSet.getString("DELIVERY_STATUS").equals("Delivering")){  %>
                      <td> Wait a moment </td>
                    <% } else { %>
                        <td>
                        <a name = "feedback" href ="customerEditOrder.jsp?id=<%=resultSet.getInt("id")%>"  style= "font-size: 20px;">Edit Order</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a name = "cancel" href ="CustomerDeleteOrder?id=<%=resultSet.getInt("id")%>"  style= "font-size: 20px;" >Cancel Order</a>             
                        </td>     
                    <% } %>    
                         </td>
                        <% } %>

                </tr>

            </table>    </body>
</html>

