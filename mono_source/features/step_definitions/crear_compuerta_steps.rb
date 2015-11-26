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
# =  HU_TP_Crear una compuerta
# Crear compuerta

Dado /^que en crear una compuerta creo una compuerta con nombre (.*) descripcion (.*) tipo de compuerta (.*) y tipo de decision (.*)/ do | nombre, descripcion, tipo_compuerta, tipo_decision |

  @compuerta = Compuertu.new(
    :nombre => nombre,
    :descripcion => descripcion,
    :plantilla_id => 1,
    :tipo => tipo_compuerta,
    :desicion => tipo_decision )
end

Cuando /^en crear una compuerta se guarde la compuerta$/ do

  if (@compuerta.save())
  	@resultado = "OK"
  else
  	@resultado = "KO"
  end
end

Entonces /^en crear una compuerta se espera ver (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end

Dado /^que a un proceso conn nombre (.*) tipo de plantilla (.*) descripcion (.*)$/ do | nombre, tipplant, descripcion |
  @proceso = Proceso.new(
      :nombre => nombre,
      :descripcion => descripcion,
      :tipo_plantilla_id => tipplant
  )
end

Cuando /^se le asocian dos compuertas una con nombre (.*) tipo (.*) plantilla id (.*) y otra con nombre (.*) tipo (.*) plantilla id (.*)$/ do | nomcom1, tipocom1, plancom1, nomcom2, tipocom2, plancom2 |
  @proceso.save!
  @compuerta1 = Compuertu.new(
      :nombre => nomcom1,
      :plantilla_id => plancom1,
      :tipo => tipocom1,
      :desicion => 1 )

    @compuerta1.proceso_id = @proceso.id
    if (@compuerta1.save())
      @resultado1 = "OK"
    else
      @resultado1 = "KO"
    end

  @compuerta2 = Compuertu.new(
      :nombre => nomcom2,
      :plantilla_id => plancom2,
      :tipo => tipocom2,
      :desicion => 1 )

  @compuerta2.proceso_id = @proceso.id
  if (@compuerta2.save())
    @resultado2 = "OK"
  else
    @resultado2 = "KO"
  end
end

Entonces /^se espera que se creen las compuertas asociadas al proceso con un resultado (.*)$/ do | resultado |
  if (@resultado1 != resultado or @resultado2 != resultado)
    raise("Fallo")
  end
end
