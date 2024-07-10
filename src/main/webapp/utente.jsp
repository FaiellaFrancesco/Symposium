<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.beans.Utente" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Area Utente</title>
    <link rel="stylesheet" href="utilities/css/utente.css">
    <script src="utilities/js/validation.js"></script>
</head>
<body>
<%@ include file="../utilities/header.jsp" %>
<% Utente utente = (Utente) request.getAttribute("utente"); 
   if (utente != null) {
%>

<h1>Area Utente</h1>
<form action="modUtente" method="post" onsubmit="validateUserForm(event)" enctype="multipart/form-data" class="insert-form">
    <div class="contenitore">
        <div class="campi">
            <label>Nome:</label>
            <input type="hidden" name="id" value="<%= utente.getId() %>">
            <input type="text" name="nome" id="nome" value="<%= utente.getNome() %>" required>
            <span id="nomeError" class="error-message"></span>
            
            <label>Cognome:</label>
            <input type="text" name="cognome" id="cognome" value="<%= utente.getCognome() %>" required>
            <span id="cognomeError" class="error-message"></span>
            
            <label>Email:</label>
            <input type="email" name="email" id="email" value="<%= utente.getEmail() %>" required>
            <span id="emailError" class="error-message"></span>
            
            <label>Password:</label>
            <input type="password" name="pw" id="pw" value="<%= "*".repeat(utente.getPw().length()) %>" required>
            <span id="pwError" class="error-message"></span>
            
            <label>Telefono:</label>
            <input type="text" name="telefono" id="telefono" value="<%= utente.getTelefono() != null ? utente.getTelefono().toString() : ""  %>">
            <span id="telefonoError" class="error-message"></span>
            
            <label>Data di Nascita:</label>
            <input type="date" name="dataNascita" id="dataNascita" value="<%= utente.getDataNascita() %>">
            <span id="dataNascitaError" class="error-message"></span>
            
            <label>Via:</label>
            <input type="text" name="via" id="via" value="<%= utente.getVia() %>">
            <span id="viaError" class="error-message"></span>
            
            <label>CAP:</label>
            <input type="text" name="cap" id="cap" value="<%= utente.getCap() %>">
            <span id="capError" class="error-message"></span>
            
            <label>Città:</label>
            <input type="text" name="citta" id="citta" value="<%= utente.getCitta() %>">
            <span id="cittaError" class="error-message"></span>
        </div>
    </div>
    <div class="bottom-buttons">
    <input type="submit" value="Modifica ">
    </div>
</form>
<%  
    } else {
%>
    <h1>Non è stato selezionato nessun utente</h1>
<% 
    } 
%>
<%@ include file="../utilities/footer.jsp" %>
</body>
</html>