<%-- 
    Document   : managingStaffHome
    Created on : Mar 1, 2022, 4:08:46 PM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <style>
        .staff {
            margin-top: 15%;
        }

        .staff a:link, .staff a:visited  {
            background-color: #ADD8E6; /* Green background */
            border: 1px solid blue; /* Green border */
            color: white; /* White text */
            padding: 60px 60px; /* Some padding */
            cursor: pointer; /* Pointer/hand icon */
            width: 100%; /* Set a width if needed */
            display: inline; /* Make the buttons appear below each other */
            margin: 0 auto;
            font-size: 300%;

        }


        /* Add a background color on hover */
        a:hover, a:active {
            background-color: #add8e6;
            cursor:auto
        }

        .topbackground a{
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            padding: 30px;
            width : 100%          
        }


    </style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Managing Home</title>
    </head>
        <jsp:include page="banner.jsp"/>
        <div>
            <a href="managingEditProfile.jsp" target="_blank" class="editbtn">Edit Profile</a>  &emsp;  &emsp;
            <a href="Logout" target="_blank" class="logoutbtn">Log Out</a>  &emsp;  &emsp;
        </div>
            <center> 

        <div class = "staff" style = "text-align:center; justify-content:center; align-items:center">
            <a href="listofProduct.jsp" target="_blank" >Products</a>  &emsp;  &emsp;
            <a href="listofCustomer.jsp" target="_blank" >Customer</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <a href="viewStaffHome.jsp" target="_blank" >Staff</a>  &emsp;  &emsp;  &emsp;  &emsp;
            <a href="managingOrderList.jsp" target="_blank" >View Order and Feedback</a> &emsp;  &emsp;  &emsp;  &emsp;

        </div>
    </center>
</html>
