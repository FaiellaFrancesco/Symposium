<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.beans.Ordine" %>
<%@ page import="model.beans.OrderLine" %>
<%@ page import="model.beans.Utente" %>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Utente</title>
<link rel="stylesheet" href="utilities/css/dashboard.css">
<script src="utilities/js/redirect.js"></script>
</head>
<body>
<%String utenteId = (String)request.getAttribute("utenteId"); 
  if(utenteId == null){
%>
<h1>Ciao, sei nell'area utente</h1>
<div class="navbar">
    <a class="active" onclick="redirectToProdottiUtente(<%=request.getSession().getAttribute("id") %>)">I miei Ordini</a>
    <a class="active" onclick="redirectToAreaUtente(<%=request.getSession().getAttribute("id") %>)">I miei Dati</a>
</div>
<% } else {%>
<h1>Ordini dell'utente con ID: <%= utenteId %></h1>
<%} %>
</body>
</html>