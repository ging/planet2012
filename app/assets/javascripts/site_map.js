function siteMapFunction() {
	
	var lat = $("#latitude").html();
	var lng = $("#longitude").html();
	var zoom = parseInt($("#zoom").html());
	
	map = createMap(lat,lng,zoom);
	addMarkerToMap(map,lat,lng);
	
	return false;
}

