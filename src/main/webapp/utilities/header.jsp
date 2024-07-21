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
                <a class="logo-text" href="#" onclick="redirectToPage()">
                    <img class="img" src="/Symposium/immagini/logo.png">
                </a>
                <a class="logo-text2" href="#" onclick="redirectToPage()">
                    <img src="/Symposium/immagini/minilogo.png" width="100">
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
            <!-- Navbar Mobile Toggle Button -->
			    <div class="mobile-menu-toggle" onclick="toggleMobileMenu()">
			        ☰
			    </div>
                <% if(request.getSession().getAttribute("id") != null) { %> 
                    <a class="link" href="#" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)">
                        <img src="/Symposium/immagini/scheda.svg" width="100">
                    </a>
                    <a class="link" href="#" onclick="redirectToCarrello()">
                        <img src="/Symposium/immagini/cart.svg" width="100">
                    </a>
                    <a class="link" href="#" onclick="redirectToLogout()">
                        <img src="/Symposium/immagini/logout-2.svg" width="100">
                    </a>
                <% } else { %> 
                    <a href="login.jsp">
                        <img src="/Symposium/immagini/profilo.svg" width="100">
                    </a>
                <% } %> 
                <% if(request.getSession().getAttribute("admin") != null && (boolean)request.getSession().getAttribute("admin") == true) { %> 
                    <a class="link" href="/Symposium/redirectAdmin?page=Utenti">
                        <img src="/Symposium/immagini/admin.svg" width="100">
                    </a>
                <% } %>
            </div>
        </div>
    </div>
	<%Collection<Categoria> categorie = (Collection<Categoria>)request.getSession().getAttribute("categorie"); 
    	if(categorie == null){
    		response.sendRedirect("./categorie");
    		return;
    	}
    %>


	
    <div class="nav mobile-navbar">
        <a onclick="redirectToACatalogo()">Catalogo</a>
        <a onclick="redirectToRoll()">☆Scopri☆</a>
        <a onclick="redirectToAboutUs()">About Us</a>
    </div>
</header>

<script>
    function toggleMobileMenu() {
        const navbar = document.querySelector('.mobile-navbar');
        navbar.style.display = (navbar.style.display === 'flex') ? 'none' : 'flex';
    }
</script>
</body>
</html>