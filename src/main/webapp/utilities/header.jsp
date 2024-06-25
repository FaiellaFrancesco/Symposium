<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*" %>
  <%@ page import="model.beans.Categoria" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="utilities/css/header.css">
<script src="utilities/js/ajax.js"></script>
<script src="utilities/js/redirect.js"></script>

<!--  <link rel="stylesheet" href="css/navbar.css"> -->
</head>

<body>

<header>
<div class="container-h">


 <table width=100%>
        <tr>
            <td align="left"> <!-- qui ci va il logo-->
                <a class="logo"> <h3 onclick="redirectToPage()" style="font-family: 'Brush Script MT', cursive; font-size: 50px;"> &nbsp; Symposium</h3></a>
            </td>
            <td align="center"> <!-- Barra di ricerca -->
                <form action="" method="post" onsubmit="ricerca(event)">
                    <input class="search-bar" type="text" name="pattern" id="searchbar" placeholder="Cerca...">
                    <button class="search-button"id="search" type="submit">Cerca</button>
                </form>
                <div id="suggestions" class="suggestions" align="center"></div>
            </td>
            <td align="right"> <!-- img di cart e accesso-->
                <span><h2><% if(request.getSession().getAttribute("id") !=null) {%> <a href="logout" class="link">LOGOUT</a> &nbsp; <a class="link" href="carrello.jsp">CART </a>&nbsp;<%} else { %> <a href="login.jsp" class="link">ACCEDI</a><%} %> &nbsp;</span> <p> <% if(request.getSession().getAttribute("admin") !=null && (boolean)request.getSession().getAttribute("admin") ==true) {%> <a class="link" href="./redirectAdmin?page=adminFunctions"> ADMIN </a> &nbsp;<%} %></h2>
                 
            </td>
        </tr>
    </table>
    
    <nav class="navbar">
    <%Collection<Categoria> categorie = (Collection<Categoria>)request.getSession().getAttribute("categorie"); 
    	if(categorie == null){
    		response.sendRedirect("./categorie");
    		return;
    	}else{
    for(Categoria categoria : categorie){
    %>
    <a onclick="filtro('<%= categoria.getNome() %>')"><%= categoria.getNome() %></a>
    <%} }%>
    <a onclick=>Altri Prodotti(da fare)</a>
    <a href="aa.html">About Us</a>
</nav>
</div>
</header>


</body>
</html>