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
<title>Home</title>
<link rel="stylesheet" href="utilities/css/header.css">
<link rel="stylesheet" href="utilities/css/footer.css">
<link rel="stylesheet" href="utilities/css/home.css">
<link rel="stylesheet" href="utilities/css/navbar.css">
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<% if(sessione.getAttribute("nome") != null){%>
Benvenuto <%= sessione.getAttribute("nome") %>
<%} %>

 <% if (products != null && products.size() != 0) { %>
<div class="grid-container">
  <%
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
      Prodotto bean = (Prodotto) it.next();
  %>
  <div class="product-container">
  <a href="product?id=<%= bean.getId() %>">
    <img class="product-image" src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
    <h3 class="nome"><%= bean.getNome() %></h3>
    <div class="details">
      <p class="price"><%= bean.getPrezzo() %>€ </p>
      <a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1" class="carrello-button">Carrello</a>
    </div>
  </a>
</div>
  <% } %>
</div>
      <% } else { %>
      <div class="error-message">
 		 <p>Nessun prodotto disponibile al momento.</p>
	</div>
	<% }  %>
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
