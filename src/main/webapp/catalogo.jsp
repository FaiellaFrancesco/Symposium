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

<body>
	
	<!-- Campi di filtraggio -->
	<div class="filter">
	    	<a onclick="redirectToACatalogo()">Mostra tutto</a>
	    	<a onclick="filtro('Vini Rossi')">Vini Rossi</a>
	    	<a onclick="filtro('Vini Bianchi')">Vini Bianchi</a>
	    	<a onclick="filtro('Vini Rosati')">Vini Rosati</a>
	    	<a onclick="filtro('Champagne')">Champagne</a>
	    	<a onclick="filtro('Spumanti')">Spumanti</a>
	    	<a onclick="filtro('Altro')">Altri prodotti</a>
	</div>

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
      <p class="price"><%= String.format(Locale.US, "%.2f", bean.getPrezzo()) %>€ </p>
      <a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1" class="carrello-button">Carrello</a>
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
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
