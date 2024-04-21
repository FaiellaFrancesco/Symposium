<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <style>
        nav {
            background-color: #FFFF;
            color: #000;
            padding: 5px;
            display: flex; /* Utilizza flexbox per allineare i link */
            justify-content: space-between; /* Distribuisci gli elementi uniformemente */
            align-items: center; /* Allinea verticalmente al centro */
           
            border-bottom: 1px solid black;
            font-size: 20px;
             /* font-weight: bold;  */
           font-family: 'Cormorant Garamond', serif;
        }

        nav a {
            color: #000;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            font-family: 'Courier New', monospace ;
            font-size: 20px;
        }

        nav a:hover {
            color: #990E3C;
            
        }
    </style>
</head>
<body>

<nav>
    <a href="aa.html">Vini</a>
    <a href="aa.html">Champagne</a>
    <a href="aa.html">Produttori</a>
</nav>

</body>
</html>