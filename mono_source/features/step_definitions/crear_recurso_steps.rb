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
# =  HU_CR_Crear un recurso (sto379)
# Aqui se implemntan los pasos especificos de los escenarios de prueba de la historia de usuario

# Asignacion de nombre
Dado /^que he introducido un recurso con nombre: (.*)$/ do |nombre|
  @nombre = nombre
end

# Asignacion de tipo
Dado /^que he seleccionado el tipo de recurso: (.*)$/ do |tipo_recurso|
  @tipo_recurso = tipo_recurso
end

# Asignacion de costo
Dado /^cuyo costo es: (\d+)$/ do |costo|
  @costo = costo
end

# Asignacion de numero de unidades
Dado /^el numero de unidades es: (.*)$/ do |unidades|
  @unidades = unidades
end

# Asignacion de resenia
Dado /^la resenia es: (.*)$/ do |descripcion|
  @descripcion = descripcion
end

# Persitencia del recurso
Cuando /^se guarde el recurso$/ do

  @recurso = Recurso.new(
      :nombre => @nombre,
      :tipo_recurso_id => @tipo_recurso,
      :costo => @costo,
      :unidades => @unidades,
      :descripcion => @descripcion )

      @recurso.organizacion_id = 1

      if(@recurso.save)
        @resultado = "OK"
      else
        @resultado = "Error"
      end  
end
