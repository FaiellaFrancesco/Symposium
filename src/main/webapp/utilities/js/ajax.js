/**
 * 
 */

 
function filtro(tipo){
	var tipoVino = tipo;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "catalogoAjax?type=" + encodeURIComponent(tipoVino), true);
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
                console.log(suggestions);
                displaySuggestions(suggestions);
            }
        };
        xhr.send();
    });

    function displaySuggestions(suggestions) {
        if (suggestions.length === 0) {
			suggestionsPanel.innerHTML="";
            suggestionsPanel.style.display = 'none';
            return;
        }
		
        const html = suggestions.map(suggestion => `
            <div class="suggestion-item" onclick="redirectToProduct(`+suggestion.id+`)">
                <img src="`+suggestion.immagine+`" alt="`+suggestion.nome+`">
                <span>`+suggestion.nome+`     `+ suggestion.descrizione +`</span>
            </div>
        `).join('');

        suggestionsPanel.innerHTML = html;
        suggestionsPanel.style.display = 'block';
    }

    // Chiudi il pannello dei suggerimenti quando si clicca altrove sulla pagina
    document.addEventListener('click', function(event) {
        if (!event.target.matches('#searchInput')) {
            suggestionsPanel.style.display = 'none';
        }
    });
});