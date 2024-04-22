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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<style>
/* Stile per una griglia di 3 colonne */
.container {
  display: flex;
  gap: 20px; /* Spazio tra le colonne */
}

.item {
  background-color: #f2f2f2;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

/* Stile per il testo del prodotto */
.item h2 {
  font-size: 18px;
  margin-bottom: 10px;
}

/* Stile per l'immagine del prodotto */
.item img {
  max-width: 75%;
  height: auto;
  border-radius: 5px;
  display:flex;
}
</style>
<body>
	<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Prodotto bean = (Prodotto) it.next();
			
		%>
<div class="container">
  <div class="item">
    <h2><%= bean.getNome() %></h2>
    <img src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
    <p><%= bean.getPrezzo() %></p>
    <p><%= bean.getDescrizione() %></p>
  </div>
	<% } %> </div> <% } else { %>
	<% } %>

</body>
 <!-- Footer -->
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</html>