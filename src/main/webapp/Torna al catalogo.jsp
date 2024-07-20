<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Torna al catalogo</title>
<link rel="stylesheet" href="/Symposium/utilities/css/error.css">
</head>
<body>
<%
   if(request.getAttribute("idOrdine")==null){
	   response.sendRedirect("/home.jsp");
   }
   else {
%>	
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container-err">
<div class="text-container"><h3 class="text">Grazie per l'acquisto!</h3> <h3 class="text2">Vuoi scaricare la fattura? <a href="#" onclick="redirectToFattura(<%= request.getAttribute("idOrdine")%>)">Clicca qui</a>.</h3> <h3 class="text2">Ritorna al <a href="/Symposium/catalogo.jsp">catalogo</a>.</h3></div>
<div class="img-container">
<img class="imageError" src="/Symposium/immagini/vinofelice.jpeg"></img>

</div>


</div>
<%} %>


</body>
<%@ include file="utilities/footer.jsp" %>
</html>