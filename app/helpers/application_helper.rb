# Helpers que estarán disponibles desde todas las vistas
module ApplicationHelper

# Nos permite incluir un javascript.
#	Deprecated: Usar javascript_include_tag en su lugar
def include_javascript (file)
    s = " <script type=\"text/javascript\">" + render(:file => file) + "</script>"
    content_for(:head, raw(s))
end



# Nos permite obtener en formato string el nombre de la ciudad o región pasándo como parámetro latitud y longitud
def get_address(latitude,longitude)
			
		if (!latitude.nil?)
			require 'open-uri'
			require 'json'
			result = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=false").read)
			localidad = "near "+result['results'][0]['address_components'][3]['long_name']
		else
			localidad = ""
		end
		
		localidad	
end



# Añade un marcador en un mapa de google
#	IMPORTANTE: Ha de existir previamente un mapa en pantalla llamado 'map'
def add_gmap_marker (latitude,longitude,text)
	javascript = ""
	if(!latitude.nil?)
		javascript = "<script>						
			latlng = new google.maps.LatLng(#{latitude}, #{longitude});
			marker = new google.maps.Marker({
				position: latlng, 
				map: map, 
				title:'#{text}'
			});
		 	</script>"
	end
	raw(javascript)
end

end
