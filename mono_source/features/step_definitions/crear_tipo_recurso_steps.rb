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
# =  HU_CR_Crear un tipo de Recurso (sto380)
# Aqui se implemntan los pasos especificos de los escenarios de prueba de la historia de usuario

# Asignacion de nombre
Dado /^que he introducido un tipo de recurso con nombre (.*)$/ do |nombre|
  @nombre = nombre
end

Y /^costo (.*)/ do |costo|
  @costo = costo
end

Y /^unidades (.*)/ do |unidades|
  @unidades = unidades
end

# Persistencia del tipo de recurso
Cuando /^se guarde el tipo de recurso$/ do
  @tipoRecurso = TipoRecurso.new(
  :nombre => @nombre,
  :cost => @costo,
  :unit => @unidades)

  if(@tipoRecurso.save)
    @resultado = "OK"
  else
    @resultado = "Error"
  end
  
end

# Presentacion del resultado
Entonces /^el resultado debe ser: (.*)$/ do |resultado|
  if(@resultado != resultado)
    raise("Fallo")
  end
end



