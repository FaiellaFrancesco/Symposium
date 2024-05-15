<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pagina mancante</title>
<link rel="stylesheet" href="utilities/css/header.css">
<link rel="stylesheet" href="utilities/css/footer.css">
<link rel="stylesheet" href="utilities/css/navbar.css">
<link rel="stylesheet" href="utilities/css/error.css">

</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container">
<div class="text-container"><h3 class="text">Pagina non esistente!</h3> <h3 class="text2">Ritorna alla <a href="home.jsp">Home</a>.</h3></div>
<div class="img-container">
<image class="imageError" src="immagini/test2.jpg"></image>

</div>


</div>



</body>
 <footer>
 <%@ include file="utilities/footer.jsp" %></footer>
</html>