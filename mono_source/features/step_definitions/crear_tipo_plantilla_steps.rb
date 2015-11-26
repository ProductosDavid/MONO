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
# =  HU_TP_Crear un Tipo de Plantilla
# Crear tipo de plantilla
Dado /^que en tipos de plantillas creo un tipo de plantilla con nombre (.*) y descripcion (.*)$/ do | nombre, descripcion |

  @tipoplantilla = TipoPlantilla.new(
	:nombre => nombre,
	:descripcion => descripcion )  
end

Cuando /^en tipos de plantillas se guarde el tipo de plantilla$/ do

  if (@tipoplantilla.save())
  	@resultado = "OK"
  else
  	@resultado = "KO"
  end
end

Entonces /^en tipos de plantillas se espera ver (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end
