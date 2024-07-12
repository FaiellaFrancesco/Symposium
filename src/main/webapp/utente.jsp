<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.beans.Utente" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Area Utente</title>
    <link rel="stylesheet" href="utilities/css/utente.css">
    <script src="utilities/js/validation.js"></script>
    <script src="utilities/js/redirect.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</head>
<body>
<%@ include file="../utilities/header.jsp" %>
<% Utente utente = (Utente) request.getAttribute("utente"); 
   if (utente != null) {
%>
<%@ include file="../utilities/dashboard.jsp" %>
<h1>I miei dati</h1>
<form action="modUtente" method="post" onsubmit="validateUserForm(event)" class="insert-form">
    <div class="contenitore">
        <!-- Sezione Info Personali -->
        <div class="sezione">
            <h2>Info Personali</h2>
            <label>Nome:</label>
            <input type="hidden" name="id" value="<%= utente.getId() %>">
            <input type="text" name="nome" id="nome" value="<%= utente.getNome() %>" required>
            <span id="nomeError" class="error-message"></span>
            
            <label>Cognome:</label>
            <input type="text" name="cognome" id="cognome" value="<%= utente.getCognome() %>" required>
            <span id="cognomeError" class="error-message"></span>
            
            <label>Data di Nascita:</label>
            <input type="date" name="dataNascita" id="dataNascita" value="<%= utente.getDataNascita() %>">
            <span id="dataNascitaError" class="error-message"></span>
            
            <label>Telefono:</label>
            <input type="text" name="telefono" id="telefono" value="<%= (utente.getTelefono() == null) ? "---" : utente.getTelefono() %>" placeholder="0000000000">
            <span id="telefonoError" class="error-message"></span>
            
            <label>Via:</label>
            <input type="text" name="via" id="via" value="<%= (utente.getVia() == null) ? "---" : utente.getVia() %>" placeholder="Via Rossi 46">
            <span id="viaError" class="error-message"></span>
            
            <label>CAP:</label>
            <input type="text" name="cap" id="cap" value="<%= (utente.getCap() == null) ? "---" : utente.getCap() %>" placeholder="00000">
            <span id="capError" class="error-message"></span>
            
            <label>Città:</label>
            <input type="text" name="citta" id="citta" value="<%= (utente.getCitta() == null) ? "---" : utente.getCitta() %>" placeholder="Poggibonsi">
            <span id="cittaError" class="error-message"></span>
        </div>

        <!-- Sezione Dati Account e Pagamento -->
        <div class="sezione">
            <h2>Dati Account</h2>
            <label>Email:</label>
            <input type="email" name="email" id="email" value="<%= utente.getEmail() %>" required placeholder="example@gmail.com">
            <span id="emailError" class="error-message"></span>
            
            <label>Password:</label>
            <input type="password" name="pw" id="pw" value="        " required>
            <span id="pwError" class="error-message"></span>
            
            <h2>Pagamento</h2>
            <label>Nome Carta:</label>
            <input type="text" name="nomeCarta" id="nomeCarta" value="<%= (utente.getNomeCarta() == null) ? "---" : utente.getNomeCarta() %>" placeholder="PEPPE GAMBARDELLA">
            <span id="nomeCartaError" class="error-message"></span>
            
            <label>Numero Carta:</label>
            <input type="text" name="numeroCarta" id="numeroCarta" value="<%= (utente.getNumeroCarta() == null) ? "---" : utente.getNumeroCarta() %>" placeholder="0000 0000 0000 0000">
            <span id="numeroCartaError" class="error-message"></span>
            
            <label>Scadenza:</label>
            <input type="text" name="scadenza" id="scadenza" value="<%= (utente.getScadenza() == null) ? "---" : utente.getScadenza() %>" placeholder="MM/AA">
            <span id="scadenzaError" class="error-message"></span>
            
            <label>CVV:</label>
            <input type="text" name="cvv" id="cvv" value="<%= (utente.getCvv() == null) ? "---" : utente.getCvv() %>" placeholder="CVV">
            <span id="cvvError" class="error-message"></span>
        </div>
    </div>
    <div class="bottom-buttons">
        <input type="submit" value="Modifica">
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