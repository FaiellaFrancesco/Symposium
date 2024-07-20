<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pagina mancante</title>
<link rel="stylesheet" href="/Symposium/utilities/css/error.css">

</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container-err">
<div class="text-container"><h3 class="text">Pagina non esistente!</h3> <h3 class="text2">Ritorna alla <a href="/Symposium/home.jsp">Home</a>.</h3></div>
<div class="img-container">
<img class="imageError" src="/Symposium/immagini/Errore.png"></img>

</div>


</div>



</body>
 <footer>
 <%@ include file="utilities/footer.jsp" %></footer>
</html>