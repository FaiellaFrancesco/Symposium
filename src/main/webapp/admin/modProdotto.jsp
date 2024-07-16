<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.beans.Prodotto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifica Prodotto</title>
    <link rel="stylesheet" href="../utilities/css/inserimento.css">
    <script src="../utilities/js/validation.js"></script>
</head>
<body>
<%@ include file="../utilities/header.jsp" %>
<% Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); 
   if (prodotto != null) {
%>

    <h1>Modifica del Prodotto</h1>
<form action="modProdotto" method="post" onsubmit="validateProductForm(event)" enctype="multipart/form-data" class="insert-form">
    <div class="contenitore">
        <div class="campi">
            <label>Nome:</label>
            <input type="hidden" name="id" value="<%= prodotto.getId()  %>">
            <input type="text" name="nome" id="nome" value="<%= prodotto.getNome() %>" required>
            <span id="nomeError" class="error-message"></span>
            
            <label>Prezzo:</label>
            <input type="text" name="prezzo" id="prezzo" value="<%= prodotto.getPrezzo() %>" required>
            <span id="prezzoError" class="error-message"></span>
            
            <label>IVA:</label>
            <input type="text" name="iva" id="iva" value="<%= prodotto.getIva() %>" required>
            <span id="ivaError" class="error-message"></span>
            
            <label>Descrizione:</label>
            <textarea name="descrizione" id="descrizione" rows="4" required><%= prodotto.getDescrizione() %></textarea>
            <span id="descrizioneError" class="error-message"></span>
            
            <label>Stock:</label>
            <input type="text" name="stock" id="stock" value="<%= prodotto.getStock() %>" required>
            <span id="stockError" class="error-message"></span>
        </div>
        <div class="campi">
            <label>Alcol (%):</label>
            <input type="text" name="alcol" id="alcol" value="<%= prodotto.getAlcol() %>" required>
            <span id="alcolError" class="error-message"></span>
            
            <label>Formato:</label>
            <input type="text" name="formato" id="formato" value="<%= prodotto.getFormato() %>" required>
            <span id="formatoError" class="error-message"></span>
            
            <label>Provenienza:</label>
            <input type="text" name="provenienza" id="provenienza" value="<%= prodotto.getProvenienza() %>" required>
            <span id="provenienzaError" class="error-message"></span>
            
            <div class="select-container">
                <label>Tipologia:</label>
                <select name="tipologia" id="tipologia" required>
                    <% for(Categoria categoria : categorie) { %>
                        <option value="<%= categoria.getNome() %>" <%= categoria.getNome().equals(prodotto.getTipologia())? "selected" : "" %>> <%= categoria.getNome() %></option>
                    <% } %>
                </select>
                <span id="tipologiaError" class="error-message"></span>
            </div>
            
            <label>Annata:</label>
            <input type="text" name="annata" id="annata" value="<%= prodotto.getAnnata() %>" required>
            <span id="annataError" class="error-message"></span>
            
            <label>Denominazione:</label>
            <input type="text" name="denominazione" id="denominazione" value="<%= prodotto.getDenominazione() %>" required>
            <span id="denominazioneError" class="error-message"></span>
            
            <label>Immagine attuale:</label>
            <img src="/Symposium/<%= prodotto.getImmagine() %>" alt="Immagine Prodotto" class="imgprodotto">
            
            <label>Nuova Immagine:</label>
            <input type="file" name="file" accept="image/*">
            <span id="fileError" class="error-message"></span>
        </div>
    </div>
    <input type="submit" value="Modifica Prodotto">
</form>
<%  
    } else {
%>
    <h1>Non è stato selezionato nessun prodotto</h1>
<% 
    } 
%>
<%@ include file="../utilities/footer.jsp" %>
</body>
</html>