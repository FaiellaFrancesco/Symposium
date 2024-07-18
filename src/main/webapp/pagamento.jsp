<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.beans.Utente" %>
<%@ page import="model.beans.Carrello" %>
<%@ page import="model.beans.CartLine" %>
<%@ page import="java.util.Iterator" %>
<%@ include file="utilities/filtro.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina di checkout</title>
<link rel="stylesheet" href="/Symposium/utilities/css/pagamento.css">
<script src="/Symposium/utilities/js/validation.js"></script>
</head>
<%@ include file="../utilities/header.jsp" %>
<body>
<% Carrello cart = (Carrello) request.getSession().getAttribute("cart"); %>
<%
    Utente utente = (Utente) request.getAttribute("utente"); 
    if (utente == null) {
        response.sendRedirect("/Symposium/home.jsp");
        return;
    }
%>
<div class="container">
<form id="pagamento" action="pagamento" method="POST" onsubmit="validateCheckoutForm(event)">
    <div class="checkout-section">
    <h2>Checkout</h2>
    <div class="checkout-form">
        <div class="field-container">
            <label for="citta">Città</label>
            <input type="text" id="citta" name="citta" value="<%= utente.getCitta() != null ? utente.getCitta() : "" %>" required>
            <span id="cittaError" class="error-message"></span>
        </div>
        <div class="field-container">
            <label for="indirizzo">Indirizzo</label>
            <input type="text" id="indirizzo" name="indirizzo" value="<%= utente.getVia() != null ? utente.getVia() : "" %>" required>
            <span id="indirizzoError" class="error-message"></span>
        </div>
        <div class="field-container">
            <label for="cap">CAP</label>
            <input type="text" id="cap" name="cap" value="<%= utente.getCap() != null ? utente.getCap() : "" %>" required>
            <span id="capError" class="error-message"></span>
        </div>
        <div class="field-container">
            <label for="carta">Carta</label>
            <input type="text" id="carta" name="carta" placeholder="XXXXXXXXXXXXXXXX" value="<%= utente.getNumeroCarta() != null ? utente.getNumeroCarta() : "" %>" required>
            <span id="cartaError" class="error-message"></span>
        </div>
        <div class="field-container">
            <label for="cvv">Cvv</label>
            <input type="tel" id="cvv" name="cvv" placeholder="XXX" value="<%= utente.getCvv() != null ? utente.getCvv() : "" %>" required>
            <span id="cvvError" class="error-message"></span>
        </div>
        <div class="field-container">
            <label for="scadenza">Data Scadenza</label>
            <input type="text" id="scadenza" name="scadenza" placeholder="MM/AA" value="<%= utente.getScadenza() != null ? utente.getScadenza() : "" %>" required>
            <span id="scadenzaError" class="error-message"></span>
        </div>
       </div>
	</div>
    <div class="cart-section">
        <div class="informazioni">
            <h2 class="info">Riepilogo Ordine</h2>
            <% if (cart != null && cart.getProdotti().size() != 0) { %>
        </div>
        <div class="container-car">
        <p class="num-products"><b><%= cart.getProdotti().stream().count() %></b> Articoli</p>
            <div class="products">
                <% Iterator<CartLine> it = cart.getProdotti().iterator();
                   CartLine prodotto;
                   while (it.hasNext()) {
                       prodotto = it.next();
                %>
                <div class="product">
                    <div class="img-product">
                        <img src="<%= prodotto.getProdotto().getImmagine() %>" alt="">
                    </div>
                    <div class="details">
                        <h3 class="name"><%= prodotto.getProdotto().getNome() %></h3>
                        <p class="price"><%= prodotto.getProdotto().getPrezzo() %> €</p>
                        Quantità: <%= prodotto.getQuant() %>
                    </div>
                </div>
                <% } %>
            </div>
            <div class="cart">
                <p><h1>Totale:</h1> <span class="total-price">
                    <%= String.format("%.2f", cart.getProdotti().stream().mapToDouble((e) -> e.getProdotto().getPrezzo() * e.getQuant()).sum()) %> €</span></p>
                    <button type="submit" class="checkout">Acquista</button>
            </div>
            <% } else { 
                response.sendRedirect("/Symposium/home.jsp");
                return;
            } %>
        </div>
       </div>
</form>
</div>
</body>
<%@ include file="../utilities/footer.jsp" %>
</html>