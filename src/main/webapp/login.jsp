<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="utilities/css/login.css">
</head>
<body>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<div class="container">
    <div class="form">
        <p class="text-center">Ho già un account</p>
        <form id="loginForm" action="login" method="post" onsubmit="validateLoginForm(event)">
            <div>
                <input class="form-user" type="text" name="username" placeholder="Username" id="username">
                <div id="usernameError" class="error-message">Email is required.</div>
            </div>
            <div>
                <input class="form-pass" type="password" name="password" placeholder="Password" id="password">
                <div id="passwordError" class="error-message">Password is required.</div>
            </div>
            <button class="accedi" type="submit" >ACCEDI</button>
        </form>
        <p class="text-right">Non sei registrato? <a href="register.jsp">Registrati</a></p>
    </div>
</div>

<footer><%@ include file="utilities/footer.jsp" %></footer>

<script src="utilities/js/validation.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</body>
</html>
