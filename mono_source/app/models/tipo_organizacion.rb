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

# = Modelo de Tipo de plantilla
# Esta clase implementa el modelo en el patron MVC para la tabla de tipo_de_plantilla.
# Un tipo de plantilla es una clasificacion de las plantillas que pueden ser utilizados en diferentes proyectos.
# == Atributos
# * id : entero (llave primaria)
# * nombre : string
#
# == Relaciones
# * plantillas: Uno a muchos
#
# == Restricciones
# * nombre: requerido, caracteres alfanumericos, longitud(140), unico
class TipoOrganizacion < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :organizacions, dependent: :destroy
  self.primary_key = 'id'
  validates :name, :presence => true, format: { with:VALID_NAME }, :length => { :maximum => 200 }, uniqueness:true
end
