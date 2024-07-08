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
            var form = document.createElement("form");

            form.setAttribute("method", "post");
            form.setAttribute("action", 'home.jsp');

            document.body.appendChild(form);
            form.submit();
        }

        function redirectToOrder(id) {
            var basePath = window.location.origin;
            var form = document.createElement("form");

            form.setAttribute("method", "post");
            form.setAttribute("action", basePath + '/Symposium/ordiniAdmin');

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
    form.setAttribute("action", basePath + '/Symposium/campiProdotto');

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "id");
    hiddenField.setAttribute("value", id);

    form.appendChild(hiddenField);
    document.body.appendChild(form);
    form.submit();
  }