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
# = Gestionar estados tareas

####################################################################################################
# TODO:
####################################################################################################

# Gestionar estados
Dado /^que en gestionar estados soy usuario (.*)$/ do |nombre|
	@usuario = Usuario.create(
	:nombre => @nombre,
	:login => @nombre)
end

Cuando /^en gestionar estados estoy en la pagina (.*)$/ do |pagina|
	visit pagina
end

Y /^en gestionar estados consulto la tarea (.*)$/ do |tarea|
	@tarea = Tarea.new( # creamos la tarea
	:nombre => @tarea
	)
end

Y /^su estado es (.*)$/ do |estado|
	@tarea.estado = @estado
	@tarea.save
	@tarea_participante = TareaParticipante.create( # creamos asociacion usuario tarea
	:tarea_id => @tarea.id,
	:usuario_id => @usuario.id
	)	
	
	# Guardamos cambio de estado.
	@estado_tarea = EstadoTarea.new
	@estado_tarea.tareas_id=@tarea.id
	@estado_tarea.estado_actividads_id=@tarea.estado
	@estado_tarea.save	
end

Y /^ahora su estado es (.*)$/ do |estado|

	# Guardamos estado nuevo.
	@estado_nuevo = @estado
	@tarea.estado = @estado
	@tarea.save
	
	# Guardamos cambio de estado.
	@estado_tarea = EstadoTarea.new
	@estado_tarea.tareas_id=@tarea.id
	@estado_tarea.estado_actividads_id=@tarea.estado
	@estado_tarea.save
end

Entonces /^se espera que se muestre el estado (.*)$/ do |estado|

	if !@tarea.estado == estado
		raise('Fallo')
	end
end

Y /^NO el estado (.*)$/ do |estado|

	if @tarea.estado == estado
		raise('Fallo')
	end
end

Y /^quede registrado en un log de estados/ do

	@estados_tarea = EstadoTarea.all
	@yes = 'KO'
	@estados_tarea.each do | e |
		if e.tareas_id == @tarea.id && e.estado_actividads_id == @estado_nuevo
		
			@yes = 'OK' # definimos un resultado correcto
		end
	end	
	
	if @yes == 'KO'
		raise('Fallo')
	end
end
