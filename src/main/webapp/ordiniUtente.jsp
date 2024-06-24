<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista Ordini</title>
    <link rel="stylesheet" href="utilities/css/ordini.css">
</head>
<%@ include file="utilities/header.jsp" %>
<body>
<%String utente = request.getAttribute("utente").toString(); %>
<h2>Lista Ordini per Utente ID: <%= utente %></h2>

<table class="order-table">
    <thead>
        <tr>
            <th>ID Ordine</th>
            <th>Data Ordine</th>
            <th>Stato</th>
            <th>Città</th>
            <th>Via</th>
            <th>CAP</th>
            <th>Prodotti</th>
        </tr>
    </thead>
    <tbody>
        <%
        ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getAttribute("ordini");
            if (ordini != null && !ordini.isEmpty()) {
                for (Ordine ordine : ordini) {
        %>
        <tr>
            <td><%= ordine.getId() %></td>
            <td><%= ordine.getData().getTime() %></td>
            <td><%= ordine.getStato() %></td>
            <td><%= ordine.getCitta() %></td>
            <td><%= ordine.getVia() %></td>
            <td><%= ordine.getCAP() %></td>
            <td>
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Prodotto</th>
                            <th>IVA</th>
                            <th>Quantità</th>
                            <th>Prezzo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<OrderLine> prodotti = ordine.getProdotti();
                            for (OrderLine prodotto : prodotti) {
                        %>
                        <tr>
                            <td class="prodotto" onclick="redirectToProduct(<%= prodotto.getProdotto().getId() %>)"><%= prodotto.getProdotto().getId() + " " + prodotto.getProdotto().getNome() %></td>
                            <td><%= prodotto.getIva() %></td>
                            <td><%= prodotto.getQuant() %></td>
                            <td><%= prodotto.getPrezzo() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" class="no-orders">Non ci sono ordini</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
</body>
<%@ include file="utilities/footer.jsp" %>
</html>