<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="utilities/css/header.css">
<link rel="stylesheet" href="utilities/css/footer.css">
<link rel="stylesheet" href="utilities/css/carrello.css">
<link rel="stylesheet" href="utilities/css/navbar.css">
<link rel="stylesheet" href="utilities/css/login.css">

</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>


<div class="container">
<div class="form">
<p class="text-center">Crea Account</p>
<form  action="register" method="post">
<div>
<input class="form-user" type="text" name="nome" placeholder="Nome">
</div>  
<div>
<input class="form-user" type="text" name="cognome" placeholder="Cognome">
</div>  
<div>
<input class="form-user" type="text" name="email" placeholder="Email">
</div>   
<div>         
<input class="form-pass" type="password" name="password" placeholder="Password">
</div>
<button class="accedi">REGISTRATI</button>
</form>
<p class="text-right">Sei già registrato? <a href="login.jsp">Login</a></p>
</div>
</div>


 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>