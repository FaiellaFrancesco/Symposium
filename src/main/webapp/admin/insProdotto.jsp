<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.Categoria" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Nuovo Prodotto</title>
    <link rel="stylesheet" href="utilities/css/inserimento.css">
    <script src="utilities/js/validation.js"></script>
</head>
<body>
    <%@ include file="../utilities/header.jsp" %>
    <h1>Inserimento Nuovo Prodotto</h1>
    <form action="insProdotto" method="post" enctype="multipart/form-data" class="insert-form" onsubmit="validateProductForm(event)">
        <div class="contenitore">
            <div class="campi">
                <label>Nome:</label>
                <input type="text" id="nome" name="nome" required>
                <span id="nomeError" class="error-message"></span>
                
                <label>Prezzo:</label>
                <input type="text" id="prezzo" name="prezzo" required>
                <span id="prezzoError" class="error-message"></span>
                
                <label>IVA:</label>
                <input type="text" id="iva" name="iva" required>
                <span id="ivaError" class="error-message"></span>
                
                <label>Descrizione:</label>
                <textarea id="descrizione" name="descrizione" rows="4" required></textarea>
                <span id="descrizioneError" class="error-message"></span>
                
                <label>Stock:</label>
                <input type="text" id="stock" name="stock" required>
                <span id="stockError" class="error-message"></span>
            </div>
            <div class="campi">
                <label>Alcol (%):</label>
                <input type="text" id="alcol" name="alcol" required>
                <span id="alcolError" class="error-message"></span>
                
                <label>Formato:</label>
                <input type="text" id="formato" name="formato" required>
                <span id="formatoError" class="error-message"></span>
                
                <label>Provenienza:</label>
                <input type="text" id="provenienza" name="provenienza" required>
                <span id="provenienzaError" class="error-message"></span>
                
                <div class="select-container">
                    <label>Tipologia:</label>
                    <select id="tipologia" name="tipologia" required>
                        <% for(Categoria categoria : categorie) { %>
                            <option value="<%= categoria.getNome() %>"><%= categoria.getNome() %></option>
                        <% } %>
                    </select>
                    <span id="tipologiaError" class="error-message"></span>
                </div>
                
                <label>Annata:</label>
                <input type="text" id="annata" name="annata" required>
                <span id="annataError" class="error-message"></span>
                
                <label>Denominazione:</label>
                <input type="text" id="denominazione" name="denominazione" required>
                <span id="denominazioneError" class="error-message"></span>
                
                <label>Immagine:</label>
                <input type="file" name="file" accept="image/*" required>
                <span id="fileError" class="error-message"></span>
            </div>
        </div>
        <input type="submit" value="Inserisci Prodotto">
    </form>

    <%@ include file="../utilities/footer.jsp" %>
</body>
</html>
