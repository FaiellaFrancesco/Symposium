<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Utente</title>
<link rel="stylesheet" href="/Symposium/utilities/css/dashboard.css">
<script src="utilities/js/redirect.js"></script>
</head>
<body>
<h1>Benvenuto, nell'area di amministrazione</h1>
<div class="navbar">
    	<a class="active" href="/Symposium/redirectAdmin?page=Utenti">Ordini utenti</a>
        <a class="active" href="/Symposium/redirectAdmin?page=insProdotto">Inserimento prodotto</a>
        <a class="active" href="/Symposium/redirectAdmin?page=prodottiAdmin">Modifica prodotto</a>
</div>
</body>
</html>