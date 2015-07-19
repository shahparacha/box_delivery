window.Medibolt.Views.MapIndexView = Marionette.CompositeView.extend({
	onRender: function() {
		this.loadDeliveryMap();
	},
	
	template:JST["map/index"],
	
	events: {
		"click #confirmButton": "moveToConfirmation",
	},
	
	loadDeliveryMap: function() {
	  var that = this;
	  var markers = [];
	  
      var mapOptions = {zoom: 15};
	  
	  var mapView = new Backbone.View({id: 'map_canvas'});
	  
	  
	  this.$el.find("#mapContainer").html(mapView.el);
	  
	  var map = new google.maps.Map(mapView.el, mapOptions);
	   
	  var myLocationMarker = new google.maps.Marker({
	      clickable: false,
	      icon: new google.maps.MarkerImage('//maps.gstatic.com/mapfiles/mobile/mobileimgs2.png',
	                                                                 new google.maps.Size(22,22),
	                                                                 new google.maps.Point(0,18),
	                                                                 new google.maps.Point(11,11)),
	      shadow: null,
	      zIndex: 999,
	      map: map
	  });
	  
	  if(navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var pos = new google.maps.LatLng(position.coords.latitude,
	                                       position.coords.longitude);
		  that.coords = {latitude: position.coords.latitude, 
					     longitude: position.coords.longitude
				        };

	      map.setCenter(pos);
		  myLocationMarker.setPosition(pos);
		  that.addMarker(markers, map, pos);
	    }, function() {
	      this.handleNoGeolocation(true);
	    });
		
	  } else {
	    handleNoGeolocation(false);
	  }
      this.addDeliveryMarkerOnClick.call(this, markers, map); 
     },
	 
	 addDeliveryMarkerOnClick: function(markers, map) {
	   var that = this;
       google.maps.event.addListener(map, 'click', function(event) {
  	     if (markers) {
  	       markers.forEach(function(el) {
  	         el.setMap(null);	
  		   });
  	     }
		 that.updateMarkerCoordinates(event);
		 
  	   	 that.addMarker(markers, map, event.latLng);
       });
	 },
	 
	 addMarker: function(markers, map, pos) {
  	   var marker = new google.maps.Marker({
  	     position: pos,
  	     map: map,
  	     animation: google.maps.Animation.DROP,
  	   });
	   
  	   markers.push(marker);	
	 },
	 
	 updateMarkerCoordinates: function(event) {
   	   this.coords.latitude = event.latLng.lat();
   	   this.coords.longitude = event.latLng.lng();
	 },
	 
	 handleNoGeolocation: function(errorFlag) {
	   if (errorFlag) {
	     var content = 'Error: The Geolocation service failed.';
	   } else {
	     var content = 'Error: Your browser doesn\'t support geolocation.';
	   }

	   var options = {
	     map: map,
	     position: new google.maps.LatLng(60, 105),
	     content: content
	   };

	   var infowindow = new google.maps.InfoWindow(options);
	   map.setCenter(options.position);
	 },
	 
	 getMarkerCoordinates: function() {
	   return this.coords;
	 },
	 
	 moveToConfirmation: function() {
       if (this.coords) {
         Backbone.history.navigate("confirm_order", {trigger: true});	
       }	
	 }
});