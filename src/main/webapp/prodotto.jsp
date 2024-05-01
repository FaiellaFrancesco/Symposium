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

</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<style>
        .container {
    display: flex;
    align-items: center;
    text-align: rigth;
    padding: 20px;
    border: 1px solid #ccc;
}
	
	.item{
		display: flex;
    align-items: center;
    text-align: rigth;
    margin: 20px auto; /* Centra il contenitore */
    max-height: 800px; /* Limita la larghezza del contenitore */
    height: 400px;
	}
        .image img {
    max-height: 400px; /* Utilizza il 50% dell'altezza della finestra del browser */
    max-width:auto;
  
}
        .product-info {
            font-size: 14px;
            color: #666;
        }
    </style>
<body>
	<div class="container">
	<div class="item">
        <div class="image">
            <img src="<%= prodotto.getImmagine() %>" alt="Immagine Prodotto">
        </div>
        <div class="details">
            <h2><%= prodotto.getNome() %></h2>
            <p><%= prodotto.getDescrizione() %></p>
            <p>Prezzo: €<%= prodotto.getPrezzo() %></p>
            <div class="product-info">
                <p>Denominazione: <%= prodotto.getDenominazione() %></p>
                <p>Stock: <%= prodotto.getStock() %></p>
                <p>Formato: <%= prodotto.getFormato() %></p>
                <p>Provenienza: <%= prodotto.getProvenienza() %></p>
                <p>Tipologia: <%= prodotto.getTipologia() %></p>
                <p>Annata: <%= prodotto.getAnnata() %></p>
                <p>Alcol: <%= prodotto.getAlcol() %></p>
                <!-- Aggiungi altre informazioni se necessario -->
            </div>
        </div>
        </div>
    </div>
</body>
 <!-- Footer -->
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</html>