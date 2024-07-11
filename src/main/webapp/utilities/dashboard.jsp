<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Utente</title>
<link rel="stylesheet" href="utilities/css/dashboard.css">
<script type="text/javascript">
function redirectToProdottiUtente(id){
	// Crea un form nascosto dinamicamente
        var form = document.createElement('form');
        form.method = 'POST'; // Metodo POST
        form.action = 'ordiniUtente'; // URL dell'azione

        // Aggiungi campi input nascosti per i parametri
        var idInput = document.createElement('input');
        idInput.type = 'hidden';
        idInput.name = 'id'; // Nome del parametro
        idInput.value = id; // Valore del parametro
        form.appendChild(idInput);


        // Aggiungi il form al corpo del documento (nascosto)
        document.body.appendChild(form);

        // Invia il form
        form.submit();
}</script>
</head>
<body>
<h1>Ciao, sei nell'area utente</h1>
<div class="navbar">
    <a class="active" onclick="redirectToProdottiUtente(<%=request.getSession().getAttribute("id") %>)">I miei Ordini</a>
    <a class="active" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)">I miei Dati</a>
</div>
</body>
</html>