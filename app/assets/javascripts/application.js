// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require cleditor
//= require jquery_ujs
//= require_tree .

function createMap(lat,lng,zoom) {
	
	// Store my position (“y=mylat”, “x=mylong”) in variable “lating” 
	var latlng = new google.maps.LatLng(lat, lng); 
	// Define my Google Maps options in variable “myOptions” 
	var myOptions = { 
		zoom: zoom,              					// Define scale 
	    center: latlng,                       	// Define map center 
	    mapTypeId: google.maps.MapTypeId.ROADMAP   // tipo Roadmad, Satellite, Terrain, Hybrid 
	};
	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	return map;
}

function addMarkerToMap(map,lat,lng,title) {
	// Store my position (“y=mylat”, “x=mylong”) in variable “lating” 
	var latlng = new google.maps.LatLng(lat, lng);
	// Add marker in Google Maps “map” in position defined by “lating” 
	var marker = new google.maps.Marker({ 
		position: latlng, 
	    map: map, 
	    title: title 
	});
	return false;
}