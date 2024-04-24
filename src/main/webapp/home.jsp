<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("prodotti");
	if(products == null) {
		response.sendRedirect("./catalogo&order=''");	
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>

.riga {
  display:flex;
  gap: 20px; /* Spazio tra le colonne */
}
/* Stile per una griglia di 3 colonne */
.container {
  display:flex;
  gap: 20px; /* Spazio tra le colonne */
}

.item {
  background-color: #f2f2f2;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  text-align:center;
}

/* Stile per il testo del prodotto */
.item h2 {
  font-size: 18px;
  margin-bottom: 10px;
}

/* Stile per l'immagine del prodotto */
.item img {
  max-height: 200px; /* Imposta un'altezza massima per l'immagine */
  width: auto; /* Per mantenere le proporzioni originali dell'immagine */
  border-radius: 5px;
}
</style>
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<body>
	<%
			request.setAttribute("prodotti", null);
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
	%>
	<div class="riga">
	<% while (it.hasNext()) { %>
		<div class="container">
			<div class="item">
				<%
					Prodotto bean = (Prodotto) it.next();
				%>
				<h2><%= bean.getNome() %></h2>
				<a href="product?id=<%= bean.getId() %>"><img src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>"></a>
				<p><%= bean.getPrezzo() %></p>
				<p><%= bean.getDescrizione() %></p>
			</div>
		</div>
	<% } %>
	</div>
	<% } %>

 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
