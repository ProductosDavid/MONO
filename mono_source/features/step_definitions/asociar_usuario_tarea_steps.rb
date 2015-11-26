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
# = Asociar usuario tarea
Dado /^que existe una tarea con nombre (.*) descripcion (.*) duracion (.*)$/ do | nombre, descripcion, duracion |
  @tarea = Tarea.new(
      :nombre => nombre,
      :descripcion => descripcion,
      :duracion => duracion,
      :proceso_id => 11
  )
  @tarea.save!
end

Cuando /^tengo un usuario con nombre (.*) tipo recurso (.*) clave (.*) y mail (.*)$/ do | nomusu, tipsusu, clavusu, mailusu |
  @usuario = Usuario.new(
      :nombre => nomusu,
      :tipo_recurso_id => tipsusu,
      :organizacion_id => 11,
      :password => clavusu,
      :password_confirm => clavusu,
      :email => mailusu
  )
  @usuario.save!
end

Entonces /^se espera que se puedan asociar dicho usuario a la tarea con un resultado (.*)$/ do | resultado |
  @tareaparticipante = TareaParticipante.new(
      :tarea_id => @tarea.id,
      :usuario_id => @usuario.id,
      :dedicacion => @tarea.duracion
  )

  if(@tareaparticipante.save())
    @resultado = "OK"
  else
    @resultado = "KO"
  end

  if (@resultado != resultado)
    raise("Fallo")
  end
end
