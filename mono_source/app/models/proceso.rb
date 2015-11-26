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
class Proceso < ActiveRecord::Base
  belongs_to :tipo_plantilla, :foreign_key => 'tipo_plantilla_id'
  belongs_to :proyecto, :foreign_key => 'proyecto_id'
  self.primary_key = 'id'
  attr_accessible :descripcion, :id, :nombre, :proyecto_id, :tipo_plantilla_id, :estado, :lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo, :fechaini, :fechafin

  has_many :actividads, dependent: :destroy
  has_many :tareas, dependent: :destroy
  has_many :compuertus, dependent: :destroy
  has_many :eventos, dependent: :destroy
  has_many :ruta, dependent: :destroy
  has_many :transicion, dependent: :destroy
  has_many :my_js_trees, dependent: :destroy

  validates :nombre, :presence => true

end
