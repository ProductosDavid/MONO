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
# =  Crear una organizacion
# Aqui se implementan los pasos especificos de los escenarios de prueba de la historia de usuario

####################################################################################################
# TODO:
####################################################################################################
# Asignacion de nombre
Dado /^que he introducido una organizacion con nombre (.*)$/ do | nombre |
  @nombre = nombre
end

Y /^es una organizacion con direccion (.*)/ do | direccion |
  @direccion = direccion
end

Y /^es una organizacion con nit (.*)/ do | nit |
  @nit = nit
end

# Persistencia de la organizacion
Cuando /^se guarde la organizacion$/ do

	@organizacion = Organizacion.new(
	:nombre => "Casa Spencer",
	:direccion => "arrayanes@yo.com",
	:nit => "1234567")
	@organizacion.save

	@organizaciones = Organizacion.all
    @resultado = "OK"
    @organizaciones.each do | organizaciontmp |
    
    	#if @resultado == "OK"
    	
			if organizaciontmp.nit == @nit
				
				@resultado = "KO"
			end
  		#end
	end

	if @resultado == "OK"

		@organizacion = Organizacion.new(
		:nombre => @nombre,
		:direccion => @direccion,
		:nit => @nit)
	
		if !(@organizacion.save)
		
			@resultado = "KO"
		end
	end
end

Entonces /^el resultado debe ser (.*)/ do | expecting |

    if !(@resultado == expecting)
    	
    	raise('Fallo')
  	end
end
