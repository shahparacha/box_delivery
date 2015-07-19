window.Medibolt.Views.ProductsIndexView = Marionette.CompositeView.extend({
	template:JST["products/index"],
	childView: Medibolt.Views.ProductsShowView,
	childViewContainer: "#productsContainer",
	
	
	initialize: function(){
	  this.on("childview:changeCheckoutGreen", this.changeCheckoutGreen);
	  this.on("childview:changeCheckoutGrey", this.changeCheckoutGrey);
	},
	
	events: {
		"click #checkoutButton": "moveToMap"
	},
	
	
	changeCheckoutGreen: function(){
	  $("#checkoutButton").css({"color":"#33CC33"});
	},
	
	changeCheckoutGrey: function(){
	  if  (!this.collection.anyInvoices()) {
	  	$("#checkoutButton").css({"color":"#B8B8B8"});
	  }	
	},
	
	moveToMap:function(event) {
	  if (this.collection.anyInvoices()) {
	    Backbone.history.navigate("map", {trigger: true});	
	  }
	}
	
});