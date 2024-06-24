/**
 * 
 */

 function redirectToProduct(productId) {
	var basePath = window.location.origin;
    window.location.href = basePath + '/Symposium/product?id=' + productId;
  }
  
  function redirectToPage() {
    window.location.href = 'home.jsp' ;
  }
  
  function redirectToOrder(id){
	var basePath = window.location.origin;
	window.location.href = basePath + '/Symposium/ordiniAdmin?id=' + id;
  }