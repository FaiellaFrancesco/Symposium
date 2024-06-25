<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.Categoria" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Nuovo Prodotto</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .insert-form {
            text-align: center;
            margin: 20px auto;
            width: 60%;
            padding: 20px;
            border: 2px solid #990E3C;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .insert-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            text-align: left;
        }
        .insert-form input[type="text"],
        .insert-form input[type="file"],
        .insert-form textarea,
        .insert-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            outline: none;
        }
        .insert-form select {
            height: 40px; /* Altezza leggermente aumentata */
        }
        .insert-form input[type="submit"] {
            background-color: #990E3C;
            color: #fff;
            border: none;
            padding: 15px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .insert-form input[type="submit"]:hover {
            background-color: #6F1C38;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
        h1 {
            color: #990E3C;
            text-align: center;
            font-family: 'Courier New', monospace;
            margin-bottom: 20px;
        }
        /* Stili specifici per la select */
        .insert-form .select-container {
            position: relative;
        }
        .insert-form select {

            appearance: none;
            background: url("data:image/svg+xml,%3Csvg width='12' height='8' viewBox='0 0 12 8' fill='%23990E3C' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M6 8L0.698314 0H11.3017L6 8Z'/%3E%3C/svg%3E") no-repeat right 10px center/12px 8px;
            padding-right: 35px; /* Spazio per la freccia */
        }
    </style>
</head>
<body>
    <%@ include file="../utilities/header.jsp" %>
    <h1>Inserimento Nuovo Prodotto</h1>
    <form action="insProdotto" method="post" enctype="multipart/form-data" class="insert-form">
        <div style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <div style="width: calc(50% - 10px);">
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
            <div style="width: calc(50% - 10px);">
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