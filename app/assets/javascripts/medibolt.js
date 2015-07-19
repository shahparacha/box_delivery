window.Medibolt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	new Medibolt.Routers.AppRouter();
	Medibolt_Marionette = new Marionette.Application();
	Medibolt_Marionette.addRegions({
	  contentRegion: "#content"	
	});
  	Backbone.history.start();
  }
};

$(document).ready(function(){
  Medibolt.initialize();
});