<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Funzioni dell'Admin</title>
<link rel="stylesheet" href="utilities/css/admin.css">
</head>
<%@ include file="../utilities/header.jsp" %>
<body>
<div class="container">
    <h1>Funzioni dell'Admin</h1>
    <div class="admin-functions">
        <a href="./redirectAdmin?page=Utenti">Ordini utenti registrati</a>
        <a href="./redirectAdmin?page=insProdotto">Inserimento prodotto</a>
        <a href="./redirectAdmin?page=prodottiAdmin">Modifica prodotto</a>
    </div>
</div>
<%@ include file="../utilities/footer.jsp" %>
</body>
</html>