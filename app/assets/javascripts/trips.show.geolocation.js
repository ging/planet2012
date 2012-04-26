var s = document.querySelector('#status');


s.innerHTML = "Map:";
s.className = 'success';

var mapcanvas = document.createElement('div');
mapcanvas.id = 'mapcanvas';
mapcanvas.style.height = '200px';
mapcanvas.style.width = '67%';


document.querySelector('article').appendChild(mapcanvas);

var latlng = new google.maps.LatLng(40, -3);

var myOptions = {
zoom: 2,
center: latlng,
mapTypeControl: false,
navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
