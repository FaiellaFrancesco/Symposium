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
<form  action="" method="get">
<input class="form-user" type="text" name="username" placeholder="Username">
                  
 </form>
 <form action=""><input class="form-pass" type="password" name="password" placeholder="Password"></form>

<button class="accedi">REGISTRATI</button>

<p class="text-right">Sei già registrato? <a href="login.jsp">Login</a></p>
</div>
</div>


 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>