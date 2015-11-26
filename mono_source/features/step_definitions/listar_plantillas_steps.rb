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
# = listar_plantillas_steps.rb
#
# Juan Manuel Moreno B.
# Universidad de Los Andes
#
# == Acerca de
#
# Este artefacto se caracteriza por:
# - Contiene los pasos requeridos por listar_plantillas.feature*
# - No debe ser igual a los pasos de los demas steps
#
# === Descripcion pasos
#
# Dado que en plantillas he introducido una plantilla nueva
#
# Entonces se espera en plantillas ver el resultado en la pagina /plantillas

#Escenario mostrar una lista de plantillas visitando la pagina
Dado /^que en plantillas estoy en la pagina (.*)$/ do | pagina |
  visit pagina
end

Y /^en plantillas he introducido (.*)$/ do | plantilla_1 |

  @plantilla = Plantilla.create(
    :nombre => plantilla_1,
    :descripcion => "Esta es una descripcion",
    :tipo_plantilla_id => 1 )
end

Entonces /^se espera en plantillas ver (.*)$/ do | resultado1 |
  page.should have_content( resultado1 )
end

#Escenario mostrar una lista de plantillas desde menu desde otra pagina
Dado /^que en plantillas desde menu antes he introducido (.*)$/ do | plantilla_1 |

  @plantilla = Plantilla.create(
    :nombre => plantilla_1,
    :descripcion => "Esta es una descripcion",
    :tipo_plantilla_id => 1 )
end

Y /^en plantillas desde menu estoy en la pagina (.*)$/ do | pagina |
  visit pagina
end

Y /^en plantillas desde menu uso la opcion de ver plantillas$/ do
  click_on('Plantillas')
end

Entonces /^se espera en plantillas desde menu ver (.*)$/ do | resultado1 |
  page.should have_content( resultado1 )
end

