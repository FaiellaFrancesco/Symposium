<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("prodotti");
	if(products == null) {
		response.sendRedirect("./catalogo");	
		return;
	}

	Carrello cart = (Carrello) request.getSession().getAttribute("cart");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<style>
  /* Stile per il contenitore della tabella */
  .table-container {
  	width:100%;
    display: block;
    justify-content: center; /* Centra orizzontalmente il contenuto */
    margin-left: auto;
    border-top: 19px solid rgba(0, 0, 0, 0);
    margin-right: auto;
    width: 100%;
  }

  /* Stili per la tabella (come prima) */
  .table {
    width: 70%;
    border-collapse: collapse;
  }

  .table th,
  .table td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
  }
	
	table th a {
            color: #000;
            text-decoration: none;
            padding: 5px 10px;
        }
        
  table th {
    background-color: #f2f2f2;
    font-family: 'Courier New', monospace ;
    font-size: 20px;
  }

  table img {
    max-height: 100px;
    max-width: 100px;
    border-radius: 5px;
  }
  .error-message {
    text-align: center; /* Allineamento del testo al centro */
    margin-top: 50px; /* Margine superiore */
  }

  /* Stile per il testo del messaggio di errore */
  .error-message p {
    font-weight: bold; /* Grassetto */
    color:#990E3C;
    font-family: 'Courier New', monospace ;
    font-size: 40px;
  }
</style>

<% if(cart!=null){
	Iterator<?> it = cart.getProdotti().iterator();
	%> <ul> 
	<% while(it.hasNext()){
		CartLine prodotto = (CartLine) it.next();
		%>  <li> Prodotto:  <%= prodotto.getProdotto().getNome() %> Quantita:  <%= prodotto.getQuant() %> </li> <% } %> </ul> <% }
	%>



 <% if (products != null && products.size() != 0) { %>
<div class="table-container" align="center">
  <table class="table">
    <thead>
      <tr>
        <th><a href="catalogo?order=nome"> Nome </a></th>
        <th>Immagine</th>
        <th><a href="catalogo?order=prezzo"> Prezzo </a></th>
        <th><a href="catalogo?order=descrizione"> Descrizione </a></th>
      </tr>
    </thead>
    <tbody>
    <%   Iterator<?> it = products.iterator();
          while (it.hasNext()) {
            Prodotto bean = (Prodotto) it.next();
      %>
      <tr>
        <td><a href="product?id=<%= bean.getId() %>"><%= bean.getNome() %></a></td>
        <td><a href="product?id=<%= bean.getId() %>"><img src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>"></a></td>
        <td>€<%= bean.getPrezzo() %></td>
        <td><%= bean.getDescrizione() %></td>
        <td><a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>"> Aggiungi al carrello </a></td>
      </tr>
      <% } %>
      </tbody>
  	</table>
	</div>
      <% } else { %> 
      <div class="error-message">
 		 <p>Nessun prodotto disponibile al momento.</p>
	</div>
      <% }  %>
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
