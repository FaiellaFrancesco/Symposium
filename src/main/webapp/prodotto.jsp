<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Prodotto prodotto = (Prodotto) request.getAttribute("prodotto");
	if(prodotto == null) {
		response.sendRedirect("./catalogo");	
		return;
	}
	request.setAttribute("prodotto", null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= prodotto.getNome() %></title>
<link rel="stylesheet" href="utilities/css/header.css">
<link rel="stylesheet" href="utilities/css/footer.css">
<link rel="stylesheet" href="utilities/css/prodotto.css">
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<body>
	<div class="container">
	<div class="item">
        <div class="image">
            <img src="<%= prodotto.getImmagine() %>" alt="Immagine Prodotto">
        </div>
        <div class="details">
            <h2 class="name"><%= prodotto.getNome() %></h2>
            <p class="desc"><%= prodotto.getDescrizione() %></p>
            <p class="price"><%= prodotto.getPrezzo()%> € </p>
            <div class="buttons">
            	
                <input type="number" id="quantity" name="quantity" min="1" max="<%= prodotto.getStock() %>"value="1">
                <button onclick="" class="add-to-cart">Aggiungi al carrello</button>
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