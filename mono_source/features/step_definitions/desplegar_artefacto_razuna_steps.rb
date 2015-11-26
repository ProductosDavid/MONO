=begin
    MONO
    Copyright (C) 2015  Universidad de los Andes
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end
# language: es
# =  Ver tareas asignadas

####################################################################################################
# TODO:
####################################################################################################

# Ver tareas de un usuario
Dado /^que en desplegar artefactos soy el usuario (.*)$/ do |nombre|

	@apikey = '8F852FE7C05B44528D696CA9A08125AA' # API key del usuario razuna requerida para invocar metodos desde una URL
end

Cuando /^en desplegar artefactos consulto el artefacto (.*)$/ do |artefacto|
	
	# Consultamos folder con el nombre
	url = 'http://pruebasdavid.virtual.uniandes.edu.co:8080/razuna/global/api2/folder.cfc'
		method = '?method=searchassets'
			api = '&api_key=' + @apikey
				name = '&searchfor=' + artefacto
	uri = URI(url + method + api)
	@response = Net::HTTP.get_response(uri) # Invocamos.
	@resultado = 'OK'
	listo = @response.body[artefacto]
	if listo == nil

		@resultado = 'KO'
	end
end

Entonces /^en desplegar artefactos se espera el resultado (.*)$/ do |resultado_feature|
	
	if !(@resultado == resultado_feature)
	
		raise('Fallo')
	end
end
