<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Funzioni dell'admin</title>
<link rel="stylesheet" href="utilities/css/admin.css">
</head>
<%@ include file="../utilities/header.jsp" %>
<body>
<div class="admin-functions">
    <h1>Funzioni dell'Admin</h1>
    <a href="./redirectAdmin?page=Utenti">Ordini utenti registrati</a>
    <a href="./redirectAdmin?page=insProdotto">Inserimento prodotto</a>
</div>
<%@ include file="../utilities/footer.jsp" %>
</body>
</html>