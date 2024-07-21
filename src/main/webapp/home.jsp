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
        </p>
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

<!-- Aggiungi il testo generato -->
<!-- Sezione Info Testo -->
<div class="info-text-section">
  <h2>Symposium: L'Esperienza Enologica Online</h2>
  <p>Benvenuto su Symposium, dove l’acquisto di vino non è solo una transazione, ma un’immersione nel mondo affascinante e ricco di storia del vino. La nostra piattaforma non è un semplice e-commerce, ma un viaggio sensoriale attraverso una selezione esclusiva di vini pregiati e Champagne di alta qualità.</p>
  <p><b>Esplora e Scopri con Facilità</b></p>
  <p>Navigare su Symposium è un'esperienza intuitiva e coinvolgente. Le nostre categorie – Vini Rossi Intensi, Vini Bianchi Raffinati, Spumanti e Champagne – sono curate per facilitare la tua esplorazione. Ogni prodotto è presentato con una scheda dettagliata che include caratteristiche tecniche, note di degustazione, premi ricevuti e una Griglia di Degustazione esclusiva. Questa griglia ti aiuterà a scegliere il vino che meglio si adatta ai tuoi gusti, valutando gusto, profumo e caratteristiche generali su una scala da 0 a 5.</p>
  <p><b>Acquista con Facilità e Sicurezza</b></p>
  <p>Quando trovi un vino che ti conquista, aggiungilo al carrello con un semplice clic. Puoi continuare a scoprire altri vini o procedere al pagamento. Il processo di acquisto è sicuro e veloce: scegli tra carte di credito, PayPal, Satispay, bonifico bancario o contanti alla consegna. La nostra piattaforma garantisce la protezione e la sicurezza dei tuoi dati.</p>
  <p><b>Spedizione Veloce e Gratuita</b></p>
  <p>Tutti i vini nel nostro assortimento sono prontamente disponibili e spediti entro 24-48 ore tramite corriere espresso. Per ordini superiori a 89,90 €, la spedizione è gratuita. Utilizziamo imballaggi specializzati e monitoriamo costantemente le condizioni di stoccaggio per garantire che ogni bottiglia arrivi a casa tua in perfette condizioni.</p>
  <p><b>Un'Offerta Diversificata e Competitiva</b></p>
  <p>Su Symposium, trovi una gamma di vini che spazia dalle rinomate cantine italiane a piccole realtà artigianali. Dalle etichette famose come Antinori e Frescobaldi ai gioielli meno conosciuti, offriamo vini bianchi pregiati come Gewurztraminer e Muller Thurgau, rossi intensi come Brunello di Montalcino e Amarone, e bollicine come Prosecco e Franciacorta. Ogni bottiglia è una finestra su una cultura vinicola ricca e variegata.</p>
  <p><b>Esplora con Passione</b></p>
  <p>Siamo qui per offrirti non solo vini di alta qualità, ma anche una connessione profonda con la cultura vinicola globale. Su Symposium, ogni sorso è un'opportunità per scoprire nuovi sapori e per arricchire la tua esperienza del vino con conoscenza e passione.</p>
  <p>Scopri la nostra selezione e lascia che ogni bottiglia ti conduca in un viaggio sensoriale unico. <a href="/Symposium/catalogo.jsp">Clicca qui per esplorare il nostro catalogo</a>.</p>
</div>



<footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>

