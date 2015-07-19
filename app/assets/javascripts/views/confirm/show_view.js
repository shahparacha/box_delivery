window.Medibolt.Views.ConfirmShowView = Marionette.ItemView.extend({
  template:JST["confirm/show"],
	
  initialize: function() {
	var that = this;
    this.setProductsWithInvoices(function(){
	  that.setTotal();	
    });
  },
  
  render: function() {
    var confirmContent = this.template({ products: this.products });
    this.$el.html(confirmContent);
    return this;
  },
  
  events: {
    "click #sendButton": "sendOrder",
	"click #creditButton": "setCashCredit",
	"click #cashButton": "setCashCredit"
  },
  
  setCashCredit: function(event) {
    this.changeSendOrderColor();
	if (event.currentTarget.id === "creditButton"){
	  this.changeCashCreditButtonColor("credit","cash");
	  this.type = "credit";	
	} else {
	  this.changeCashCreditButtonColor("cash", "credit");
	  this.type = "cash";
	}
  },
  
  changeSendOrderColor: function() {
    $("#sendButton").css({ "color":"#33CC33" });
  },
  
  changeCashCreditButtonColor: function(idToTurnOn,idToTurnOff){
	var elNameTurnOn = "#"+idToTurnOn+"Button";
	var elNameTurnOff = "#"+idToTurnOff+"Button";
		
  	$(elNameTurnOn).css({      "color":"#33CC33",
		                "border-color":"#33CC33"
				 });
    $(elNameTurnOff).css({      "color":"#B8B8B8",
    	                 "border-color":"#B8B8B8"
    			 });
  },
  
  sendOrder: function(event){
	if (this.type) {
	  var data = this.createDataForRequest();
	  $.ajax({
	       	      type: "POST",
	       	       url: "/api/v1/invoices",
	          dataType: 'json',
	       contentType: 'application/json',
	       	      data: JSON.stringify(data),
               success: function() {
     	          Backbone.history.navigate("medication", {trigger: true});
               },
     	       failure: function() {
     	         alert("WE COULD NOT SEND YOUR INFORMATION. PLEASE TRY AGAIN")
     	       }
	  });	
	}
  },
  
  createDataForRequest: function(){
	var productsArr = [];
    this.products.forEach(function(product){
	  var invoices = product.invoicesOrdered();
	  invoices.forEach(function(invoice){
	    productsArr.push({ id: product.get("id"), amount:invoice.get("amount"), quantity: invoice.get("quantity") });	
	  });
    });
	var data = { invoice: { products: productsArr, 
							     type: this.type, 
			   			    longitude: this.options.products.coords.longitude, 
		        		     latitude: this.options.products.coords.latitude
						   }
			   };
			   
    return data;
  },
  
  setTotal: function() {
	var total = 0;
    this.options.products.models.forEach(function(product){
	  var order = product.invoicesOrdered();
	  order.forEach(function(invoice){
	    total += invoice.get("quantity")*invoice.get("price");
	  });
    });
	this.products.total = total;
  },
  
  setProductsWithInvoices: function(callback) {
	var that = this;
	this.products = [];
    this.options.products.forEach(function(product){
	  if (product.get("invoices").anyInvoices()) {
		  that.products.push(product);	
	  }   	
    });
	callback();
  },
});