<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>

<html>
<head>
    <title>Lista Ordini</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        
        .prodotto:hover{
        background-color: yellow;
        }
    </style>
<script src="../utilities/js/redirect.js"></script>
</head>
<body>
<%String utente = request.getAttribute("utente").toString(); %>
<h2>Lista Ordini per Utente ID: <%= utente %></h2>

<table>
    <tr>
        <th>ID Ordine</th>
        <th>Data Ordine</th>
        <th>Stato</th>
        <th>Città</th>
        <th>Via</th>
        <th>CAP</th>
        <th>Prodotti</th>
    </tr>
    <%
    ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getAttribute("ordini");
        if (ordini != null) {
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
            <table>
                <tr>
                    <th>Prodotto</th>
                    <th>IVA</th>
                    <th>Quantità</th>
                    <th>Prezzo</th>
                </tr>
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
            </table>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="7">Nessun ordine trovato</td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>