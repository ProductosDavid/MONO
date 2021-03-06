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
VALID_NAME = /\w/
VALID_UNIDADES =/[0-9]/
VALID_COSTO =/^\d+\.?\d*$/

# = Modelo de Recurso
# Esta clase implementa el modelo en el patron MVC para la tabla de recursos.
# Un recurso es un elemento que pertenece a una organizacion y es utilizado en un proyecto.
# == Atributos
# * id : entero (llave primaria)
# * nombre : string
# * costo : decimal
# * unidades : entero
#
# == Relaciones
# * tipo de recurso: pertenencia
# * organizacion: pertenencia
#
# == Restricciones
# * nombre: requerido, caracteres alfanumericos, longitud(140), unico
# * descripcion:
# * costo: decimal, requerido
# * unidades: entero, requerido
# * tipo_recurso: requerido
# * organizacion: requerido
class Recurso < ActiveRecord::Base
  belongs_to :tipo_recurso, :foreign_key => 'tipo_recurso_id'
  belongs_to :organizacion, :foreign_key => 'organizacion_id'

  has_many :proyecto_organizacion, dependent: :destroy
  has_many :proyectos, :through => :proyecto_organizacion

  has_many :tarea_recursos, dependent: :destroy
  has_many :tareas, :through => :tarea_recursos

  attr_accessible :costo, :descripcion, :nombre, :unidades, :id,:tipo_recurso, :tipo_recurso_id,:organizacion, :organizacion_id, :habilitado
  self.primary_key = 'id'

  validates :tipo_recurso, :presence => true
  validates :organizacion, :presence => true
  validates :nombre, :presence => true , format: { with:VALID_NAME }, :length => { :maximum => 140 }
  validates :unidades, :presence => true, format: { with:VALID_UNIDADES }
  validates :costo, format: { with:VALID_COSTO }
end
