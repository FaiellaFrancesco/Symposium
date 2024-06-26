<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione</title>
<link rel="stylesheet" href="utilities/css/carrello.css">
<link rel="stylesheet" href="utilities/css/login.css">
</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container">
    <div class="form">
        <p class="text-center">Crea Account</p>
        <form id="registerForm" action="register" method="post" onsubmit="validateAndCheck(event)">
            <div>
                <input class="form-user" type="text" name="nome" placeholder="Nome" id="nome" value="${param.nome}">
                <div id="nomeError" class="error-message ${requestScope.errori.contains('nome') ? 'error-visible' : ''}">Nome is required.</div>
            </div>  
            <div>
                <input class="form-user" type="text" name="cognome" placeholder="Cognome" id="cognome" value="${param.cognome}">
                <div id="cognomeError" class="error-message ${requestScope.errori.contains('cognome') ? 'error-visible' : ''}">Cognome is required.</div>
            </div>  
            <div>
                <input class="form-user" type="text" name="email" placeholder="Email" id="email" value="${param.email}">
                <div id="emailError" class="error-message ${requestScope.errori.contains('email') ? 'error-visible' : ''}">Please enter a valid email address.</div>
            </div>   
            <div>         
                <input class="form-pass" type="password" name="password" placeholder="Password" id="password" maxlength="16">
                <div id="passwordError" class="error-message ${requestScope.errori.contains('password') ? 'error-visible' : ''}">Password is required and must be longer than 8 characters.</div>
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
