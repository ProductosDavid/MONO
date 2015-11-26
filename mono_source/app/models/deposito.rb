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
class Deposito < ActiveRecord::Base
  belongs_to :tipo_deposito, :foreign_key => 'tipo_deposito_id'
  has_many :deposito_proyectos, dependent: :destroy
  has_many :proyectos, :through => :deposito_proyectos
  has_many :archivos
  attr_accessible :contrasena, :fcreado, :nombre, :usuario, :id, :tipo_deposito_id, :tipo_deposito, :descripcion, :cuenta
   self.primary_key = 'id'
  validates_confirmation_of :contrasena
  validates :tipo_deposito, :presence => true
  validates :nombre, :presence => true

end
