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
# =  HU_CR_Listar recurso (sto516)
# Aqui se implemntan los pasos especificos de los escenarios de prueba de la historia de usuario

# Mantenida por semantica
Cuando /^un usuario presiona la opcion crear un recurso$/ do

end

# Simula la creacion de un recurso para visualización
Y /^crea un recurso con nombre: (.*) tipo: (.*) costo: (\d+) unidades: (\d+)$/ do |nombre, tipo, costo, unidades|
    @tipoRecurso = TipoRecurso.find_by_nombre (tipo)

    @recurso = Recurso.new(
      :nombre => nombre,
      :tipo_recurso_id => @tipoRecurso.id,
      :costo => costo,
      :unidades => unidades,
      :descripcion => "" )

      @recurso.organizacion_id = 1

      if(!@recurso.save)
        raise "Fallo!"
      end
end

# Simula la seleccion de un recurso en la grilla
Dado /^que selecciona un recurso con el nombre: (.*)$/ do |nombre|
  @recurso = Recurso.find_by_nombre(nombre)
end

# Simula la eliminacion de un recurso desde la grilla
Dado /^confirma la operacion de eliminar el recurso$/ do
  if(!@recurso.delete())
    raise "Fallo!"
  end
end

# Simula la edicioón de un recurso desde la grilla
Cuando /^modifica del recurso su nombre: ([^"]*), tipo: ([^"]*), costo: (\d+), unidades: (\d+)$/ do |nombre, tipo, costo, unidades|
  @tipoRecurso = TipoRecurso.find_by_nombre (tipo)

  @recurso.nombre = nombre
  @recurso.tipo_recurso_id = @tipoRecurso.id
  @recurso.costo = costo
  @recurso.unidades = unidades

  if(!@recurso.save())
    raise "fallo"
  end
end
