function get_site_coordenates(){
	var address = document.getElementById('site_name').value;
	var latitude = $.get("/planet/jsonp?address="+address+"&coor=lat", function(data){
		document.getElementById('site_latitude').value = $.trim(data);
});
	var longitude = $.get("/planet/jsonp?address="+address+"&coor=lng", function(data){
		document.getElementById('site_longitude').value = $.trim(data);
});

}
