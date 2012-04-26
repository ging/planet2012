function tripMapFunction() {
	// Creates a default map
	map = createMap(0,0,1);
	
	// Get the values for each
	$(".list_parameters").each(function(index,element) {
		
		var lat = $("#latitude",$(this)).html();
		var lng = $("#longitude",$(this)).html();
		var title = $("#name",$(this)).html();
		
		addMarkerToMap(map,lat,lng,title);
	});

	return false;
}

