/**
 * 
 */

 
function filtro(tipo){
	var tipoVino = tipo;
            var xhr = new XMLHttpRequest();
            var basePath = window.location.origin + "/Symposium/";
            xhr.open("GET", basePath + "catalogoAjax?type=" + encodeURIComponent(tipoVino), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
					var container = document.getElementById('container');
		            container.innerHTML="";
		            var grid = document.createElement('div');
					grid.classList.add('grid-container');
                    var prodotti = JSON.parse(xhr.responseText);
                    prodotti.forEach(function(prodotto){
					var productcontainer = document.createElement("div");
					productcontainer.classList.add("product-container");
					productcontainer.addEventListener('click',function() {
				        redirectToProduct(prodotto.id);
				    });
					
            // Creazione del div principale del prodotto

            // Creazione dell'elemento immagine
            		var img = document.createElement('img');
            		img.classList.add("product-image");
            		img.src = prodotto.immagine;
            		img.alt = prodotto.nome;

            // Creazione del titolo (h3)
           			var title = document.createElement('h3');
            		title.textContent = prodotto.nome;
            		title.classList.add("nome");
				
					var details = document.createElement('div');
					details.classList.add('details');	
			
            // Creazione del paragrafo per il prezzo
            		var price = document.createElement('p');
            		price.classList.add("price");
            		price.textContent = prodotto.prezzo.toFixed(2) +"€ ";
            		details.appendChild(price);

            // Creazione del link per il pulsante 'Carrello'
            		var carrelloButton = document.createElement('a');
            		carrelloButton.href = 'ControlloProdotto?action=addToC&id='+ prodotto.id +'&quantity=1'; // Inserisci qui il link appropriato per il carrello
            		carrelloButton.textContent = 'Carrello';
            		carrelloButton.classList.add('carrello-button');
            
            		details.appendChild(price);
            		details.appendChild(carrelloButton);
            		productcontainer.appendChild(img);
            		productcontainer.appendChild(title);
            		productcontainer.appendChild(details);

            // Aggiunta del prodotto creato al contenitore principale
            		grid.appendChild(productcontainer);
            		container.appendChild(grid);
        			});
                }
            };
            xhr.send();
}
function ricerca(event){
			event.preventDefault();
            var xhr = new XMLHttpRequest();
            var patternInput = document.getElementById("searchbar");
            pattern = patternInput.value.trim();
            if(pattern !== ""){
	            xhr.open("GET", "catalogoAjax?pattern=" + pattern, true);
	            xhr.onreadystatechange = function() {
	                if (xhr.readyState === 4 && xhr.status === 200) {
						var container = document.getElementById('container');
			            container.innerHTML="";
			            var grid = document.createElement('div');
						grid.classList.add('grid-container');
	                    var prodotti = JSON.parse(xhr.responseText);
	                    prodotti.forEach(function(prodotto){
						var productcontainer = document.createElement("div");
						productcontainer.classList.add("product-container");
						productcontainer.addEventListener('click',function() {
					        redirectToProduct(prodotto.id);
					    });
						
	            // Creazione del div principale del prodotto
	
	            // Creazione dell'elemento immagine
	            		var img = document.createElement('img');
	            		img.classList.add("product-image");
	            		img.src = prodotto.immagine;
	            		img.alt = prodotto.nome;
	
	            // Creazione del titolo (h3)
	           			var title = document.createElement('h3');
	            		title.textContent = prodotto.nome;
	            		title.classList.add("nome");
					
						var details = document.createElement('div');
						details.classList.add('details');	
				
	            // Creazione del paragrafo per il prezzo
	            		var price = document.createElement('p');
	            		price.classList.add("price");
	            		price.textContent = prodotto.prezzo.toFixed(2) +"€ ";
	            		details.appendChild(price);
	
	            // Creazione del link per il pulsante 'Carrello'
	            		var carrelloButton = document.createElement('a');
	            		carrelloButton.href = 'ControlloProdotto?action=addToC&id='+ prodotto.id +'&quantity=1'; // Inserisci qui il link appropriato per il carrello
	            		carrelloButton.textContent = 'Carrello';
	            		carrelloButton.classList.add('carrello-button');
	            
	            		details.appendChild(price);
	            		details.appendChild(carrelloButton);
	            		productcontainer.appendChild(img);
	            		productcontainer.appendChild(title);
	            		productcontainer.appendChild(details);
	
	            // Aggiunta del prodotto creato al contenitore principale
	            		grid.appendChild(productcontainer);
	            		container.appendChild(grid);
	        			});
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

function filterOrders(id) {
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "filtroOrdini?startDate=" + startDate + "&endDate=" + endDate +"&id=" +id, true);

    xhr.onload = function() {
        if (xhr.status === 200) {
            var ordini = JSON.parse(xhr.responseText);
            console.log(ordini);
            displayOrders(ordini);
        } else {
            console.error('Errore durante la richiesta: ' + xhr.status);
        }
    };

    xhr.send();
}

function displayOrders(ordini) {
    var container = document.getElementById('orderTableContainer');
    container.innerHTML = ""; // Pulisce il contenuto precedente della tabella

    if (ordini.length === 0) {
        var noOrdersDiv = document.createElement('div');
        noOrdersDiv.classList.add('no-orders');
        noOrdersDiv.textContent = 'Non ci sono ordini';
        container.appendChild(noOrdersDiv);
        return;
    }

    var table = document.createElement('table');
    table.classList.add('order-table');

    // Intestazione della tabella
    var headerRow = document.createElement('thead');
    var headerCells = ["ID Ordine", "Data Ordine", "Stato", "Città", "Via", "CAP", "Prodotti", "Fattura"];
    headerCells.forEach(function(cellText) {
        var th = document.createElement('th');
        th.textContent = cellText;
        headerRow.appendChild(th);
    });
    table.appendChild(headerRow);

    // Corpo della tabella
    var tbody = document.createElement('tbody');
    ordini.forEach(function(ordine) {
        var row = document.createElement('tr');

        // ID Ordine
        var idCell = document.createElement('td');
        idCell.textContent = ordine.id;
        row.appendChild(idCell);

        // Data Ordine (convertita in formato leggibile)
        var dataCell = document.createElement('td');
        dataCell.textContent = new Date(ordine.data).toLocaleDateString('it-IT');
        row.appendChild(dataCell);

        // Stato
        var statoCell = document.createElement('td');
        statoCell.textContent = ordine.stato;
        row.appendChild(statoCell);

        // Città
        var cittaCell = document.createElement('td');
        cittaCell.textContent = ordine.citta;
        row.appendChild(cittaCell);

        // Via
        var viaCell = document.createElement('td');
        viaCell.textContent = ordine.via;
        row.appendChild(viaCell);

        // CAP
        var capCell = document.createElement('td');
        capCell.textContent = ordine.CAP;
        row.appendChild(capCell);

        // Prodotti (tabella annidata)
        var prodottiCell = document.createElement('td');
        prodottiCell.innerHTML = generateProductTable(ordine.prodotti);
        row.appendChild(prodottiCell);

        // Fattura (pulsante)
        var fatturaCell = document.createElement('td');
        fatturaCell.innerHTML = createFatturaButton(ordine.id);
        row.appendChild(fatturaCell);

        tbody.appendChild(row);
    });

    table.appendChild(tbody);
    container.appendChild(table);
}

// Funzione per generare la tabella dei prodotti
function generateProductTable(prodotti) {
    var table = document.createElement('table');
    table.classList.add('product-table');

    // Intestazione della tabella dei prodotti
    var headerRow = document.createElement('thead');
    var headerCells = ["Prodotto", "IVA", "Quantità", "Prezzo"];
    headerCells.forEach(function(cellText) {
        var th = document.createElement('th');
        th.textContent = cellText;
        headerRow.appendChild(th);
    });
    table.appendChild(headerRow);

    // Corpo della tabella dei prodotti
    var tbody = document.createElement('tbody');
    prodotti.forEach(function(prodotto) {
        var row = document.createElement('tr');

        // Nome Prodotto
        var nomeCell = document.createElement('td');
        nomeCell.textContent = prodotto.nome;
        row.appendChild(nomeCell);

        // IVA
        var ivaCell = document.createElement('td');
        ivaCell.textContent = prodotto.iva;
        row.appendChild(ivaCell);

        // Quantità
        var quantitaCell = document.createElement('td');
        quantitaCell.textContent = prodotto.quant;
        row.appendChild(quantitaCell);

        // Prezzo
        var prezzoCell = document.createElement('td');
        prezzoCell.textContent = prodotto.prezzo.toFixed(2) + '€';
        row.appendChild(prezzoCell);

        tbody.appendChild(row);
    });

    table.appendChild(tbody);
    return table.outerHTML;
}

// Funzione per creare il pulsante "Scarica Fattura"
function createFatturaButton(ordineId) {
    var button = document.createElement('button');
    button.textContent = 'Scarica Fattura';
    button.addEventListener('onclick', function() {
        redirectToFattura(ordineId);
    });
    return button.outerHTML;
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