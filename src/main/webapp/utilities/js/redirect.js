/**
 * 
 */

function redirectToProduct(productId) {
            var basePath = window.location.origin;
            var form = document.createElement("form");

            form.setAttribute("method", "post");
            form.setAttribute("action", basePath + '/Symposium/product');

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "id");
            hiddenField.setAttribute("value", productId);

            form.appendChild(hiddenField);
            document.body.appendChild(form);
            form.submit();
        }

        function redirectToPage() {
			var basePath = window.location.origin;
            window.location.href=basePath+"/Symposium/home.jsp";
        }
        
        function redirectToAboutUs() {
			var basePath = window.location.origin;
            window.location.href=basePath+"/Symposium/AboutUs.jsp";
        }
        
        function redirectToCarrello() {
			var basePath = window.location.origin;
            window.location.href=basePath+"/Symposium/carrello.jsp";
        }
        
        function redirectToLogout() {
			var basePath = window.location.origin;
            window.location.href=basePath+"/Symposium/logout";
        }

        function redirectToOrder(id) {
            var basePath = window.location.origin;
            var form = document.createElement("form");

            form.setAttribute("method", "post");
            form.setAttribute("action", basePath + '/Symposium/admin/ordiniAdmin');

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "id");
            hiddenField.setAttribute("value", id);

            form.appendChild(hiddenField);
            document.body.appendChild(form);
            form.submit();
        }
  
  function redirectToMod(id){
	var basePath = window.location.origin;
    var form = document.createElement("form");

    form.setAttribute("method", "post");
    form.setAttribute("action", basePath + '/Symposium/admin/campiProdotto');

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "id");
    hiddenField.setAttribute("value", id);

    form.appendChild(hiddenField);
    document.body.appendChild(form);
    form.submit();
  }
  
function redirectToAreaUtente(id) {
		var basePath = window.location.origin;
        // Crea un form nascosto dinamicamente
        var form = document.createElement('form');
        form.method = 'POST'; // Metodo POST
        form.action = basePath+'/Symposium/campiUtente'; // URL dell'azione

        // Aggiungi campi input nascosti per i parametri
        var idInput = document.createElement('input');
        idInput.type = 'hidden';
        idInput.name = 'id'; // Nome del parametro
        idInput.value = id; // Valore del parametro
        form.appendChild(idInput);


        // Aggiungi il form al corpo del documento (nascosto)
        document.body.appendChild(form);

        // Invia il form
        form.submit();
        }

function redirectToProdottiUtente(id){
	// Crea un form nascosto dinamicamente
		var basePath = window.location.origin;
        var form = document.createElement('form');
        form.method = 'POST'; // Metodo POST
        form.action = basePath + '/Symposium/ordiniUtente'; // URL dell'azione

        // Aggiungi campi input nascosti per i parametri
        var idInput = document.createElement('input');
        idInput.type = 'hidden';
        idInput.name = 'id'; // Nome del parametro
        idInput.value = id; // Valore del parametro
        form.appendChild(idInput);


        // Aggiungi il form al corpo del documento (nascosto)
        document.body.appendChild(form);

        // Invia il form
        form.submit();
}


function redirectToFattura(id){
	var basePath = window.location.origin;
	var form = document.createElement('form');
        form.method = 'POST'; // Metodo POST
        form.action = basePath + '/Symposium/Fattura'; // URL dell'azione

        // Aggiungi campi input nascosti per i parametri
        var idInput = document.createElement('input');
        idInput.type = 'hidden';
        idInput.name = 'orderId'; // Nome del parametro
        idInput.value = id; // Valore del parametro
        form.appendChild(idInput);


        // Aggiungi il form al corpo del documento (nascosto)
        document.body.appendChild(form);

        // Invia il form
        form.submit(); 
}