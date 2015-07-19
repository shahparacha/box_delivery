window.Medibolt.Models.Product = Backbone.Model.extend({
	
	invoicesOrdered: function() {
	  var ordered = [];
	  this.get("invoices").forEach(function(invoice){
	    if (invoice.get("quantity") > 0) {
	      ordered.push(invoice);
	    }
	  });
	  return ordered;
	}

});