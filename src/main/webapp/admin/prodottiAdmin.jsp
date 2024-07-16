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
                    <td><%= prodotto.getId() %></td>
                    <td><%= prodotto.getNome() %></td>
                    <td><%= prodotto.getPrezzo() %></td>
                    <td><%= prodotto.getIva() %></td>
                    <td><%= prodotto.getDescrizione() %></td>
                    <td><%= prodotto.getStock() %></td>
                    <td><%= prodotto.getAlcol() %></td>
                    <td><%= prodotto.getFormato() %></td>
                    <td><%= prodotto.getProvenienza() %></td>
                    <td><%= prodotto.getTipologia() %></td>
                    <td><%= prodotto.getAnnata() %></td>
                    <td><%= prodotto.getDenominazione() %></td>
                    <td><img src="/Symposium/<%= prodotto.getImmagine() %>" alt="<%= prodotto.getNome() %>" width="100"></td>
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