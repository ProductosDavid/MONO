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
# = Incorporar Plantilla  Proceso
Dado /^que en incorporar creo un proceso con nombre (.*) y una actividad (.*)$/ do | proceso_nombre, actividad_nombre |

	@my_js_tree = MyJsTree.new(
		:parent_id => 1,
		:position => 1,
		:left => 1,
		:right => 1,
		:title => "este es mi arbol de pruebas",
		:type => 1,
		:level => 1,
		:proceso_id => 1)
	@my_js_tree.save!
	
    @proceso = Proceso.new(
      :nombre => proceso_nombre,
      :tipo_plantilla_id => 1 )
    @proceso.save!
    
	@actividad = Actividad.new(
	  :nombre => actividad_nombre,
	  :descripcion => actividad_nombre,
	  :modoejecucion => 1,
	  :duracion => 1,
	  :proceso_id => @proceso.id,
	  :my_js_tree_id => @my_js_tree.id)
	@actividad.save!
end

Cuando /^en incorporar asocie la actividad/ do

	@actividad_proceso = Actividad.new(
	  :nombre => @actividad.nombre,
	  :descripcion => @actividad.descripcion,
	  :modoejecucion => @actividad.modoejecucion,
	  :duracion => @actividad.duracion,
	  :proceso_id => @actividad.proceso_id,
	  :my_js_tree_id => @actividad.my_js_tree.id)

    if (@actividad_proceso.save())
      @resultado = "OK"
    else
      @resultado = "KO"
    end
end

Entonces /^en incorporar se espera ver (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end

Dado /^que a un proceso con nombre (.*) tipo de plantilla (.*) descripcion (.*)$/ do | nompro, tipo, despro |
  @proceso = Proceso.new(
      :nombre => nompro,
      :descripcion => despro,
      :tipo_plantilla_id => tipo
  )
  @proceso.save!

  @my_js_tree = MyJsTree.new(
      :parent_id => 1,
      :position => 1,
      :left => 1,
      :right => 1,
      :title => "arbol inicial",
      :type => 1,
      :level => 1,
      :proceso_id => @proceso.id)
  @my_js_tree.save!
end

Cuando /^adiciono dos actividades una con nombre (.*) descripcion (.*) modo revision (.*) y la otra con nombre (.*) descripcion (.*) modo revision (.*)$/ do | actnom1, actdes1, actmod1, actnom2, actdes2, actmod2 |
  @actividad1 = Actividad.new(
      :nombre => actnom1,
      :descripcion => actdes1,
      :modoejecucion => actmod1,
      :proceso_id => @proceso.id,
      :my_js_tree_id => @my_js_tree.id)

      if (@actividad1.save())
        @resultado1 = "OK"
      else
        @resultado1 = "KO"
      end

    @actividad2 = Actividad.new(
        :nombre => actnom2,
        :descripcion => actdes2,
        :modoejecucion => actmod2,
        :proceso_id => @proceso.id,
        :my_js_tree_id => @my_js_tree.id)

      if (@actividad2.save())
        @resultado2 = "OK"
      else
        @resultado2 = "KO"
      end
end

Entonces /^se espera que se creen las actividades con su respectivo arbol y que su resultado sea (.*)$/ do | resultado |
  if (@resultado1 != resultado or @resultado2 != resultado)
    raise("Fallo")
  end
end
