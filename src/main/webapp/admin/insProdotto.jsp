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
</head>
<body>
    <%@ include file="../utilities/header.jsp" %>
    <h1>Inserimento Nuovo Prodotto</h1>
    <form action="insProdotto" method="post" enctype="multipart/form-data" class="insert-form">
        <div style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <div class="campi">
                <label>Nome:</label>
                <input type="text" name="nome" required>
                
                <label>Prezzo:</label>
                <input type="text" name="prezzo" required>
                
                <label>IVA:</label>
                <input type="text" name="iva" required>
                
                <label>Descrizione:</label>
                <textarea name="descrizione" rows="4" required></textarea>
                
                <label>Stock:</label>
                <input type="text" name="stock" required>
            </div>
            <div class="campi">
                <label>Alcol (%):</label>
                <input type="text" name="alcol" required>
                
                <label>Formato:</label>
                <input type="text" name="formato" required>
                
                <label>Provenienza:</label>
                <input type="text" name="provenienza" required>
                
                <div class="select-container">
                    <label>Tipologia:</label>
                    <select name="tipologia" required>
                        <% for(Categoria categoria : categorie) { %>
                            <option value="<%= categoria.getNome() %>"><%= categoria.getNome() %></option>
                        <% } %>
                    </select>
                </div>
                
                <label>Annata:</label>
                <input type="text" name="annata" required>
                
                <label>Denominazione:</label>
                <input type="text" name="denominazione" required>
                
                <label>Immagine:</label>
                <input type="file" name="file" accept="image/*" required>
            </div>
        </div>
        <input type="submit" value="Inserisci Prodotto">
    </form>

    <%@ include file="../utilities/footer.jsp" %>
</body>
</html>