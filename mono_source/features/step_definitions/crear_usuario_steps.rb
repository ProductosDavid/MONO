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
# =  Crear un usuario
# Aqui se implementan los pasos especificos de los escenarios de prueba de la historia de usuario

####################################################################################################
# TODO:
# PROBAR CREAR CON CAMPOS ROL, IMAGEN
####################################################################################################
# Asignacion de nombre
Dado /^que he introducido un usuario con nombre (.*)$/ do |nombre|
  @nombre = nombre
end

Y /^login (.*)/ do |login|
  @login = login
end

Y /^password (.*)/ do |password|
  @password = password
end

# Persistencia del usuario
Cuando /^se guarde el usuario$/ do

	@usuario = Usuario.new(
	:nombre => "juan",
	:login => "juan",
	:password => "juan")
	@usuario.save

	@usuarios = Usuario.all
    @resultado = "OK"
    @usuarios.each do | usuariotmp |
    
    	#if @resultado == "OK"
    	
			if usuariotmp.login == @login
				
				@resultado = "KO"
			end
  		#end
	end

	if @resultado == "OK"

		@usuario = Usuario.new(
		:nombre => @nombre,
		:login => @login,
		:password => @password)
	
		if !(@usuario.save)
		
			@resultado = "KO"
		else

			url = 'http://pruebasdavid.virtual.uniandes.edu.co:8080/razuna/global/api2/folder.cfc'
			method = '?method=add'
			apikey = '&api_key=8F852FE7C05B44528D696CA9A08125AA'
			user_first_name = '&user_first_name=Juan'
			user_last_name = '&user_last_name=Moreno'
			user_email = '&user_email=jm.moreno743@uniandes.edu.co'
			user_name = '&user_name=jm.moreno743'
			user_pass = '&user_pass=123456'			
			uri = URI(url + method + apikey + user_first_name + user_last_name + user_email + user_name + user_pass)
			puts url + method + apikey + user_first_name + user_last_name + user_email + user_name + user_pass
			#@response = Net::HTTP.get_response(uri) # Invocamos.
			#@resultado = 'OK'
			#listo = @response.body[apikey]
			#if listo == nil
		
				#@resultado = 'KO'
			#end
		end
	end
end

Entonces /^el resultado debe ser (.*)/ do | expecting |

    if !(@resultado == expecting)
    	
    	raise('Fallo')
  	end
end
