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

class TipoArtefacto < ActiveRecord::Base
  attr_accessible :descripcion, :id, :nombre
  has_many :archivos, dependent: :destroy
  has_many :actividad_tipoartefactos, dependent: :destroy
  has_many :actividads, :through => :actividad_tipoartefactos
  self.primary_key = 'id'
  validates :nombre, :presence => true, format: { with:VALID_NAME }, :length => { :maximum => 140 }, uniqueness:true
end
