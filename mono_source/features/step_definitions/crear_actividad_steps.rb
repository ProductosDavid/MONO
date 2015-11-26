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
# =  HU_TP_Crear una actividad
# Crear actividad

Dado /^que en crear una actividad creo una actividad con nombre (.*) descripcion (.*) imagen de icono (.*) modo de ejecucion (.*)$/ do | nombre, descripcion, imagen, modo |

	# Creamos arbol
	@my_js_tree = MyJsTree.new(
		:parent_id => 1,
		:position => 1,
		:left => 1,
		:right => 1,
		:title => "este es mi arbol de pruebas",
		:type => 1,
		:level => 1)
	@my_js_tree.save!

  # Validamos imagen.
  type = imagen.split(".")[1]
  if type == "jpg" || type == "bmp" || type == "png"
    @resultado = "OK"
  else
    @resultado = "KO"
  end

  if (@resultado == 'OK')
    @actividad = Actividad.new(
      :nombre => nombre,
      :descripcion => descripcion,
      :modoejecucion => modo,
      :plantilla_id => 1,
	  :duracion => 1,
	  :my_js_tree_id => @my_js_tree.id)
	end
end

Cuando /^en crear una actividad se guarde la actividad$/ do

  if @resultado == "OK"
    if (@actividad.save())
      @resultado = "OK"
    else
      @resultado = "KO"
    end
  end
end

Entonces /^en crear una actividad se espera ver (.+)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end
