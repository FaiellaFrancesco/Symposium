<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<%@ include file="utilities/filtro.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Utente</title>
    <link rel="stylesheet" href="/Symposium/utilities/css/ordini.css">
</head>
<body>
<%@ include file="utilities/header.jsp" %>
<%@ include file="utilities/dashboard.jsp" %>
<% ArrayList<Ordine> ord = (ArrayList<Ordine>) request.getAttribute("ordini"); 
   if (ord != null) {
%>
<div class="content">
    <h1>Ordini</h1>
	
	<form id="filterForm" method="POST" action="/Symposium/filtroOrdini">
    <div class="filter-container">
        <label for="startDate">Data Inizio:</label>
        <input type="date" id="startDate" name="startDate" value="<%= request.getParameter("startDate") %>">
        
        <label for="endDate">Data Fine:</label>
        <input type="date" id="endDate" name="endDate" value="<%= request.getParameter("endDate") %>">
        
        <!-- Campo hidden per l'ID utente -->
        <input type="hidden" id="userId" name="id" value="<%= request.getAttribute("id")  %>">
        
        <button type="submit">Filtra</button>
    </div>
</form>
    <div id="orderTableContainer">
    <table class="order-table">
        <thead>
            <tr>
                <th>ID Ordine</th>
                <th>Data Ordine</th>
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
                                <td><%= String.format("%.2f", prodotto.getPrezzo()) %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </td>
                <td>
                    <button onclick="redirectToFattura(<%= ordine.getId() %>)">Scarica Fattura</button>
                </td> <!-- Aggiunta del pulsante Fattura -->
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" class="no-orders">Non ci sono ordini</td> <!-- Aggiornato colspan -->
            </tr>
            <%
                }
            %>
        	</tbody>
    </table>
	</div>
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
