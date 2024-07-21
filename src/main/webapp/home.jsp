<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
    ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");
    if(prodotti == null) {
        response.sendRedirect("./Home");
        return;
    }
    HttpSession sessione = request.getSession();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Symposium</title>
    <link rel="stylesheet" href="/Symposium/utilities/css/Homepage.css">
    
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<body>
<span style="display: block; margin-top: 50px; "></span>
<div class="container-sym">
    <img class="symposium" src="/Symposium/immagini/symposium.jpg">
    <div class="testo-presentazione">
        <img src="/Symposium/immagini/banner.png">
        <p class="presentazione">
            Il symposium greco era un incontro sociale tra uomini dell'antica Grecia, caratterizzato da conversazioni filosofiche, poesie, musica e bevute di vino.
            Il simposio era visto come un'importante istituzione culturale e sociale, un luogo dove si costruivano e rinforzavano le relazioni sociali e si discutevano idee e opinioni. Era anche una manifestazione del valore attribuito alla convivialità e alla cultura nella vita greca.
            <br><br>
            Presso Symposium, non trattiamo il vino come una semplice merce da acquistare, ma come un'opportunità per esplorare e apprezzare l'arte e la storia racchiusa in ogni bottiglia. La nostra piattaforma è progettata per immergere gli amanti del vino in una collezione meticulosamente curata di rossi intensi, bianchi raffinati e bollicine effervescenti.
            Cosa aspetti? Partecipa al Symposium.
    </div>
</div>

<span style="display: block; margin-top: 50px; "></span>

<div class="container-info">
		<div class="info-card"><p class="info">Qualità, velocità ed efficienza ci permettono 
		di essere il punto di riferimento nella vendita di vini e 
		spirits online</p>
		</div>
		<div class="info-card"><p class="info">Il nostro team di esperti Sommelier assaggia personalmente ogni bottiglia che proponiamo, 
			per selezionare i migliori vini provenienti 
			dall'Italia e dal mondo</p>
		</div>
		<div class="info-card"><p class="info">Nel nostro vasto assortimento prodotti tra vini, Champagne e Spirits accuratamente selezionati, troverai
		 sempre la bottiglia giusta per ogni occasione!</p>
		</div>


</div>

<span style="display: block; margin-top: 50px; "></span>

<div class="titolo-prod">
    <h3 class="titolo-prod">Le nostre Esclusive</h3>
</div>
<div id="container">
    <div class="grid-container">
        <% 
        // Define an array of specific product IDs for "Le nostre Esclusive"
        int[] exclusiveProductIds = {5, 45, 44, 28};
        for (int id : exclusiveProductIds) {
            for (Prodotto p : prodotti) {
                if (p.getId() == id) {
        %>
        <div class="product-card">
            <div class="product-container" onclick="redirectToProduct(<%= p.getId() %>)">
                <div class="product-front">
                    <img class="product-image" src="<%= p.getImmagine() %>" alt="<%= p.getNome() %>">
                    <h3 class="nome"><%= p.getNome() %></h3>
                    <div class="details">
                        <p class="price"><%= String.format("%.2f", p.getPrezzo()) %>€ </p>
                    </div>
                </div>
                <div class="product-back">
                    <!-- Retro della carta -->
                    <div class="product-info">
                        <p><b>Tipologia: </b><%= p.getTipologia() %></p>
                        <p><b>Provenienza: </b><%= p.getProvenienza() %></p>
                        <p><b>Denominazione: </b><%= p.getDenominazione() %></p>
                        <p><b>Annata: </b><%= p.getAnnata() %></p>
                        <p><b>Alcol: </b><%= p.getAlcol() %> %</p>
                        <p><b>Formato: </b><%= p.getFormato() %> cl</p>
                        <!-- Aggiungi altre informazioni se necessario -->
                    </div>
                    <% if (p.getStock() > 0) { %>
                        <a href="ControlloProdotto?action=addToC&id=<%= p.getId() %>&quantity=1" class="carrello-button">Aggiungi al Carrello</a>
                    <% } else { %>
                        <p class="out-of-stock">ESAURITO</p>
                    <% } %>
                </div>
            </div>
        </div>
        <% 
                }
            }
        }
        %>
    </div>
</div>

<div class="titolo-prod">
    <h3 class="titolo-prod">Le nostre selezioni</h3>
</div>
<div id="container">
    <div class="grid-container">
        <% 
        if (prodotti != null && !prodotti.isEmpty()) {
            int i = 0;
            int maxProducts = 4; // Number of products to display
            while (i < maxProducts) {
                int index = i * 11; // Initial index
                Prodotto p = null;

                // Search forward
                while (index < prodotti.size()) {
                    p = prodotti.get(index);
                    if (p.getShow()) {
                        break;
                    }
                    index++;
                }

                // If not found forward, search backward
                if (!p.getShow()) {
                    index = i * 11 - 1;
                    while (index >= 0) {
                        p = prodotti.get(index);
                        if (p.getShow()) {
                            break;
                        }
                        index--;
                    }
                }

                // Display the product if found
                if (p != null && p.getShow()) {
            %>
            <div class="product-card">
                <div class="product-container" onclick="redirectToProduct(<%= p.getId() %>)">
                    <div class="product-front">
                        <img class="product-image" src="<%= p.getImmagine() %>" alt="<%= p.getNome() %>">
                        <h3 class="nome"><%= p.getNome() %></h3>
                        <div class="details">
                            <p class="price"><%= String.format("%.2f", p.getPrezzo()) %>€ </p>
                        </div>
                    </div>
                    <div class="product-back">
                        <!-- Retro della carta -->
                        <div class="product-info">
                            <p><b>Tipologia: </b><%= p.getTipologia() %></p>
                            <p><b>Provenienza: </b><%= p.getProvenienza() %></p>
                            <p><b>Denominazione: </b><%= p.getDenominazione() %></p>
                            <p><b>Annata: </b><%= p.getAnnata() %></p>
                            <p><b>Alcol: </b><%= p.getAlcol() %> %</p>
                            <p><b>Formato: </b><%= p.getFormato() %> cl</p>
                            <!-- Aggiungi altre informazioni se necessario -->
                        </div>
                        <% if (p.getStock() > 0) { %>
                            <a href="ControlloProdotto?action=addToC&id=<%= p.getId() %>&quantity=1" class="carrello-button">Aggiungi al Carrello</a>
                        <% } else { %>
                            <p class="out-of-stock">ESAURITO</p>
                        <% } %>
                    </div>
                </div>
            </div>
            <% 
                    i++;
                } 
            } 
        }
        %>
    </div>
</div>

<div class="catalogo-btn">
    <a href="/Symposium/catalogo.jsp" class="catalogo-button">VEDI ALTRO</a>
</div>

<footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>

