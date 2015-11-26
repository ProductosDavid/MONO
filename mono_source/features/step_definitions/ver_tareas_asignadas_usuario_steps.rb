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

# Ver tareas de un usuario
Dado /^que soy usuario (.*)$/ do |nombre|
	@usuario = Usuario.create(
	:nombre => @nombre,
	:login => @nombre)
end

Cuando /^estoy en la pagina (.*)$/ do |pagina|
	visit pagina
end

Entonces /^se espera que se muestre la tarea (.*)$/ do |tarea|
	@tarea = Tarea.create( # creamos la tarea
	:nombre => @tarea
	)
	@tarea_participante = TareaParticipante.create( # creamos asociacion usuario tarea
	:tarea_id => @tarea.id,
	:usuario_id => @usuario.id
	)
	#@usuario.save # TODO: Verificar si hay que hacerlo aunque guarde la asociacion
	@tareas = @usuario.tareas.all # Consultamos tareas del usuario
	@resultado = 'KO' # definimos un resultado
	@tareas.each do | t |
		if @tarea.id == t.id
		
			@resultado = 'OK' # definimos un resultado correcto
		end
	end	
	if @resultado == 'KO'
		raise('Fallo')
	end
end

Y /^la tarea (.*)$/ do |tarea|
	@tarea = Tarea.create( # creamos la tarea
	:nombre => @tarea
	)
	@tarea_participante = TareaParticipante.create( # creamos asociacion usuario tarea
	:tarea_id => @tarea.id,
	:usuario_id => @usuario.id
	)
	@tareas = @usuario.tareas.all # Consultamos tareas del usuario
	@resultado = 'KO' # definimos un resultado
	@tareas.each do | t |
		if @tarea.id == t.id
		
			@resultado = 'OK' # definimos un resultado correcto
		end
	end	
	if @resultado == 'KO'
		raise('Fallo')
	end
end

Y /^NO se muestre la tarea (.*)$/ do |tarea|
	@tarea = Tarea.create( # creamos la tarea
	:nombre => @tarea
	)
	#@tarea_participante = TareaParticipante.create( # creamos asociacion usuario tarea
	#:tarea_id => @tarea.id,
	#:usuario_id => @usuario.id
	#)
	@tareas = @usuario.tareas.all # Consultamos tareas del usuario
	@resultado = 'OK' # definimos un resultado
	@tareas.each do | t |
		if @tarea.id == t.id
		
			@resultado = 'KO' # definimos un resultado correcto
		end
	end	
	if @resultado == 'KO'
		raise('Fallo')
	end
end
