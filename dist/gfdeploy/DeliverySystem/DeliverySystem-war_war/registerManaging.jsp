<%-- 
    Document   : register
    Created on : Feb 21, 2022, 7:04:41 PM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");
%>

<%
    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from APP.MANAGINGSTAFF");
%>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Managing Staff</title>
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
        </style>
    </head>

    <body>
    <center>
        <h1>Register Page</h1>
        <jsp:include page="banner.jsp"/>
        <form action="Register" method="POST">             
            <table>
                <tr>
                    <td>StaffID</td>
                    <td><input type="text" name="id" size="20"></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="name" size="20"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pass" size="20"></td>
                </tr>
                <tr>
                    <td>IC:</td>
                    <td><input type="text" name="ic" min="0" size="20"></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="gender" min="0" size="20"></td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" min="0" size="20" ></td>
                </tr>
                <select id = "position" name = "position" >
                    <hidden><option>ManagingStaff</option>
                    </select>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" min="0" size="20"></td>
                </tr>

            </table>
            <p>            <input type="reset"value="Clear">  &nbsp &nbsp &nbsp
                <input type="submit" value="Register"></p>
        </form>   
    </center>
</body>
</html>
