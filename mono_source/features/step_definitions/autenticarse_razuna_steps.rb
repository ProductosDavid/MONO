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
# MEJORAR LA FORMA DE ADQUIRIR EL SESSION TOKEN
####################################################################################################

# Ver tareas de un usuario
Dado /^que en autenticarme en razuna soy el usuario (.*)$/ do |nombre|

	@login = nombre
end

Y /^en autenticarme en razuna tengo clave (.*)$/ do |clave|

	@clave = clave
end

Cuando /^en autenticarme en razuna entro/ do
	
	# Consultamos folder con el nombre
	url = 'http://pruebasdavid.virtual.uniandes.edu.co:8080/razuna/global/api/authentication.cfc?hostid=1'
	method = '&method=login'
	user = '&user=' + @login
	pass = '&pass=' + @clave
	passhashed = '&passhashed=0'
	uri = URI(url + method + user + pass + passhashed)

	# FORMA DE ADQUIRIR EL SESSION TOKEN TODO: MEJORARLO
	tutti = open(url + method + user + pass + passhashed).read
	after = tutti.split('sessiontoken&gt;', 2).last
	token = after.split('&lt;/sessiontoken&gt', 2).first
	puts token + ";"
	
	@resultado = 'OK'
	if token == 'Access Denied'

		@resultado = 'KO'
	else

	end
end

Entonces /^en autenticarme en razuna se espera el resultado (.*)$/ do |resultado_feature|
	
	if !(@resultado == resultado_feature)
	
		raise('Fallo')
	end
end

