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
<script type="text/javascript">
let lastClickedLink = null;

document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.filtro');

    links.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            if (lastClickedLink === link) {
                // If the clicked link is already active, redirect to catalog
                redirectToACatalogo();
            } else {
                if (lastClickedLink) {
                    lastClickedLink.classList.remove('active');
                }
                link.classList.add('active');
                lastClickedLink = link;
                filtro(link.textContent.trim());
            }
        });
    });
});

function toggleColor(link) {
    link.classList.toggle('active');
}
</script>
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<body>
    <span class="spazio"></span>
    <h1 class="bo">Il nostro catalogo</h1>
    <span class="spazio"></span>
    <!-- <span class="spazio"></span> -->
    <div class="filter">
        <a class="filtro" onclick="filtro('Vini Rossi')">Vini Rossi</a>
        <a class="filtro" onclick="filtro('Vini Bianchi')">Vini Bianchi</a>
        <a class="filtro" onclick="filtro('Vini Rosati')">Vini Rosati</a>
        <a class="filtro" onclick="filtro('Champagne')">Champagne</a>
        <a class="filtro" onclick="filtro('Spumanti')">Spumanti</a>
        <a class="filtro" onclick="filtro('Altro')">Altri prodotti</a>
    </div>
    <span class="spazio"></span>

    <% if (products != null && products.size() != 0) { %>
    <div id="container">
        <div class="grid-container">
            <%
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    Prodotto bean = (Prodotto) it.next();
                    if(bean.getShow()){
            %>
            <div class="product-card">
                <div class="product-container" onclick="redirectToProduct(<%= bean.getId() %>)">
                    <div class="product-front">
                        <img class="product-image" src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
                        <h3 class="nome"><%= bean.getNome() %></h3>
                        <div class="details">
                            <p class="price"><%= String.format(Locale.US, "%.2f", bean.getPrezzo()) %>€ </p>
                        </div>
                    </div>
                    <div class="product-back">
                        <div class="product-info">
                            <p><b>Tipologia: </b><%= bean.getTipologia() %></p>
                            <p><b>Provenienza: </b><%= bean.getProvenienza() %></p>
                            <p><b>Denominazione: </b><%= bean.getDenominazione() %></p>
                            <p><b>Annata: </b><%= bean.getAnnata() %></p>
                            <p><b>Alcol: </b><%= bean.getAlcol() %> %</p>
                            <p><b>Formato: </b><%= bean.getFormato() %> cl</p>
                        </div>
                        <% if (bean.getStock() > 0) { %>
                            <a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1" class="carrello-button">Aggiungi al Carrello</a>
                        <% } else { %>
                            <p class="out-of-stock">ESAURITO</p>
                        <% } %>
                    </div>
                </div>
            </div>
            <% }} %>
        </div>
    </div>
    <% } else { %>
    <div class="error-message">
        <p>Nessun prodotto disponibile al momento.</p>
    </div>
    <% } %>
    <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>