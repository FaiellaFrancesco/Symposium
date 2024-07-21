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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const quantityInput = document.querySelector('#quantity');
    const minusButton = document.querySelector('.quantity-btn.minus');
    const plusButton = document.querySelector('.quantity-btn.plus');
    
    // Ottieni il valore dello stock dal server e impostalo come valore massimo
    const stock = parseInt('<%= prodotto.getStock() %>', 10);
    quantityInput.setAttribute('max', stock);
    quantityInput.setAttribute('min', 1); // Imposta il valore minimo a 1

    function updateButtons() {
        const currentQuantity = parseInt(quantityInput.value, 10);
        minusButton.disabled = currentQuantity <= 1;
        plusButton.disabled = currentQuantity >= stock;
    }

    function changeQuantity(amount) {
        let currentQuantity = parseInt(quantityInput.value, 10);
        const newQuantity = currentQuantity + amount;
        if (newQuantity >= 1 && newQuantity <= stock) {
            quantityInput.value = newQuantity;
            updateButtons();
        }
    }

    minusButton.addEventListener('click', function() {
        changeQuantity(-1);
    });

    plusButton.addEventListener('click', function() {
        changeQuantity(1);
    });

    // Verifica inizialmente i pulsanti
    updateButtons();
});
</script>

</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<body>
    <div class="container">
        <div class="item">
            <div class="image">
                <img src="/Symposium/<%= prodotto.getImmagine() %>" alt="Immagine Prodotto" class="product-image">
            </div>
            <div class="details">
                <h2 class="name"><%= prodotto.getNome() %></h2>
                <p class="desc"><%= prodotto.getDescrizione() %></p>
                <p class="price">
                    <%= String.format("%.2f", prodotto.getPrezzo()) %> € 
                    <span class="iva">+IVA</span>
                </p>
                <div class="buttons">
                    <% if (prodotto.getStock() > 0) { %>
                        <form action="ControlloProdotto" method="GET">
						    <input type="hidden" name="action" value="addToC">
						    <input type="hidden" name="id" value="<%= prodotto.getId() %>">
						    <div class="buttons">
						        <div class="quantity-control">
						            <button type="button" class="quantity-btn minus">-</button>
						            <input type="number" id="quantity" name="quantity" min="1" max="<%= prodotto.getStock() %>" value="1">
						            <button type="button" class="quantity-btn plus">+</button>
						        </div>
						        <input type="submit" class="add-to-cart" value="Aggiungi al carrello">
						    </div>
						</form>
                    <% } else { %>
                        <p class="out-of-stock">ESAURITO</p>
                    <% } %>
                </div>
                <div class="product-info">
                    <p><b>Tipologia: </b><%= prodotto.getTipologia() %></p>
                    <p><b>Provenienza: </b><%= prodotto.getProvenienza() %></p>
                    <p><b>Denominazione: </b><%= prodotto.getDenominazione() %></p>
                    <p><b>Annata: </b><%= prodotto.getAnnata() %></p>
                    <p><b>Alcol: </b><%= prodotto.getAlcol() %> %</p>
                    <p><b>Formato: </b><%= prodotto.getFormato() %> cl</p>
                    <!-- Aggiungi altre informazioni se necessario -->
                </div>
            </div>
        </div>
    </div>
</body>
<!-- Footer -->
<footer><%@ include file="utilities/footer.jsp" %></footer>
</html>
