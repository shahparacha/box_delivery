window.Medibolt.Routers.AppRouter = Backbone.Router.extend({
  routes:{
              	"basic_info": "basicInfoPage",
	        "recommendation": "recommendationPage",
	          "license_info": "licenseInfoPage",
                "medication": "medicationIndex",
              	       "map": "mapPage",
             "confirm_order": "confirmOrderPage"
  },
  
  basicInfoPage: function() {
	var that = this;
	this.assignUser(function(){
	  var basicInfoView = new Medibolt.Views.BasicInfoShowView({model:that.user});
      Medibolt_Marionette.contentRegion.show(basicInfoView);	
    });	
  },
  
  recommendationPage: function() {
	var that = this;
	this.assignUser(function(){
	  var recView = new Medibolt.Views.RecommendationShowView({model: that.user});
	  Medibolt_Marionette.contentRegion.show(recView);		
	});
  },
  
  licenseInfoPage: function() {
	var that = this;
	this.assignUser(function(){
	  var licenseInfoView = new Medibolt.Views.LicenseInfoShowView({model: that.user});
	  Medibolt_Marionette.contentRegion.show(licenseInfoView);	
	});		
  },
  
  medicationIndex: function() {
    this.products = new Medibolt.Collections.Products();
    this.products.fetch();
    var medicationView = new Medibolt.Views.ProductsIndexView({collection: this.products});
    Medibolt_Marionette.contentRegion.show(medicationView);
  },
  
  mapPage: function() {	 
    if (this.products === undefined || (!this.products.anyInvoices())) {
	   Backbone.history.navigate("medication", {trigger: true});
	   return;
	}
    this.mapView = new Medibolt.Views.MapIndexView();
	Medibolt_Marionette.contentRegion.show(this.mapView);
  },
  
  confirmOrderPage: function() {
    if (this.mapView === undefined) {
      Backbone.history.navigate("map", {trigger: true});
	  return;	
    }
	this.products.coords = this.mapView.getMarkerCoordinates();
	var confirmView = new Medibolt.Views.ConfirmShowView({products:this.products});
	Medibolt_Marionette.contentRegion.show(confirmView);
  },
  
  assignUser: function(callback) {
    if(!this.user) {
      this.user = new Medibolt.Models.User()
	  this.user.fetch();	
    }
	callback();
  }
});