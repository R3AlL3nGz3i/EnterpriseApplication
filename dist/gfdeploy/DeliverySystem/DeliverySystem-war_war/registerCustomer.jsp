<%-- 
    Document   : registerCustomer
    Created on : Mar 1, 2022, 12:54:30 AM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
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
</head>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
    </head>
    <body align="center" >
        <center>
        <form action="RegisterCustomer" method="POST" >             
            <table >
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="id" size="20"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pass" size="20"></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" min="0" size="20"></td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td> <input type="radio" id="Male" name="Gender" value="HTML">
                        <label for="Male">Male</label>
                        <input type="radio" id="Female" name="Gender" value="HTML">
                        <label for="Female">Female</label>
                        <input type="radio" id="Other" name="Gender" value="HTML">
                        <label for="Other">Other</label>
                    </td>
                </tr>
                    <tr>
                    <td>IC:</td>
                    <td><input type="text" name="ic" min="0" size="20"></td>
                </tr>
                <tr>
                    <td>Contact: </td>
                    <td><input type="text" name="contact" min="0" size="20"></td>
                <br>
                <br>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" min="0" size="20"></td>
                </tr>
            </table>

            <p><input type="reset"value="Clear">  &nbsp &nbsp &nbsp
                <input type="submit" value="Register"></p>        

        </form>   
        </center>

    </body>
</html>
