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
            background-color: #990E3C;
            color: #000;
            padding: 10px;
            display: flex; /* Utilizza flexbox per allineare i link */
            justify-content: space-between; /* Distribuisci gli elementi uniformemente */
            align-items: center; /* Allinea verticalmente al centro */
            border-top: 1px solid #CCC; /* Linea superiore */
            font-size: 20px;
             /* font-weight: bold;  */
           font-family: 'Cormorant Garamond', serif;
        }

        nav a {
            color: #000;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
        }

        nav a:hover {
            background-color: #441D2A;
            border-radius: 25px;
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