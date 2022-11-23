<%-- 
    Document   : staffInterface
    Created on : Feb 24, 2022, 6:24:19 PM
    Author     : alext
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

    String name = request.getParameter("name");
    String cat = request.getParameter("category");
    cat = null;
    name = null;

%>

<%    HttpSession s = request.getSession();
    Customer user_id = (Customer) s.getAttribute("login");
    s.setAttribute("customerProductList", user_id);

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;

    if (cat != null) {
        query = "select * from APP.PRODUCT where Category like '% " + cat + "%'";
    } else if (name != null) {
        query = "select * from APP.PRODUCT where Name like '% " + name + "%'";
    } else {
        query = "select * from APP.PRODUCT";
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
            td = tr[i].getElementsByTagName("td")[1];
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

    function searchCat() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchCat");
        filter = input.value.toUpperCase();
        table = document.getElementById("tableManaging");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
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
        margin-top: 25px;
        width: 100px!important; 
        text-align: center;
        right: 46%;
    }

    #searchCat, #searchName{
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
        cursor:pointer;
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
        padding: 20px; /* Add padding */
        padding-right: 20px; /* Add padding */
        font-size: 23px;
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Products</title>

    </head>

    <body>
        <jsp:include page="customerBanner.jsp"/>

        <br>
        <p>Search Category: 
            <input type="text" id="searchCat"  onkeyup="searchCat()" placeholder="Search for category.."></p>
        <p>Search item: 
            <input type="text" id="searchName"  onkeyup="searchName()" placeholder="Search for item.."></p>
        </br>

        <h2 align="center"><font><strong> List of Products</strong></font></h2>

        <div id = "tableManaging" align="center">             
            <TABLE>
                <tr>
                    <td style = "width: 90px"><b>ID</b></td>
                    <td style = "width: 25%"><b>Name</b></td>
                    <td style = "width: 90px"><b>Category</b></td>
                    <td style = "width: 90px"><b>Price</b></td>
                    <td style = "width: 90px"><b>Stock Available</b> </td>

                    <td style = "width: 90px"><b>Quantity</b> </td>
                </tr>        

                <% try {
                            while (resultSet.next()) {%>
                <form action="AddToCart" method="POST">      

                    <tr>
                        <td> <%= resultSet.getString(1)%></td>
                        <td> <%= resultSet.getString("NAME")%></td>
                        <td> <%= resultSet.getString("CATEGORY")%></td>
                        <td> <%= resultSet.getString("PRICE")%></td>
                        <td> <%= resultSet.getString("Quantity")%> </td>

                        <td>  <input type="text" name="quantity" > </td>
                        <td> <input id = "id" name="id" value="<%=resultSet.getString(1)%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "name" name="name" value="<%=resultSet.getString("NAME")%>" type="text" min="0" max ="20" hidden></td>
                        <td> <input id = "price" name="price" value="<%=resultSet.getDouble("PRICE")%>" type="text" min="0" max ="20" hidden></td>

                        <td><input type="submit" value="Add to Cart"></td>    
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </tr>
                </form>     

                <% }

                        conn.close();
                    } catch (Exception e) {
                    }
                %>

            </table>
            <form action="customerCartList.jsp" method="POST">      
        </div>
        <div class = "register" style = "text-align:center; justify-content:center; align-items:center">
            <a href="customerCartList.jsp" target="_blank" >Check Out</a>  &emsp;  &emsp;
        </div>
    </form>
</body>
</html>
