<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("prodotti");
	if(products == null) {
		response.sendRedirect("./catalogo");
		return;
	}
	HttpSession sessione = request.getSession();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="utilities/css/home.css">
<script src="/Symposium/utilities/js/ajax.js"></script>
<script src="/Symposium/utilities/js/redirect.js"></script>
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>


<script type="text/javascript">
let lastClickedLink = null;

document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.filtro');

    links.forEach(link => {
        // Aggiunge un secondo evento click per cambiare colore
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Previene il comportamento predefinito del link

            // Rimuove la classe 'active' dal link precedentemente cliccato, se presente
            if (lastClickedLink && lastClickedLink !== link) {
                lastClickedLink.classList.remove('active');
            }

            // Alterna la classe 'active' sul link attualmente cliccato
            link.classList.toggle('active');

            // Aggiorna il riferimento al link attualmente cliccato
            lastClickedLink = link.classList.contains('active') ? link : null;
        });
    });
});


function toggleColor(link) {
    link.classList.toggle('active');
}


</script>
<body>

<span class="spazio"></span>

<div class="reset">
	<a class="" onclick="redirectToACatalogo()">Mostra tutto</a>
	</div>
	<span class="spazio"></span>
	<!-- Campi di filtraggio -->
	<div class="filter">
	    	
	    	<a class="filtro" onclick="filtro('Vini Rossi')">Vini Rossi</a>
	    	<a class="filtro" onclick="filtro('Vini Bianchi')">Vini Bianchi</a>
	    	<a class="filtro" onclick="filtro('Vini Rosati')">Vini Rosati</a>
	    	<a class="filtro" onclick="filtro('Champagne')">Champagne</a>
	    	<a class="filtro" onclick="filtro('Spumanti')">Spumanti</a>
	    	<a class="filtro" onclick="filtro('Altro')">Altri prodotti</a>
	</div>
	
	<span class="spazio"></span>
	

 <% if (products != null && products.size() != 0) { %>
<div id=container>
<div class="grid-container">
  <%
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
      Prodotto bean = (Prodotto) it.next();
  %>
  <div class="product-container" onclick="redirectToProduct(<%= bean.getId() %>)">
    <img class="product-image" src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
    <h3 class="nome"><%= bean.getNome() %></h3>
    <div class="details">
      <p class="price"><%= String.format("%.2f", bean.getPrezzo()) %>€ </p>
     
      <a class="go-to-cart"  onclick=href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1"><img class="go-to-cart-btn"src="/Symposium/immagini/cart.svg" ></a>
    </div>
  </div>
  <% } %>
  </div>
</div>
      <% } else { %>
      <div class="error-message">
 		 <p>Nessun prodotto disponibile al momento.</p>
	</div>
	<% }  %>
	<span class="spazio"></span>
	<span class="spazio"></span>
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
