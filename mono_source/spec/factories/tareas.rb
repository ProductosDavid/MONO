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
require 'faker'

FactoryGirl.define do
  factory :tarea do |tarea|
    tarea.nombre { Faker::Company.name }
    tarea.descripcion { Faker::Company.catch_phrase }
    tarea.actividad_id "1"
    tarea.fecha_inicio { Time.now.strftime "%Y-%m-%d" }
    tarea.fecha_fin { Time.now.strftime "%Y-%m-%d" }
    tarea.responsable_id "1"
    tarea.prioridad { Faker::Number.number(1) }
    tarea.comentarios { Faker::Name.title }
    tarea.avance { Faker::Number.number(1) }
    tarea.duracion { Faker::Number.number(1) }
    tarea.horas_planeadas { Faker::Number.number(2) }
    tarea.horas_ejecutadas { Faker::Number.number(1) }
    tarea.inst_num { Faker::Number.number(1) }
    tarea.proceso_id "1"
    tarea.estado { Faker::Number.number(1) }
    tarea.columna "1"
    tarea.hito "false"
    tarea.horas_acumuladas { Faker::Number.number(1) }
    tarea.activada "0"
    tarea.es_aprobacion "false"
    tarea.tarea_revisar_id "1"
    tarea.es_desicion "1"
    tarea.compuerta_id "1"
  end
end
