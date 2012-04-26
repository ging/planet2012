
$(document).ready(function() { 
	var currentPosition = 0; 
	var slideWidth = 900; 
	var slides = $('.slide'); 
	var numberOfSlides = slides.length; 
	var slideShowInterval; 
	var speed = 2000; 
	
	slideShowInterval = setInterval(changePosition, speed); 
	slides.wrapAll('<div id="slidesHolder"></div>') 
	slides.css({ 'float' : 'left' });

	$('#slidesHolder').css('width', slideWidth * numberOfSlides); 
	function changePosition() { 
		if(currentPosition == numberOfSlides - 1) { 
			currentPosition = 0; 
			manageNav(currentPosition);
		} 
		else { 
		currentPosition++;
		manageNav(currentPosition); 
		} 
		moveSlide(); 
	} 

	function moveSlide() { 
		$('#slidesHolder') 
			.animate({'marginLeft' : slideWidth*(-currentPosition)}); 
		} 

	manageNav(currentPosition);

	function manageNav(position) {
		if(position==0) {
			$('#leftNav').hide()
		}
		else {
			$('#leftNav').show()
		} 
		if (position==numberOfSlides-1) {
			$('#rightNav').hide()
		} 
		else {
			$('#rightNav').show()
		}
	}
});
