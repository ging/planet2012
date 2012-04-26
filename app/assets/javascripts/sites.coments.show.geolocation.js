function posicionar(position) {
	document.getElementById('coment_latitude').value=position.coords.latitude;
	document.getElementById('coment_longitude').value=position.coords.longitude;
	document.getElementById('coment_zoom').value=15; 
}

function error_posicionar(msg) {
	var s = document.querySelector('#status');
	s.innerHTML = typeof msg == 'string' ? msg : "failed";
	s.className = 'fail';

	// console.log(arguments);
}

if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(posicionar, error_posicionar);
} else {
	error('not supported');
}



