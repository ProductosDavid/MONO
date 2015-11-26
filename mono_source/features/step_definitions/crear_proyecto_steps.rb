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
# =  Crear un proyecto
# Aqui se implementan los pasos especificos de los escenarios de prueba de la historia de usuario

####################################################################################################
# TODO:
# PROBAR CREAR CON CAMPOS TIPO, IMAGEN
####################################################################################################
# Asignacion de nombre
Dado /^que he introducido un proyecto con nombre (.*)$/ do |nombre|
  @nombre = nombre
end

Y /^para el proyecto he agregado descripcion (.*)/ do |descripcion|
  @descripcion = descripcion
end

# Persistencia del proyecto
Cuando /^se guarde el proyecto$/ do
  @proyecto = Proyecto.new(
  :nombre => @nombre,
  :descripcion => @descripcion)

  if(@proyecto.save)
    @resultado = "OK"
  else
    @resultado = "KO"
  end
end
