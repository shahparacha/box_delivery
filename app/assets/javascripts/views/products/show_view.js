window.Medibolt.Views.ProductsShowView = Marionette.CompositeView.extend({
    template: JST["products/show"],
	className: 'productsView',
	childView: Medibolt.Views.InvoicesShowView,
	childViewContainer: '.invoicesContainer',
	tagName: 'li',
	
	initialize: function(){
	  var that = this;
	  this.on("childview:changeCheckoutGreen", function(){
	    that.trigger("changeCheckoutGreen");
	  });
	  this.on("childview:changeCheckoutGrey", function(){
	    that.trigger("changeCheckoutGrey");
	  });
	  
	  
	  //move this to invoices collection soon
	  this.collection = new Backbone.Collection();
	  
	  this.collection.anyInvoices = function(){
	    return that.collection.any(function(invoice){
		  return invoice.get("quantity") > 0;
	    });
	  };
	  
	  this.collection.add([{name: "1 GRAM", quantity: 0, price:this.model.get('gram_price'), amount:'gram_price'},
	                       {name: "1/8 OUNCE", quantity: 0, price:this.model.get('eight_ounce_price'), amount: 'eight_ounce_price' },
	                       {name: "1/4 OUNCE", quantity: 0, price:this.model.get('fourth_ounce_price'), amount: 'fourth_ounce_price' },
	                       {name: "1/2 OUNCE", quantity: 0, price:this.model.get('half_ounce_price'), amount: 'half_ounce_price'},
	                       {name: "1 OUNCE", quantity: 0, price:this.model.get('ounce_price'), amount: 'ounce_price'}
					      ]);
	  
	  this.model.set('invoices', this.collection);
	  //end
	  
	  
	}
});