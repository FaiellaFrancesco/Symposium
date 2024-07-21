<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.beans.*"%>
<%@ include file="utilities/filtro.jsp" %>
<% Carrello cart = (Carrello) request.getSession().getAttribute("cart"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
<link rel="stylesheet" href="utilities/css/carrello.css">
</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<div class="informazioni">
  <h2 class="info">Carrello</h2>
  <% if(cart != null && cart.getProdotti().size()!=0){ %>
  <p class="num-products"><b><%=cart.getProdotti().stream().count()%></b> Articoli</p>
  </div> <!--  INFORMAZIONI  -->
  <div class="container-car">
    <div class="products">
        <% 
            double totale = 0;
            double totaleIva = 0;
            Iterator<CartLine> it = cart.getProdotti().iterator();
            CartLine prodotto;
            while(it.hasNext()){
                prodotto = it.next();
                double prezzo = prodotto.getProdotto().getPrezzo();
                int quantita = prodotto.getQuant();
                double ivaProdotto = prodotto.getProdotto().getIva(); // Supponendo che ogni prodotto abbia il proprio IVA
                double prezzoTotaleProdotto = prezzo * quantita;
                double ivaTotaleProdotto = prezzoTotaleProdotto * ivaProdotto / 100;
                totale += prezzoTotaleProdotto;
                totaleIva += ivaTotaleProdotto;
        %>
        <!-- Blocchi con i vari prodotti -->
        <div class="product">
            <div class="div-img-product"><img class="img-product" src="<%= prodotto.getProdotto().getImmagine()%>" alt=""></div>
            <div class="details">
                <h3 class="name"><%= prodotto.getProdotto().getNome() %></h3>
                <p class="price"><%= String.format("%.2f", prezzo) %> €</p>
                Quantità: <%= quantita %>
            </div>
            <a class="rimuovi" href="ControlloProdotto?action=deleteFromC&id=<%= prodotto.getProdotto().getId() %>">X</a>
        </div>
        <% } %>
        <div class="cart">
            <p><h1>Totale:</h1> <span class="total-price"><%= String.format("%.2f", totale) %> €</span></p>
            <p class="iva-info">+ IVA: <%= String.format("%.2f", totaleIva) %> €</p>
            <button type="submit" class="checkout" onclick="redirectToCampiPayment()">Acquista</button>
        </div>
        <%  } else {%>
          <h4>Il tuo carrello è vuoto! Ritorna al <a class="ref-cat" href="catalogo.jsp">catalogo</a></h4>
           <% } %>
    	</div>
    </div>
  </div>
  <div class="divisore"></div>
  <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
