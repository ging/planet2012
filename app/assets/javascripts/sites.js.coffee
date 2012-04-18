# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

initialize = ->
  geocoder = new google.maps.Geocoder()
  latlng = new google.maps.LatLng(-34.397, 150.644)
  myOptions =
    zoom: 8
    center: latlng
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
codeAddress = ->
  address = document.getElementById("address").value
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      map.setCenter results[0].geometry.location
      marker = new google.maps.Marker(
        map: map
        position: results[0].geometry.location
      )
    else
      alert "Geocode was not successful for the following reason: " + status
