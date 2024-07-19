/**
 * 
 */

 
function filtro(tipo) {
    var tipoVino = tipo;
    var xhr = new XMLHttpRequest();
    var basePath = window.location.origin + "/Symposium/";
    xhr.open("GET", basePath + "catalogoAjax?type=" + encodeURIComponent(tipoVino), true);
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var container = document.getElementById('container');
            container.innerHTML = ""; // Pulisce il contenuto esistente

            var grid = document.createElement('div');
            grid.classList.add('grid-container');

            var prodotti = JSON.parse(xhr.responseText);
            
            prodotti.forEach(function(prodotto) {
                // Creazione del div principale della carta del prodotto
                var productCard = document.createElement('div');
                productCard.classList.add('product-card');
                
                var productContainer = document.createElement('div');
                productContainer.classList.add('product-container');
                productContainer.setAttribute('onclick', 'redirectToProduct(' + prodotto.id + ')');
                
                // Creazione del fronte della carta
                var productFront = document.createElement('div');
                productFront.classList.add('product-front');
                
                var img = document.createElement('img');
                img.classList.add('product-image');
                img.src = prodotto.immagine;
                img.alt = prodotto.nome;
                
                var title = document.createElement('h3');
                title.textContent = prodotto.nome;
                title.classList.add('nome');
                
                var details = document.createElement('div');
                details.classList.add('details');
                
                var price = document.createElement('p');
                price.classList.add('price');
                price.textContent = prodotto.prezzo.toFixed(2) + '€';
                
                details.appendChild(price);
                
                productFront.appendChild(img);
                productFront.appendChild(title);
                productFront.appendChild(details);
                
                // Creazione del retro della carta
                var productBack = document.createElement('div');
                productBack.classList.add('product-back');
                
                var productInfo = document.createElement('div');
                productInfo.classList.add('product-info');
                
                // Funzione per creare paragrafi
                var createParagraph = function(label, value) {
                    var p = document.createElement('p');
                    var b = document.createElement('b');
                    b.textContent = label;
                    p.appendChild(b);
                    p.appendChild(document.createTextNode(' ' + value));
                    return p;
                };

                productInfo.appendChild(createParagraph('Tipologia:', prodotto.tipologia));
                productInfo.appendChild(createParagraph('Provenienza:', prodotto.provenienza));
                productInfo.appendChild(createParagraph('Denominazione:', prodotto.denominazione));
                productInfo.appendChild(createParagraph('Annata:', prodotto.annata));
                productInfo.appendChild(createParagraph('Alcol:', prodotto.alcol + ' %'));
                productInfo.appendChild(createParagraph('Formato:', prodotto.formato + ' cl'));
                
                var carrelloButton = document.createElement('a');
                carrelloButton.href = 'ControlloProdotto?action=addToC&id=' + prodotto.id + '&quantity=1';
                carrelloButton.textContent = 'Aggiungi al Carrello';
                carrelloButton.classList.add('carrello-button');
                
                productBack.appendChild(productInfo);
                productBack.appendChild(carrelloButton);
                
                productContainer.appendChild(productFront);
                productContainer.appendChild(productBack);
                productCard.appendChild(productContainer);
                grid.appendChild(productCard);
            });
            
            container.appendChild(grid);
        }
    };
    xhr.send();
}

function ricerca(event) {
    event.preventDefault();
    var xhr = new XMLHttpRequest();
    var patternInput = document.getElementById("searchbar");
    var pattern = patternInput.value.trim();
    
    if (pattern !== "") {
        xhr.open("GET", "catalogoAjax?pattern=" + pattern, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var container = document.getElementById('container');
                container.innerHTML = ""; // Pulisce il contenuto esistente

                var grid = document.createElement('div');
                grid.classList.add('grid-container');

                var prodotti = JSON.parse(xhr.responseText);
                
                prodotti.forEach(function(prodotto) {
                    // Creazione del div principale del prodotto
                    var productCard = document.createElement('div');
                    productCard.classList.add('product-card');
                    
                    var productContainer = document.createElement('div');
                    productContainer.classList.add('product-container');
                    productContainer.setAttribute('onclick', 'redirectToProduct(' + prodotto.id + ')');

                    // Creazione del fronte della carta
                    var productFront = document.createElement('div');
                    productFront.classList.add('product-front');
                    
                    var img = document.createElement('img');
                    img.classList.add('product-image');
                    img.src = prodotto.immagine;
                    img.alt = prodotto.nome;
                    
                    var title = document.createElement('h3');
                    title.textContent = prodotto.nome;
                    title.classList.add('nome');
                    
                    var details = document.createElement('div');
                    details.classList.add('details');
                    
                    var price = document.createElement('p');
                    price.classList.add('price');
                    price.textContent = prodotto.prezzo.toFixed(2) + '€';
                    
                    details.appendChild(price);
                    
                    productFront.appendChild(img);
                    productFront.appendChild(title);
                    productFront.appendChild(details);
                    
                    // Creazione del retro della carta
                    var productBack = document.createElement('div');
                    productBack.classList.add('product-back');
                    
                    var productInfo = document.createElement('div');
                    productInfo.classList.add('product-info');
                    
                    var tipologia = document.createElement('p');
                    tipologia.innerHTML = `<b>Tipologia: </b>${prodotto.tipologia}`;
                    
                    var provenienza = document.createElement('p');
                    provenienza.innerHTML = `<b>Provenienza: </b>${prodotto.provenienza}`;
                    
                    var denominazione = document.createElement('p');
                    denominazione.innerHTML = `<b>Denominazione: </b>${prodotto.denominazione}`;
                    
                    var annata = document.createElement('p');
                    annata.innerHTML = `<b>Annata: </b>${prodotto.annata}`;
                    
                    var alcol = document.createElement('p');
                    alcol.innerHTML = `<b>Alcol: </b>${prodotto.alcol} %`;
                    
                    var formato = document.createElement('p');
                    formato.innerHTML = `<b>Formato: </b>${prodotto.formato} cl`;

                    productInfo.appendChild(tipologia);
                    productInfo.appendChild(provenienza);
                    productInfo.appendChild(denominazione);
                    productInfo.appendChild(annata);
                    productInfo.appendChild(alcol);
                    productInfo.appendChild(formato);

                    var carrelloButton = document.createElement('a');
                    carrelloButton.href = 'ControlloProdotto?action=addToC&id=' + prodotto.id + '&quantity=1';
                    carrelloButton.textContent = 'Aggiungi al Carrello';
                    carrelloButton.classList.add('carrello-button');
                    
                    productBack.appendChild(productInfo);
                    productBack.appendChild(carrelloButton);
                    
                    productContainer.appendChild(productFront);
                    productContainer.appendChild(productBack);
                    productCard.appendChild(productContainer);
                    grid.appendChild(productCard);
                });
                
                container.appendChild(grid);
            }
        };
        xhr.send();
    }
}


function checkDBEmail(event){
	event.preventDefault();
	var emailInput = document.getElementById('email');
	var email = emailInput.value.trim();
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'checkEmail?email='+encodeURIComponent(email), true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
			var errore = document.getElementById('emailError');
            if (xhr.status === 200) {
                var response = xhr.responseText;
                console.log(response);
                if (response !== "") {
                    errore.textContent = response;
                    errore.style.display="block";
                } else {
					errore.style.display="none";
                    event.target.submit(); // Invia il form se l'email non è già registrata
                    alert("Ti sei registrato con successo, accedi per iniziare ad ordinare");
                }
            } else {
                errore.textContent = "Errore durante il controllo dell'email.";
            }
        }
    };
    xhr.send();
}

document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchbar');
        const suggestionsPanel = document.getElementById('suggestions');

        searchInput.addEventListener('input', function() {
            const searchText = this.value.trim();

            if (searchText === '') {
                suggestionsPanel.style.display = 'none';
                return;
            }

            // Effettua la chiamata Ajax alla servlet Java per ottenere i suggerimenti
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'SearchSuggestionsServlet?pattern=' + encodeURIComponent(searchText), true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var suggestions = JSON.parse(xhr.responseText);
                    displaySuggestions(suggestions);
                }
            };
            xhr.send();
        });

        function displaySuggestions(suggestions) {
            if (suggestions.length === 0) {
                suggestionsPanel.innerHTML = "";
                suggestionsPanel.style.display = 'none';
                return;
            }

            suggestionsPanel.innerHTML = ''; // Pulisce i suggerimenti precedenti

            suggestions.forEach(function(suggestion) {
                const suggestionItem = document.createElement('div');
                suggestionItem.classList.add('suggestion-item');
                suggestionItem.onclick = function() {
                    redirectToProduct(suggestion.id);
                };

                const img = document.createElement('img');
                img.src = suggestion.immagine;
                img.alt = suggestion.nome;

                const productDetails = document.createElement('div');
                productDetails.classList.add('product-details');

                const productName = document.createElement('div');
                productName.classList.add('product-name');
                productName.textContent = suggestion.nome;

                const productDescription = document.createElement('div');
                productDescription.classList.add('product-description');
                productDescription.textContent = suggestion.descrizione;

                productDetails.appendChild(productName);
                productDetails.appendChild(productDescription);

                suggestionItem.appendChild(img);
                suggestionItem.appendChild(productDetails);

                suggestionsPanel.appendChild(suggestionItem);
            });

            suggestionsPanel.style.display = 'block';
        }

        // Chiudi il pannello dei suggerimenti quando si clicca altrove sulla pagina
        document.addEventListener('click', function(event) {
            if (!event.target.matches('#searchbar')) {
                suggestionsPanel.style.display = 'none';
            }
        });
    });