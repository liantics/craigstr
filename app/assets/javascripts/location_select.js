$(function(){

	$('#choose_location').on( 'click', function(){ 
		var choose_location = $("#choose_location");
		var location_id = $("#location_id").val()
		var new_path = window.location.pathname + "/" + location_id
		choose_location.html("loading form ...")
		window.location = new_path

	  return false;
	});

	
});