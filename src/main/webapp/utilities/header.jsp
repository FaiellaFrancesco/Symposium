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
   <div class="container-header">
        <div class="logo-container">
            <a class="logo">
                <h3 onclick="redirectToPage()" class="logo-text">Symposium</h3>
                <h3 onclick="redirectToPage()" class="logo-text2">SS</h3>
            </a>
        </div>
        <div class="search-container">
            <form action="" method="post" onsubmit="ricerca(event)" class="search-form">
                <input class="search-bar" type="text" name="pattern" id="searchbar" placeholder="Cerca...">
                <button class="search-button" id="search" type="submit">Cerca</button>
            </form>
            <div id="suggestions" class="suggestions"></div>
        </div>
        <div class="account-container">
            <h2>
                <% if(request.getSession().getAttribute("id") != null) { %> 
                    <a href="logout" class="link">LOGOUT</a> &nbsp; 
                    <a class="link" href="carrello.jsp">CART</a> &nbsp;
                <% } else { %> 
                    <a href="login.jsp" class="link">ACCEDI</a> 
                <% } %> 
                &nbsp;
                <% if(request.getSession().getAttribute("admin") != null && (boolean)request.getSession().getAttribute("admin") == true) { %> 
                    <a class="link" href="./redirectAdmin?page=adminFunctions"> ADMIN </a> &nbsp;
                <% } %>
            </h2>
        </div>
    </div>
    </div>


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
    <a onclick=>About Us</a>
</nav>
</header>


</body>
</html>