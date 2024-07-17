<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.Prodotto" %>

<%
	Prodotto prodotto = (Prodotto) request.getAttribute("prodotto");
	if(prodotto == null) {
		response.sendRedirect("./catalogo");	
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= prodotto.getNome() %></title>
<link rel="stylesheet" href="/Symposium/utilities/css/prodotto.css">


</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<body>
	<div class="container">
	<div class="item">
        <div class="image">
            <img src="/Symposium/<%= prodotto.getImmagine() %>" alt="Immagine Prodotto">
        </div>
        <div class="details">
            <h2 class="name"><%= prodotto.getNome() %></h2>
            <p class="desc"><%= prodotto.getDescrizione() %></p>
            <p class="price"><%= prodotto.getPrezzo()%> € </p>
            <div class="buttons">
            	<form action="ControlloProdotto" method="GET">
            	<input type="hidden" name="action" value="addToC">
            	<input type="hidden" name="id" value="<%= prodotto.getId() %>">
                <input type="number" id="quantity" name="quantity" min="1" max="<%= prodotto.getStock() %>" value="1">
                <input type="submit" class="add-to-cart" value="Aggiungi al carrello">
                </form>
            </div>
            <div class="product-info">
                <p><b>Denominazione: </b><%= prodotto.getDenominazione() %></p>
                <p><b>Stock: </b><%= prodotto.getStock() %></p>
                <p><b>Formato: </b><%= prodotto.getFormato() %></p>
                <p><b>Provenienza: </b><%= prodotto.getProvenienza() %></p>
                <p><b>Tipologia: </b><%= prodotto.getTipologia() %></p>
                <p><b>Annata: </b><%= prodotto.getAnnata() %></p>
                <p><b>Alcol:</b> <%= prodotto.getAlcol() %></p>
                <!-- Aggiungi altre informazioni se necessario -->
            </div>
        </div>
        </div>
    </div>
</body>
 <!-- Footer -->
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</html>