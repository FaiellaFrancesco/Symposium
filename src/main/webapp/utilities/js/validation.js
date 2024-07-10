

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

function validateProductForm(event) {
    // Preveniamo l'invio del form
    event.preventDefault();

    // Puliamo i messaggi di errore precedenti
    document.getElementById('nomeError').style.display = 'none';
    document.getElementById('prezzoError').style.display = 'none';
    document.getElementById('ivaError').style.display = 'none';
    document.getElementById('descrizioneError').style.display = 'none';
    document.getElementById('stockError').style.display = 'none';
    document.getElementById('alcolError').style.display = 'none';
    document.getElementById('formatoError').style.display = 'none';
    document.getElementById('provenienzaError').style.display = 'none';
    document.getElementById('tipologiaError').style.display = 'none';
    document.getElementById('annataError').style.display = 'none';
    document.getElementById('denominazioneError').style.display = 'none';
    document.getElementById('fileError').style.display = 'none';

    // Recuperiamo i valori dei campi
    var nome = document.getElementById('nome').value.trim();
    var prezzo = document.getElementById('prezzo').value.trim();
    var iva = document.getElementById('iva').value.trim();
    var descrizione = document.getElementById('descrizione').value.trim();
    var stock = document.getElementById('stock').value.trim();
    var alcol = document.getElementById('alcol').value.trim();
    var formato = document.getElementById('formato').value.trim();
    var provenienza = document.getElementById('provenienza').value.trim();
    var tipologia = document.getElementById('tipologia').value;
    var annata = document.getElementById('annata').value.trim();
    var denominazione = document.getElementById('denominazione').value.trim();
    var file = document.querySelector('input[type="file"]').value.trim();

    var formIsValid = true;

    // Validazione campo Nome
    if (nome === '') {
        document.getElementById('nomeError').textContent = 'Un nome è richiesto.';
        document.getElementById('nomeError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Prezzo
    if (prezzo === '' || isNaN(prezzo) || prezzo<=0) {
        document.getElementById('prezzoError').textContent = 'Inserire un prezzo valido.';
        document.getElementById('prezzoError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo IVA
    if (iva === '' || isNaN(iva) || iva<=0 || iva>=100) {
        document.getElementById('ivaError').textContent = 'Inserire un\'IVA valida.';
        document.getElementById('ivaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Descrizione
    if (descrizione === '') {
        document.getElementById('descrizioneError').textContent = 'Inserire una Descrizione valida.';
        document.getElementById('descrizioneError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Stock
    if (stock === '' || isNaN(stock) || stock<0) {
        document.getElementById('stockError').textContent = 'Inserire uno stock valido.';
        document.getElementById('stockError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Alcol
    if (alcol === '' || isNaN(alcol) || alcol<0 || alcol>=100) {
        document.getElementById('alcolError').textContent = 'Inserire una Percentuale valida.';
        document.getElementById('alcolError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Formato
    if (formato === '' || formato<=0 || formato>=1000) {
        document.getElementById('formatoError').textContent = 'Inserire un Formato valido.';
        document.getElementById('formatoError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Provenienza
    if (provenienza === '') {
        document.getElementById('provenienzaError').textContent = 'Inserire Provenienza valida.';
        document.getElementById('provenienzaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Tipologia
    if (tipologia === '') {
        document.getElementById('tipologiaError').textContent = 'Inserire una Tipologia valida.';
        document.getElementById('tipologiaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Annata
    if (annata === '' || isNaN(annata) || annata<=0 || annata>=new Date().getFullYear+1) {
        document.getElementById('annataError').textContent = 'Inserire un\'Annata valida.';
        document.getElementById('annataError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Denominazione
    if (denominazione === '') {
        document.getElementById('denominazioneError').textContent = 'Inserire una Denominazione valida.';
        document.getElementById('denominazioneError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo File (opzionale)
    if (file !== '' && !isValidImage(file)) {
        document.getElementById('fileError').textContent = 'Inserire un\' immagine valida.';
        document.getElementById('fileError').style.display = 'block';
        formIsValid = false;
    }

    // Se il form è valido, inviamolo
    if (formIsValid) {
        event.target.submit();
    }
}

function validateUserForm(event) {
    // Preveniamo l'invio del form
    event.preventDefault();

    // Puliamo i messaggi di errore precedenti
    document.getElementById('nomeError').style.display = 'none';
    document.getElementById('cognomeError').style.display = 'none';
    document.getElementById('emailError').style.display = 'none';
    document.getElementById('pwError').style.display = 'none';
    document.getElementById('telefonoError').style.display = 'none';
    document.getElementById('dataNascitaError').style.display = 'none';
    document.getElementById('viaError').style.display = 'none';
    document.getElementById('capError').style.display = 'none';
    document.getElementById('cittaError').style.display = 'none';


    // Recuperiamo i valori dei campi
    var nome = document.getElementById('nome').value.trim();
    var cognome = document.getElementById('cognome').value.trim();
    var email = document.getElementById('email').value.trim();
    var pw = document.getElementById('pw').value.trim();
    var telefono = document.getElementById('telefono').value.trim();
    var dataNascita = document.getElementById('dataNascita').value.trim();
    var via = document.getElementById('via').value.trim();
    var cap = document.getElementById('cap').value.trim();
    var citta = document.getElementById('citta').value.trim();


    var formIsValid = true;

    // Validazione campo Nome
    if (nome === '') {
        document.getElementById('nomeError').textContent = 'Un nome è richiesto.';
        document.getElementById('nomeError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Cognome
    if (cognome === '') {
        document.getElementById('cognomeError').textContent = 'Un cognome è richiesto.';
        document.getElementById('cognomeError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Email
    if (email === '' || !isValidEmail(email)) {
        document.getElementById('emailError').textContent = 'Inserire un\'email valida.';
        document.getElementById('emailError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Password
    if (pw === '') {
        document.getElementById('pwError').textContent = 'Una password è richiesta.';
        document.getElementById('pwError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Telefono
    if (!isValidPhoneNumber(telefono)) {
    document.getElementById('telefonoError').textContent = 'Inserire un numero di telefono valido.';
    document.getElementById('telefonoError').style.display = 'block';
    formIsValid = false;
}

    // Validazione campo Data di Nascita
    if (!isValidDateOfBirth(dataNascita)) {
        document.getElementById('dataNascitaError').textContent = 'Inserire una data di nascita valida.';
        document.getElementById('dataNascitaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Via
    if (!isValidVia(via)) {
        document.getElementById('viaError').textContent = 'Inserire una via valida.';
        document.getElementById('viaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo CAP
    if (!isValidCAP(cap)) {
        document.getElementById('capError').textContent = 'Inserire un CAP valido.';
        document.getElementById('capError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Città
    if (!isValidCity(citta)) {
    document.getElementById('cittaError').textContent = 'Inserire una città valida.';
    document.getElementById('cittaError').style.display = 'block';
    formIsValid = false;
}
  

    // Se il form è valido, inviamolo
    if (formIsValid) {
        event.target.submit();
    }
}

function isValidCAP(cap) {
    // Se il campo CAP è vuoto, ritorniamo true (valido)
    if (cap.trim() === '') {
        return true;
    }

    // Utilizziamo una regex per controllare che il CAP sia composto solo da cifre numeriche
    var capPattern = /^\d+$/;
    return capPattern.test(cap);
}

// Funzione di utilità per validare il campo Città
function isValidCity(city) {
	if (city.trim() === '') {
        return true;
    }
    // Utilizziamo una regex per controllare che la città sia composta solo da lettere e spazi
    var cityPattern = /^[A-Za-zÀ-ÖØ-öø-ÿ\s']+$/;
    return cityPattern.test(city);
}

function isValidDateOfBirth(dateOfBirth) {
    // Se la data di nascita è vuota, ritorniamo true (valido)
    if (dateOfBirth.trim() === '') {
        return true;
    }

    // Utilizziamo una regex per controllare il formato della data (AAAA-MM-GG)
    var datePattern = /^\d{4}-\d{2}-\d{2}$/;
    return datePattern.test(dateOfBirth);
}

function isValidImage(filename) {
    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
    return allowedExtensions.test(filename);
}

function isValidPhoneNumber(phoneNumber) {
    // Se il numero di telefono è vuoto, ritorniamo true (valido)
    if (phoneNumber.trim() === '') {
        return true;
    }

    // Utilizziamo una regex per controllare se il numero è composto solo da cifre numeriche
    var phonePattern = /^\d+$/;
    return phonePattern.test(phoneNumber);
}

function isValidVia(via) {
    // Se il campo Via è vuoto, ritorniamo true (valido)
    if (via.trim() === '') {
        return true;
    }

    // Utilizziamo una regex per controllare che la Via contenga solo caratteri alfabetici, numeri e spazi
    var viaPattern = /^[a-zA-Z0-9\s]+$/;
    return viaPattern.test(via);
}

function isValidEmail(email) {
    // Regex per validare una email
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}

function hashPassword(password) {
    return CryptoJS.SHA512(password).toString(CryptoJS.enc.Hex);
}

function validateAndCheck(event){
	if(validateRegisterForm(event)){
		checkDBEmail(event);
	}
}
