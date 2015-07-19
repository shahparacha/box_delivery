window.Medibolt.Collections.Products = Backbone.Collection.extend({
  model: Medibolt.Models.Product,

  url: "/api/v1/products",
	
  anyInvoices: function(){
    var that = this;
    var noInvoices = !this.any(function(product){
      return product.get('invoices').anyInvoices();
    });
    return !noInvoices;
  }

});