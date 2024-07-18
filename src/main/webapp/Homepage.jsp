<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

    <%
	Collection<?> products = (Collection<?>) request.getAttribute("prodotti");
	if(products == null) {
		response.sendRedirect("./HomepageServlet");
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Symposium</title>
<link rel="stylesheet" href="/Symposium/utilities/css/Homepage.css">
</head>

<!-- Header -->
<%@ include file="utilities/header.jsp" %>
<body>
<div class="container-sym">
<img class="symposium" src="/Symposium/immagini/symposium.jpg">
<div class="testo-presentazione">
<h1 class="titolo">Symposium</h1>
<p class="presentazione">Il symposium greco era un incontro sociale tra uomini dell'antica Grecia, caratterizzato da conversazioni filosofiche, poesie, musica e bevute di vino. Si svolgeva in un ambiente rilassato 
e spesso comprendeva anche giochi e discussioni 
su vari argomenti, dalla politica alla cultura.</p>
</div>
</div>

<div class="titolo-prod">
<h3 class="titolo-prod">I nostri prodotti..</h3>
</div>
 <div class="grid-container">
  <% if (products != null && products.size() < 5) { %>
         <%
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
      Prodotto bean = (Prodotto) it.next();
  %>
            <div class="product-container" onclick="redirectToProduct(<%= bean.getId() %>)">
                <img class="product-image" src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
                <h3 class="nome"><%= bean.getNome() %></h3>
                <div class="details">
                    <p class="price"><%= bean.getPrezzo() %>€</p>
                    <a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1" class="carrello-button">Carrello</a>
                </div>
            </div>
        <% } %>
        <% } %>
    </div>
    


 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>