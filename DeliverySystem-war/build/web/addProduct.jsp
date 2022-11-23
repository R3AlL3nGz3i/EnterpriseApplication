<%-- 
    Document   : addProduct
    Created on : Feb 26, 2022, 5:40:17 PM
    Author     : alext
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = request.getParameter("id");
    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    try {
        Connection conn = DriverManager.getConnection(url, "app", "app");

        Statement statement = conn.createStatement();
        String sql = "select * from APP.PRODUCT  where id = '" + id + "' ";
        ResultSet resultSet = statement.executeQuery(sql);

    } catch (Exception e) {
    }


%>



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
        <title>Add Product</title>
    </head>
    <body>
        <center>
        <jsp:include page="banner.jsp"/>

        <form action="AddProduct" method="POST" >             
            <table>
                <tr>
                    <td>Product ID :</td>
                    <td><input type="text" name="id" size="20"></td>
                </tr>
                <tr>
                    <td>Product Name: </td>
                    <td><input type="text" name="name" size="20"></td>
                </tr>
                <tr>
                    <td>Category: </td>
                    <td >
                        <select id = "Category" name = "Category" >
                            <option>Food</option>    
                            <option>Drinks</option>
                            <option>Groceries</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price" size="20"></td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td><input type="text" name="quantity" min="0" size="20"></td>
                </tr>
            </table>

            <p><input type="reset"value="Clear">  &nbsp &nbsp &nbsp
                <input type="submit" value="Add"></p>        
        </form>   
        </center>
    </body>
</html>
