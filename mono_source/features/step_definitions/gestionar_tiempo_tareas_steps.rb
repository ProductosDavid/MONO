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
# language: es
# =  Ver tareas asignadas

####################################################################################################
# TODO:
####################################################################################################

# Gestionar tiempo de duracion
Dado /^que en gestionar soy usuario (.*)$/ do |nombre|
	@usuario = Usuario.create(
	:nombre => @nombre,
	:login => @nombre)
end

Cuando /^en gestionar estoy en la pagina (.*)$/ do |pagina|
	visit pagina
end

Y /^en gestionar consulto la tarea (.*)$/ do |tarea|
	@tarea = Tarea.new( # creamos la tarea
	:nombre => @tarea
	)
end

Y /^la duracion (\d+)$/ do |duracion|
	@tarea.horas_ejecutadas = @duracion
	@tarea.save
	@tarea_participante = TareaParticipante.create( # creamos asociacion usuario tarea
	:tarea_id => @tarea.id,
	:usuario_id => @usuario.id
	)	
end

Y /^ahora la duracion es (\d+)$/ do |duracion|
	@tarea.horas_ejecutadas = @duracion
	@tarea.save
end

Entonces /^se espera que se muestre la duracion (\d+)$/ do |duracion|
	if !@tarea.horas_ejecutadas == duracion
		raise('Fallo')
	end
end

Y /^NO la duracion (\d+)$/ do |duracion|
	if @tarea.duracion == duracion
		raise('Fallo')
	end
end
