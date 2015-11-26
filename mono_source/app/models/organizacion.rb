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
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


class Organizacion < ActiveRecord::Base
  belongs_to :organizacions, dependent: :destroy
  belongs_to :tipo_organizacion, :foreign_key => 'tipo_organizacion_id'
  has_many :recursos, dependent: :destroy

  has_many :proyecto_organizacion, dependent: :destroy
  has_many :proyectos, :through => :proyecto_organizacion

  attr_accessible :descripcion, :direccion, :naturaleza, :nit, :nombre, :representante, :telefono, :tipo_organizacion_id
  self.primary_key = 'id'

  #validates :nombre, presence:true, format: { with:VALID_NAME }, :length => { :maximum => 140 }, uniqueness:true
  #validates :descripcion, :length => { :maximum => 255 }
  #validates :nit, presence:true, :length => { :maximum => 10 }
  #validates :direccion, format: { with:VALID_EMAIL_REGEX }
end
