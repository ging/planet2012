function success() {
  
  var latitude = parseFloat(document.getElementById('latitude').value);
  var longitude = parseFloat(document.getElementById('longitude').value);
  var zoomlevel = parseFloat(document.getElementById('zoom').value);
  

  
  var s = document.querySelector('#status');
  
  if (s.className == 'success') {
    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
    return;
  }
  
  if(document.getElementById('latitude').value != ""){  
 	s.innerHTML = "Map:";
  	s.className = 'success';
  	
  	var mapcanvas = document.createElement('div');
	mapcanvas.id = 'mapcanvas';
	mapcanvas.style.height = '200px';
	mapcanvas.style.width = '260px';


	document.querySelector('article').appendChild(mapcanvas);

	var latlng = new google.maps.LatLng(latitude, longitude);
	var myOptions = {
	zoom: zoomlevel,
	center: latlng,
	mapTypeControl: false,
	navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
	mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

	var marker = new google.maps.Marker({
	position: latlng, 
	map: map, 
	title:"You are here!"
	});
  }else{
  	s.innerHTML = "There are no coordenates to show map";
  	s.className = 'success';
  }
  
  
}





