<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="css/header.css">
<!--  <link rel="stylesheet" href="css/navbar.css"> -->
</head>

<body>
  <script>
  
  function redirectToPage() {
    window.location.href = 'home.jsp' ;
  }
</script>

<header>
<div class="container-h">


 <table width=100%>
        <tr>
            <td align="left"> <!-- qui ci va il logo-->
                <a class="logo"> <h3 onclick="redirectToPage()" style="font-family: 'Brush Script MT', cursive; font-size: 50px;"> &nbsp; Symposium</h3></a>
            </td>
            <td align="center"> <!-- Barra di ricerca -->
                <form action="" method="get">
                    <input class="search-bar"type="text" name="q" placeholder="Cerca...">
                    <button class="search-button"id="search" type="submit">Cerca</button>
                </form>
            </td>
            <td align="right"> <!-- img di cart e accesso-->
                <span><h2><a href="login.jsp" class="link">ACCEDI</a>  &nbsp; <a class="link" href="carrello.jsp">CART </a>&nbsp; </h2></span>
                 
            </td>
        </tr>
    </table>
    
    <nav class="navbar">
    <a href="aa.html">Vini</a>
    <a href="aa.html">Spumante</a>
    <a href="aa.html">Champagne</a>
    <a href="aa.html">Altri Prodotti</a>
    <a href="aa.html">About Us</a>
</nav>
</div>
</header>


</body>
</html>