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
# = Autenticarse

####################################################################################################
# TODO:
####################################################################################################
# Asignacion de nombre
Dado /^que soy un usuario registrado en el sistema/ do

	@usuario = Usuario.new(
	:nombre => 'juan',
	:login => 'juan',
	:password => 'juan123')
	@usuario.save
end

Cuando /^yo me autentico con el login (.*)/ do | loginnombre |

	@login = loginnombre
end

Y /^yo me autentico con la clave (.*)/ do | clave |

	@password = clave
end

Entonces /^se espera al autenticarme el resultado (.*)/ do | expecting |

	@usuarios = Usuario.all
    @resultado = "KO"
    @usuarios.each do | usuariotmp |
    
    	if @resultado == "KO"
    	
			if usuariotmp.login == @login
				
				if usuariotmp.password == @password
					
					@resultado = "OK"
					#break NO FUNCIONA 
				end
			end
  		end
	end
    if !(@resultado == expecting)
    	
    	raise('Fallo')
  	end
end
