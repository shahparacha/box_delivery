window.Medibolt.Views.BasicInfoShowView = Marionette.ItemView.extend({
  template:JST["basic_info/show"],
	
  events: {
    "click .sendButton": "submitForm"
  },
  
  submitForm: function(event) {
	var that = this;
	event.preventDefault();
	this.checkForm(function(){
	  $.ajax( {
	    url: '/api/v1/users/' + that.model.id.toString(),
	    type: 'PATCH',
	    data: $('.form').serializeJSON(),
     success: function() {
	   Backbone.history.navigate("recommendation", {trigger: true});
     },
	 failure: function() {
		 alert("WE COULD NOT SEND YOUR INFORMATION. PLEASE TRY AGAIN");
	 }
	  });	
	});
  },
  
  checkForm: function(callback){
	var complete = true;
	var $fields = $('.form').find(".field")
    $fields.each(function(index, field){
	  if (field.value.length == 0){
	    complete = false;
		$(field).addClass("warning");
	  } else {
	    $(field).removeClass("warning");
	  }      	
    });
    var checkbox = $('.form').find("#legalCheckBox")[0]
	if (!checkbox.checked){
      complete = false;
      $("#checkboxContainer").addClass("warning");	
	} else {
	  $("#checkboxContainer").removeClass("warning");
	}
	if (complete){
	  callback();	
	}	
  }
});