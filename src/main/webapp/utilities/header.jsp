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
<link rel="stylesheet" href="/Symposium/utilities/css/header.css">
<script src="/Symposium/utilities/js/ajax.js"></script>
<script src="/Symposium/utilities/js/redirect.js"></script>

</head>

<body>

<header>
<div class="container-h">
   <div class="container-header">
        <div class="logo-container">
            <a class="logo">
               <!--   <h3 onclick="redirectToPage()" class="logo-text">Symposium</h3>
                <h3 onclick="redirectToPage()" class="logo-text2">SS</h3>--> 
                <a class="logo-text" href="#" onclick="redirectToPage()"><img src="/Symposium/immagini/logo.png" width=200></a>
                <a class="logo-text2" href="#" onclick="redirectToPage()"><img src="/Symposium/immagini/minilogo.png" width=100></a>
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
           
                <% if(request.getSession().getAttribute("id") != null) { %> 
                   <!--   <a class="link" href="#" onclick="redirectToLogout()">L</a> <!--  &nbsp;--> 
                   <!--  <a class="link" href="#" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)">AU</a> &nbsp; -->
                   <!--  <a class="link" href="#" onclick="redirectToCarrello()">C</a> &nbsp;--> 
                    <a class="link" href="#" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)"><img src="/Symposium/immagini/scheda.svg" width=100></a>
                    <a class="link" href="#" onclick="redirectToCarrello()"><img src="/Symposium/immagini/cart.svg" width=100></a>
                    <a class="link" href="#" onclick="redirectToLogout()"><img src="/Symposium/immagini/logout-2.svg" width=100></a>
                    
                <% } else { %> 
                  <!--   <a href="login.jsp" class="link">ACCEDI</a>  -->
                    <a href="login.jsp"><img src="/Symposium/immagini/profilo.svg" width=100></a>
            
              
                <% } %> 
              <!--   &nbsp;--> 
                <% if(request.getSession().getAttribute("admin") != null && (boolean)request.getSession().getAttribute("admin") == true) { %> 
                    <!--  <a class="link" href="/Symposium/redirectAdmin?page=adminFunctions"> ADMIN </a> &nbsp; -->
                     <a class="link" href="/Symposium/redirectAdmin?page=Utenti" ><img src="/Symposium/immagini/admin.svg" width=100></a>
                <% } %>
           
        </div>
    </div>
    </div>
    <div class="minimo">
    	<div class="alto-sx">
    	 <a class="logo">
                <a class="logo-text" href="#" onclick="redirectToPage()"><img src="/Symposium/immagini/logo.png" width=200></a>
                 <a class="logo-text2" href="#" onclick="redirectToPage()"><img src="/Symposium/immagini/minilogo.png" width=100></a>
                </div>
                 <% if(request.getSession().getAttribute("id") != null) { %> 
                 <div class="icon">
    	  <a class="link" href="#" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)"><img src="/Symposium/immagini/scheda.svg" width=100></a>
                    <a class="link" href="#" onclick="redirectToCarrello()"><img src="/Symposium/immagini/cart.svg" width=100></a>
                    <a class="link" href="#" onclick="redirectToLogout()"><img src="/Symposium/immagini/logout-2.svg" width=100></a>
                    
                <% } else { %> 
                  
                    <a href="login.jsp"><img src="/Symposium/immagini/profilo.svg" width=100></a>
                     <% } %>
                    <% if(request.getSession().getAttribute("admin") != null && (boolean)request.getSession().getAttribute("admin") == true) { %> 
                    
                     <a class="link" href="/Symposium/redirectAdmin?page=adminFunctions" ><img src="/Symposium/immagini/admin.svg" width=100></a>
                <% } %>
    	</div>
               
    	</div>
    	  	
    	
    	<div class="basso">
    	 <div class="search-container">
            <form action="" method="post" onsubmit="ricerca(event)" class="search-form">
                <input class="search-bar" type="text" name="pattern" id="searchbar" placeholder="Cerca...">
                <button class="search-button" id="search" type="submit">Cerca</button>
            </form>
            </div>
            <div id="suggestions" class="suggestions"></div>
    	</div>
    	
	<%Collection<Categoria> categorie = (Collection<Categoria>)request.getSession().getAttribute("categorie"); 
    	if(categorie == null){
    		response.sendRedirect("./categorie");
    		return;
    	}
    %>

    <nav class="navbar">
    
	    <a onclick="redirectToACatalogo()">Catalogo</a>
	    <a onclick="redirectToRoll()">☆Scopri☆</a>
	    <a onclick="redirectToAboutUs()">About Us</a>
  
	</nav>
</header>


</body>
</html>