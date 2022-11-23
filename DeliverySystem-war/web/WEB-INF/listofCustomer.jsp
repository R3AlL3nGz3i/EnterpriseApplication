<%-- 
    Document   : staffInterface
    Created on : Feb 24, 2022, 6:24:19 PM
    Author     : alext
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% 
    String id = request.getParameter("id");
%>

<%    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    String query = null;
    ResultSet resultSet = null;

    if (id != null) {
        query = "select * from APP.CUSTOMER where ID like '% " + id + "%'";
    } else {
        query = "select * from APP.CUSTOMER";
    }
    resultSet = statement.executeQuery(query);



%>
<script>
    function myFunction() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("search");
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Managing Staff</title>

    </head>

    <body>
        <jsp:include page="banner.jsp"/>

        <p>Search by ID: 
            <input type="text" id="search"  onkeyup="myFunction()" placeholder="Search for id.."></p>

        <h2 align="center"><font><strong> List of Managing Staff</strong></font></h2>
        <div id = "tableManaging" align="center" style="height:400px; ">             
            <TABLE >
                <tr>
                    <td style = "width: 90px"><b>id</b></td>
                    <td style = "width: 90px"><b>Name</b></td>
                    <td style = "width: 90px"><b>Password</b></td>
                    <td style = "width: 90px"><b>IC</b></td>
                    <td style = "width: 90px"><b>Gender</b></td>
                    <td style = "width: 90px"><b>Contact</b></td>
                    <td style = "width: 90px"><b>Address</b></td>
                    <td style = "width: 90px"><b>Email</b></td>           
                </tr>        

                <% while (resultSet.next()) {%>
                <tr>
                    <td> <%= resultSet.getString(1)%></td>
                    <td> <%= resultSet.getString("NAME")%></td>
                    <td> <%= resultSet.getString("PASSWORD")%></td>
                    <td> <%= resultSet.getString("IC")%></td>
                    <td> <%= resultSet.getString("GENDER")%></td>
                    <td> <%= resultSet.getInt("PHONE")%></td>
                    <td> <%= resultSet.getString("ADDRESS")%></td>
                    <td> <%= resultSet.getString("EMAIL")%></td>

                    <td><a href ="editCustomer.jsp?id=<%=resultSet.getString("id")%>"  style= "font-size: 20px;">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href ="deleteCustomer.jsp?id=<%=resultSet.getString("id")%>"  style= "font-size: 20px;">Delete </a>             
                        <% }%>
                </tr>

            </table>

        </div>
        <div class = "register" style = "text-align:center; justify-content:center; align-items:center">

            <a href="registerManaging.jsp" target="_blank"  > Register New Account</a>  &emsp;  &emsp;
        </div>
    </body>
</html>
