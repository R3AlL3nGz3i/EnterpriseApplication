<%-- 
    Document   : viewStaff
    Created on : Feb 25, 2022, 1:49:55 AM
    Author     : alext
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>


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

    <head>
    </head>

    <body>
        <%@ include file="banner.jsp" %>

    <center> 
        <div class = "staff" style = "text-align:center; justify-content:center; align-items:center">
            <a href="listofManaging.jsp" target="_blank" >Managing Staff</a>  &emsp;  &emsp;
            <a href="listofDelivery.jsp" target="_blank" >Delivery Staff</a>
        </div>

    </center>
</body>
</html>
