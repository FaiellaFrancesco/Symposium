function validateLoginForm(event) {
    // Preveniamo l'invio del form
    event.preventDefault();

    // Puliamo i messaggi di errore precedenti
    document.getElementById('usernameError').style.display = 'none';
    document.getElementById('passwordError').style.display = 'none';

    // Recuperiamo i valori dei campi
    var username = document.getElementById('username').value.trim();
    var password = document.getElementById('password').value.trim();

    var formIsValid = true;

    // Validazione campo username (deve essere una email)
    if (username === '') {
        document.getElementById('usernameError').textContent = 'Username is required.';
        document.getElementById('usernameError').style.display = 'block';
        formIsValid = false;
    } else if (!isValidEmail(username)) {
        document.getElementById('usernameError').textContent = 'Please enter a valid email address.';
        document.getElementById('usernameError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo password
    if (password === '') {
        document.getElementById('passwordError').textContent = 'Password is required.';
        document.getElementById('passwordError').style.display = 'block';
        formIsValid = false;
    }

    // Se il form è valido, inviamolo
    if (formIsValid) {
		var hashedPassword = hashPassword(password);
        document.getElementById('password').value = hashedPassword;
        event.target.submit();
    }
}

function validateRegisterForm(event) {
    // Preveniamo l'invio del form
    event.preventDefault();

    // Puliamo i messaggi di errore precedenti
    document.getElementById('nomeError').style.display = 'none';
    document.getElementById('cognomeError').style.display = 'none';
    document.getElementById('emailError').style.display = 'none';
    document.getElementById('passwordError').style.display = 'none';

    // Recuperiamo i valori dei campi
    var nome = document.getElementById('nome').value.trim();
    var cognome = document.getElementById('cognome').value.trim();
    var email = document.getElementById('email').value.trim();
    var password = document.getElementById('password').value.trim();

    var formIsValid = true;

    // Validazione campo Nome
    if (nome === '') {
        document.getElementById('nomeError').textContent = 'Nome is required.';
        document.getElementById('nomeError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Cognome
    if (cognome === '') {
        document.getElementById('cognomeError').textContent = 'Cognome is required.';
        document.getElementById('cognomeError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Email
    if (email === '') {
        document.getElementById('emailError').textContent = 'Email is required.';
        document.getElementById('emailError').style.display = 'block';
        formIsValid = false;
    } else if (!isValidEmail(email)) {
        document.getElementById('emailError').textContent = 'Please enter a valid email address.';
        document.getElementById('emailError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Password
    if (password === '') {
        document.getElementById('passwordError').textContent = 'Password is required.';
        document.getElementById('passwordError').style.display = 'block';
        formIsValid = false;
    }

    // Se il form è valido, inviamolo
    if (formIsValid) {
		var hashedPassword = hashPassword(password);
        document.getElementById('password').value = hashedPassword;
        event.target.submit();
    }
}

function isValidEmail(email) {
    // Regex per validare una email
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}

function hashPassword(password) {
    return CryptoJS.SHA512(password).toString(CryptoJS.enc.Hex);
}

