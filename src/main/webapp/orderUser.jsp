<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<%

    if(request.getSession().getAttribute("id") == null) {
        response.sendRedirect("./login.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Utente</title>
    <link rel="stylesheet" href="utilities/css/ordini.css">
    <script src="utilities/js/redirect.js"></script>
</head>
<body>
<%@ include file="utilities/header.jsp" %>
<%@ include file="utilities/dashboard.jsp" %>
<% ArrayList<Ordine> ord = (ArrayList<Ordine>) request.getAttribute("ordini"); 
   if (ord != null) {
%>
<div class="content">
    <h2>I miei ordini</h2>

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
                <th>Fattura</th> <!-- Aggiunta della colonna Fattura -->
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
                                <td class="prodotto" onclick="redirectToProduct(<%= prodotto.getProdotto().getId() %>)"><%= prodotto.getNome() %></td>
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
                <td>
                    <button onclick="window.location.href='Fattura?orderId=<%= ordine.getId() %>'">Scarica Fattura</button>
                </td> <!-- Aggiunta del pulsante Fattura -->
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="8" class="no-orders">Non ci sono ordini</td> <!-- Aggiornato colspan -->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<%  
    } else {
%>
    <h1>Errore negli ordini</h1>
<% 
    } 
%>
<%@ include file="utilities/footer.jsp" %>
</body>
</html>