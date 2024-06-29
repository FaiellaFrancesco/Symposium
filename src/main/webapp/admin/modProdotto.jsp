<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.beans.Prodotto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifica Prodotto</title>
    <link rel="stylesheet" href="utilities/css/inserimento.css">
</head>
<body>
<%@ include file="../utilities/header.jsp" %>
<% Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); 
   if (prodotto != null) {
%>

    <h1>Modifica del Prodotto</h1>
    <form action="modProdotto" method="post" enctype="multipart/form-data" class="insert-form">
        <div class="contenitore">
            <div class="campi">
                <label>Nome:</label>
                <input type="hidden" name="id" value="<%= prodotto.getId()  %>">
                <input type="text" name="nome" value="<%= prodotto.getNome() %>" required>
                
                <label>Prezzo:</label>
                <input type="text" name="prezzo" value="<%= prodotto.getPrezzo() %>" required>
                
                <label>IVA:</label>
                <input type="text" name="iva" value="<%= prodotto.getIva() %>" required>
                
                <label>Descrizione:</label>
                <textarea name="descrizione" rows="4" required><%= prodotto.getDescrizione() %></textarea>
                
                <label>Stock:</label>
                <input type="text" name="stock" value="<%= prodotto.getStock() %>" required>
            </div>
            <div class="campi">
                <label>Alcol (%):</label>
                <input type="text" name="alcol" value="<%= prodotto.getAlcol() %>" required>
                
                <label>Formato:</label>
                <input type="text" name="formato" value="<%= prodotto.getFormato() %>" required>
                
                <label>Provenienza:</label>
                <input type="text" name="provenienza" value="<%= prodotto.getProvenienza() %>" required>
                
                <div class="select-container">
                    <label>Tipologia:</label>
                    <select name="tipologia" required>
                        <% for(Categoria categoria : categorie) { %>
                            <option value="<%= categoria.getNome() %>" <%= categoria.getNome().equals(prodotto.getTipologia()) ? "selected" : "" %>> <%= categoria.getNome() %></option>
                        <% } %>
                    </select>
                </div>
                
                <label>Annata:</label>
                <input type="text" name="annata" value="<%= prodotto.getAnnata() %>" required>
                
                <label>Denominazione:</label>
                <input type="text" name="denominazione" value="<%= prodotto.getDenominazione() %>" required>
                
                <label>Immagine attuale:</label>
                <img src="<%= prodotto.getImmagine() %>" alt="Immagine Prodotto" class="imgprodotto">
                
                <label>Nuova Immagine:</label>
                <input type="file" name="file" accept="image/*">
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