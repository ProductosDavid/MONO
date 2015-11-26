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

# = Modelo de Tipo de Recurso
# Esta clase implementa el modelo en el patron MVC para la tabla de tipo_de_recursos.
# Un tipo de recurso es una clasificacion de los recursos que pueden ser utilizados en diferentes proyectos.
# == Atributos
# * id : entero (llave primaria)
# * nombre : string
#
# == Relaciones
# * recursos: Uno a muchos
#
# == Restricciones
# * nombre: requerido, caracteres alfanumericos, longitud(140), unico
class TipoRecurso < ActiveRecord::Base
  attr_accessible :nombre, :id, :cost, :unit
  has_many :recursos, dependent: :destroy
  has_many :actividad_tiporecurso, dependent: :destroy
  has_many :actividads, :through => :actividad_tiporecurso
  self.primary_key = 'id'
  validates :nombre, :presence => true, format: { with:VALID_NAME }, :length => { :maximum => 140 }, uniqueness:true
  validates :unit, :presence => true, format: { with:VALID_UNIDADES }
end
