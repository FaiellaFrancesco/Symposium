

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
        alert("Ti sei loggato correttamente");
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
        alert("Ti sei registrato correttamente\n Vai al login per accedere");
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
    if (annata === '' || isNaN(annata) || annata<=1900 || annata>=new Date().getFullYear+1) {
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
    document.getElementById('nomeCartaError').style.display = 'none';
    document.getElementById('numeroCartaError').style.display = 'none';
    document.getElementById('scadenzaError').style.display = 'none';
    document.getElementById('cvvError').style.display = 'none';


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
    var nomeCarta = document.getElementById('nomeCarta').value.trim();
    var numeroCarta = document.getElementById('numeroCarta').value.trim();
    var scadenza = document.getElementById('scadenza').value.trim();
    var cvv = document.getElementById('cvv').value.trim();


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
    if (pw.length < 8 && pw !== '') {
        document.getElementById('pwError').textContent = 'Una password è richiesta (Piu di 8 caratteri).';
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
	
	// Validazione nome carta (opzionale)
    if (nomeCarta !== '---' && !isValidCardName(nomeCarta)) {
        document.getElementById('nomeCartaError').innerText = 'Nome sulla carta non valido.';
        document.getElementById('nomeCartaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione numero carta (opzionale)
    if (numeroCarta !== '---' && !isValidCardNumber(numeroCarta)) {
        document.getElementById('numeroCartaError').innerText = 'Numero della carta non valido.';
        document.getElementById('numeroCartaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione scadenza carta (opzionale)
    if (scadenza !== '---' && !isValidScadenza(scadenza)) {
        document.getElementById('scadenzaError').innerText = 'Data di scadenza non valida. Usa MM/AA.';
        document.getElementById('scadenzaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione CVV (opzionale)
    if (cvv !== '---' && !isValidCVV(cvv)) {
        document.getElementById('cvvError').innerText = 'CVV non valido.';
        document.getElementById('cvvError').style.display = 'block';
        formIsValid = false;
    }

    // Controllo di correlazione tra campi opzionali
    if (cvv !== '---' || numeroCarta !== '---' || nomeCarta !== '---' || scadenza !== '---') {
        // Se uno dei campi opzionali è valorizzato, devono essere tutti valorizzati
        if (cvv === '---' || numeroCarta === '---' || nomeCarta === '---' || scadenza === '---') {
            document.getElementById('nomeCartaError').innerText = 'Tutti i dati carta sono necessari.';
            document.getElementById('nomeCartaError').style.display = 'block';
            formIsValid = false;
        }
    }
  

    // Se il form è valido, inviamolo
    if (formIsValid) {
		if(!(pw.trim().length===0)) {
			var hashedPassword = hashPassword(pw);
        	document.getElementById('pw').value = hashedPassword;
		}
        event.target.submit();
    }
}

function validateCheckoutForm(event) {
    // Preveniamo l'invio del form
    event.preventDefault();

    // Puliamo i messaggi di errore precedenti
    const errorIds = ['cittaError', 'indirizzoError', 'capError', 'cartaError', 'cvvError', 'scadenzaError'];
    errorIds.forEach(id => {
        document.getElementById(id).style.display = 'none';
    });

    // Recuperiamo i valori dei campi
    var citta = document.getElementById('citta').value.trim();
    var indirizzo = document.getElementById('indirizzo').value.trim();
    var cap = document.getElementById('cap').value.trim();
    var carta = document.getElementById('carta').value.trim();
    var cvv = document.getElementById('cvv').value.trim();
    var scadenza = document.getElementById('scadenza').value.trim();

    var formIsValid = true;

    // Validazione campo Città
    if (citta === '') {
        document.getElementById('cittaError').textContent = 'La città è richiesta.';
        document.getElementById('cittaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Indirizzo
    if (indirizzo === '') {
        document.getElementById('indirizzoError').textContent = 'L\'indirizzo è richiesto.';
        document.getElementById('indirizzoError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo CAP
    if (!isValidCAP(cap)) {
        document.getElementById('capError').textContent = 'Inserire un CAP valido.';
        document.getElementById('capError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Carta
    if (carta === '' || !isValidCardNumber(carta)) {
        document.getElementById('cartaError').textContent = 'Il numero della carta è richiesto.';
        document.getElementById('cartaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo CVV
    if (cvv === '' || !isValidCVV(cvv)) {
        document.getElementById('cvvError').textContent = 'Il CVV è richiesto.';
        document.getElementById('cvvError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione campo Scadenza
    if (scadenza === '' || !isValidScadenza(scadenza)) {
        document.getElementById('scadenzaError').textContent = 'La data di scadenza è richiesta.';
        document.getElementById('scadenzaError').style.display = 'block';
        formIsValid = false;
    }

    // Validazione correlata tra i campi della carta di credito
    if (carta !== '' || cvv !== '' || scadenza !== '') {
        if (carta === '' || cvv === '' || scadenza === '') {
            document.getElementById('cartaError').textContent = 'Tutti i dati della carta sono necessari.';
            document.getElementById('cartaError').style.display = 'block';
            formIsValid = false;
        }
    }

    // Se il form è valido, inviamolo
    if (formIsValid) {
        event.target.submit();
    }
}


function isValidCAP(cap) {
    return /^[0-9]{5}$/.test(cap); // Esempio per CAP a 5 cifre
}

// Funzione di validazione per il nome sulla carta (esempio, personalizzabile)
function isValidCardName(name) {
    return name.length > 0; // Verifica semplice che il nome sulla carta non sia vuoto
}

// Funzione di validazione per il numero della carta (esempio, personalizzabile)
function isValidCardNumber(number) {
    return /^[0-9]{13,19}$/.test(number); // Verifica semplice per numeri di carta
}

// Funzione di utilità per validare il campo Città
function isValidCity(city) {
	if (city.trim()==='---') {
        return true;
    }
    
    if (city.trim()==='') {
        return true;
    }
    // Utilizziamo una regex per controllare che la città sia composta solo da lettere e spazi
    var cityPattern = /^[A-Za-zÀ-ÖØ-öø-ÿ\s']+$/;
    return cityPattern.test(city);
}

function isValidDateOfBirth(dateOfBirth) {
	if(dateOfBirth=="") return true;
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
    if (phoneNumber.trim() === '---') {
        return true;
    }
    
    if (phoneNumber.trim() === '') {
        return true;
    }

    // Utilizziamo una regex per controllare se il numero è composto solo da cifre numeriche
    var phonePattern = /^\d+$/;
    return phonePattern.test(phoneNumber);
}

function isValidVia(via) {
    // Se il campo Via è vuoto, ritorniamo true (valido)
    if (via.trim()==='---') {
        return true;
    }
    
    if (via.trim()==='') {
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

function isValidCardNumber(numeroCarta) {
	if(numeroCarta.trim()===''){
		return true;
	}
    // Rimuove eventuali spazi dalla stringa
    let cleaned = numeroCarta.replace(/\s/g, '');
    // Verifica se il numero della carta ha esattamente 16 cifre
    return /^\d{16}$/.test(cleaned);
}

function isValidCardName(name) {
    // Il nome della carta dovrebbe essere non vuoto e contenere solo lettere e spazi
    var regex = /^[a-zA-Z\s]+$/;
    if(name.trim()===''){
		return true;
	}
    return regex.test(name.trim());
}

function isValidCVV(cvv) {
    // CVV dovrebbe essere composto da 3 o 4 cifre
    var regex = /^[0-9]{3,4}$/;
    if(cvv.trim()===''){
		return true;
	}
    return regex.test(cvv);
}

function isValidScadenza(scadenza) {
    // Verifica il formato MM/AA
    if(scadenza.trim()===''){
		return true;
	}
    if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(scadenza)) {
        return false;
    }

    // Estrai mese e anno dalla scadenza
    let parts = scadenza.split('/');
    let month = parseInt(parts[0], 10);
    let year = parseInt(parts[1], 10);

    // Ottieni l'anno corrente
    let currentYear = new Date().getFullYear() % 100; // Estrapola gli ultimi due cifre dell'anno corrente

    // La scadenza deve essere nel futuro rispetto all'anno corrente
    if (year < currentYear) {
        return false;
    }

    // Se l'anno è uguale all'anno corrente, il mese deve essere nel futuro
    if (year === currentYear && month <= new Date().getMonth() + 1) {
        return false;
    }

    return true;
}