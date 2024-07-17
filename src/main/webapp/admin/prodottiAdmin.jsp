<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
    Collection<Prodotto> prodotti = (Collection<Prodotto>) request.getAttribute("prodotti");
    if (prodotti == null) {
        response.sendRedirect("./admin/prodottiAdmin");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista Prodotti</title>
    <link rel="stylesheet" href="../utilities/css/utenti.css">
</head>
<%@ include file="../utilities/header.jsp" %>
<body>
    <div class="container">
        <h2>Lista Prodotti</h2>
        
         <form class="sticky" action="prodottiAdmin" method="POST">
            <label for="serchbar">Ricerca per ID:</label>
            <input type="text" id="idProdotto" name="id">
            <input type="submit" value="Cerca">
        </form>

        <% if (prodotti != null && !prodotti.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Prezzo</th>
                    <th>IVA</th>
                    <th>Descrizione</th>
                    <th>Stock</th>
                    <th>Alcol (%)</th>
                    <th>Formato</th>
                    <th>Provenienza</th>
                    <th>Tipologia</th>
                    <th>Annata</th>
                    <th>Denominazione</th>
                    <th>Immagine</th>
                </tr>
            </thead>
            <tbody>
                <% for (Prodotto prodotto : prodotti) { %>
                <tr onclick="redirectToMod(<%= prodotto.getId() %>)">
                    <td data-label="ID"><%= prodotto.getId() %></td>
                    <td data-label="Nome"><%= prodotto.getNome() %></td>
                    <td data-label="Prezzo"><%= prodotto.getPrezzo() %></td>
                    <td data-label="Iva"><%= prodotto.getIva() %></td>
                    <td data-label="Descrizione"><%= prodotto.getDescrizione() %></td>
                    <td data-label="Stock"><%= prodotto.getStock() %></td>
                    <td data-label="Alcol"><%= prodotto.getAlcol() %></td>
                    <td data-label="Formato"><%= prodotto.getFormato() %></td>
                    <td data-label="Provenienza"><%= prodotto.getProvenienza() %></td>
                    <td data-label="Tipologia"><%= prodotto.getTipologia() %></td>
                    <td data-label="Annata"><%= prodotto.getAnnata() %></td>
                    <td data-label="Denominazione"><%= prodotto.getDenominazione() %></td>
                    <td data-label="Imagine"><img src="/Symposium/<%= prodotto.getImmagine() %>" alt="<%= prodotto.getNome() %>" width="100"></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Non ci sono prodotti disponibili.</p>
        <% } %>
    </div>
</body>
<%@ include file="../utilities/footer.jsp" %>
</html>