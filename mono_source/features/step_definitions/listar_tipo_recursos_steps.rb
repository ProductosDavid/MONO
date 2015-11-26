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
# Simula la creacion de un tipo de recurso para visualización
Cuando /^crea un tipo de recurso con nombre: (.*)$/ do |nombre|
    @tipoRecurso = TipoRecurso.new(
      :nombre => nombre)

      if(!@tipoRecurso.save)
        raise "Fallo!"
      end
end

# Simula la seleccion de un tipo de recurso en la grilla
Dado /^que selecciona un tipo de recurso con el nombre: (.*)$/ do |nombre|
  @tipoRecurso = TipoRecurso.find_by_nombre(nombre)
end

# Simula la edicion de un tipo de recurso en la grilla
Cuando /^modifica del tipo de recurso su nombre: (.*)$/ do |nombre|

  @tipoRecurso.nombre = nombre

  if(!@tipoRecurso.save())
    raise "fallo"
  end
end

# Simula la eliminacion de un tipo de recurso en la grilla
Dado /^confirma la operacion de eliminar el tipo de recurso$/ do
  if(!@tipoRecurso.delete())
    raise "Fallo!"
  end
end
