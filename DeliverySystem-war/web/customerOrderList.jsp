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

    String cat = request.getParameter("category");
    cat = null;

%>

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
    
     if (cat != null) {
        query = "select * from APP.CUSTOMERORDER where ID like '% " + cat + "%' WHERE CUS_ID = '" + userID+"'";
    }  else {
        query = "select * from APP.CUSTOMERORDER WHERE CUS_ID = '" + userID+"'";
    }
      
    resultSet = statement.executeQuery(query);
%>


<script>
    function searchName() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchName");
        filter = input.value.toUpperCase();
        table = document.getElementById("tableManaging");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

</script>

<style>

    .register a:link, .register a:visited   {
        background-color: #ADD8E6; /* Green background */
        border: 1px solid blue; /* Green border */
        color: white; /* White text */
        padding: 30px 30px; /* Some padding */
        cursor: pointer; /* Pointer/hand icon */
        display: inline; /* Make the buttons appear below each other */
        margin: 0 auto;
        font-size: 100%;
        width: 100px!important; 
       text-align: center;
        right: 46%;
        position: absolute;
    
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
        <title>Order Page</title>
    </head>
    <body>
        <jsp:include page="customerBanner.jsp"/>
        <br>
        <p>Search Order: 
            <input type="text" id="searchName"  onkeyup="searchName()" placeholder="Search for Order.."></p>
        </br>
        <h2 align="center"><font><strong> List of Order</strong></font></h2>
        <div id = "tableManaging" align="center">             
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
