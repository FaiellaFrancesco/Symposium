<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione</title>
<link rel="stylesheet" href="utilities/css/header.css">
<link rel="stylesheet" href="utilities/css/footer.css">
<link rel="stylesheet" href="utilities/css/carrello.css">

<link rel="stylesheet" href="utilities/css/login.css">
</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container">
    <div class="form">
        <p class="text-center">Crea Account</p>
        <form id="registerForm" action="register" method="post" onsubmit="validateRegisterForm(event)">
            <div>
                <input class="form-user" type="text" name="Nome" placeholder="Nome" id="nome">
                <div id="nomeError" class="error-message">Nome is required.</div>
            </div>  
            <div>
                <input class="form-user" type="text" name="Cognome" placeholder="Cognome" id="cognome">
                <div id="cognomeError" class="error-message">Cognome is required.</div>
            </div>  
            <div>
                <input class="form-user" type="text" name="email" placeholder="Email" id="email">
                <div id="emailError" class="error-message">Please enter a valid email address.</div>
            </div>   
            <div>         
                <input class="form-pass" type="password" name="password" placeholder="Password" id="password">
                <div id="passwordError" class="error-message">Password is required.</div>
            </div>
            <button class="accedi" type="submit">REGISTRATI</button>
        </form>
        <p class="text-right">Sei già registrato? <a href="login.jsp">Login</a></p>
    </div>
</div>

<footer><%@ include file="utilities/footer.jsp" %></footer>

<script src="utilities/js/validation.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</body>
</html>
