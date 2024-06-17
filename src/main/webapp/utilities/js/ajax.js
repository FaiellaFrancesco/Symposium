/**
 * 
 */

 
function filtro(tipo){
	var tipoVino = tipo;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "catalogoAjax?type=" + encodeURIComponent(tipoVino), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
					var grid = document.getElementsByClassName('grid-container');
		            grid[0].innerHTML="";
		            grid[0].classList.add("grid-container");
					var elementi = document.getElementsByClassName("product-container");
		            while (elementi.length > 0) {
		                elementi[0].parentNode.removeChild(elementi[0]);
		            }
                    var prodotti = JSON.parse(xhr.responseText);
                    prodotti.forEach(function(prodotto){
					var container = document.createElement("div");
					container.classList.add("product-container");
					container.addEventListener('click',function() {
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
            		container.appendChild(img);
            		container.appendChild(title);
            		container.appendChild(details);

            // Aggiunta del prodotto creato al contenitore principale
            		grid[0].appendChild(container);
        			});
                }
            };
            xhr.send();
}