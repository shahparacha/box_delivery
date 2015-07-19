window.Medibolt.Views.InvoicesShowView = Marionette.ItemView.extend({
    template: JST["invoices/show"],
	className: 'productsView',
	tagName: 'li',
	
	events: {
	  "click .less": "minusAmount",
	  "click .more": "addAmount"
	},
	
	modelEvents: {
	  "change": "render"
	},
	
	minusAmount: function(event) {
	  if (this.model.get("quantity") > 0) {
		  this.model.set("quantity", this.model.get("quantity") - 1);
	  }
	  this.trigger("changeCheckoutGrey");
	},
	
	addAmount: function(event) {
	  this.model.set("quantity", this.model.get("quantity") + 1);
	  
	  this.performCheck();
	},
	
	performCheck: function() {
  	  if (this.model.get("quantity") > 0) {
		  this.trigger("changeCheckoutGreen");
  	  }
	}
});