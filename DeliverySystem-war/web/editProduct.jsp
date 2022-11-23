<%-- 
    Document   : editStaff
    Created on : Feb 23, 2022, 11:42:08 PM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String ID = request.getParameter("id");

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    try {
        Connection conn = DriverManager.getConnection(url, "app", "app");

        Statement statement = conn.createStatement();
        String sql = "select * from APP.PRODUCT  where id = '" + ID + "' ";
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
%>
<!DOCTYPE html>
<style>
    h1 {
        margin: 0;
        height: 100px;
        padding-left: 20px;
        font-size: 40px;
        line-height: 100px;
        background-color: #b9a795;
        text-align: left;
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

    .Category{
        width: 300px;
        height: 30px;
        border: 1px solid #ccc;
        border-radius: 5px;  

    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <h1> Update Page</h1>

</head>
<body>
<center>
    <jsp:include page="banner.jsp"/>
    <form method="post" action="editProductProcess.jsp">
        <input type="hidden" name="id" value="<%=resultSet.getString("ID")%>">
        <input type="text" name="id" value="<%=resultSet.getString("ID")%>" readonly>
        <TABLE>
            <tr>
                <td>ProductID </td>
                <td><input type="text" name="ID" value="<%=resultSet.getString("ID")%>"> </td>
            </tr>
            <tr>
                <td>Product Name:</td>
            <td><input type="text" name="Name" value="<%=resultSet.getString("NAME")%>"></td>
            </tr>
            <tr>
                <td>Category: </td>
                <td >
                    <select id = "Category" name = "Category" value="<%=resultSet.getString("Category")%>" >
                        <option>Food</option>    
                        <option>Drinks</option>
                        <option>Groceries</option>
                    </select>
                </td>
            </tr>
            <br>

            <tr>
               <td> Price: </td>
            <td><input type="text" name="Price" value="<%=resultSet.getString("Price")%>"></td>
            </tr>
            <tr>
               <td> Quantity: </td>
            <td><input type="text" name="Quantity" value="<%=resultSet.getString("Quantity")%>"></td>
            </tr>
            <tr>
            <td><input type="submit" value="submit"></td>
            </tr>
            </center>

            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            </body>
            </html>
