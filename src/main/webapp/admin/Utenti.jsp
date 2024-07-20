<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Collection<Utente> utenti = (Collection<Utente>) request.getAttribute("utenti");
	if(utenti == null) {
		response.sendRedirect("/Symposium/admin/utenti");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista Utenti</title>
    <link rel="stylesheet" href="../utilities/css/utenti.css">
</head>
<%@ include file="../utilities/header.jsp" %>
<%@ include file="admindsh.jsp" %>
<body>
    <div class="container">
        <h2>Lista Utenti</h2>

        <% if (utenti != null && !utenti.isEmpty()) { %>
        <form class="sticky" action="ordiniAdmin" method="POST">
            <label for="utenteId">Ordini Utente ID:</label>
            <input type="text" id="utenteId" name="id" required>
            <input type="submit" value="Accedi">
        </form>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Data di Nascita</th>
                    <th>Via</th>
                    <th>CAP</th>
                    <th>Città</th>
                </tr>
            </thead>
            <tbody>
                <% for (Utente utente : utenti) { %>
                <tr class="utente-id" onclick="redirectToOrder(<%= utente.getId() %>)">
                    <td data-label="ID"><%= utente.getId() %></td>
                    <td data-label="Nome"><%= utente.getNome() %></td>
                    <td data-label="Cognome"><%= utente.getCognome() %></td>
                    <td data-label="Email"><%= utente.getEmail() %></td>
                    <td data-label="Telefono"><%= utente.getTelefono() != null ? utente.getTelefono().toString() : "" %></td>
                    <td data-label="Nascita"><%= utente.getDataNascita() != null ? utente.getDataNascita().toString() : "" %></td>
                    <td data-label="Via"><%= utente.getVia() != null ? utente.getVia().toString() : "" %></td>
                    <td data-label="Cap"><%= utente.getCap() != null ? utente.getCap().toString() : "" %></td>
                    <td data-label="Citta"><%= utente.getCitta() != null ? utente.getCitta().toString() : "" %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Non ci sono utenti registrati.</p>
        <% } %>
    </div>
</body>
<%@ include file="../utilities/footer.jsp" %>
</html>