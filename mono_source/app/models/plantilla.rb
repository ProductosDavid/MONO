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
# = Modelo de plantilla
# Esta clase implementa el modelo en el patron MVC para la tabla de plantillas.
# Una plantilla es el diseño de un proceso utilizado en un proyecto.
# == Atributos
# * id : entero (llave primaria)
# * nombre : string
# * tipo_plantilla_id : entero
# * descripcion : string
# * imagen : file
#
# == Relaciones
# * tipo de plantilla: pertenencia
#
# == Restricciones
# * nombre: requerido, caracteres alfanumericos, longitud(140), unico
# * tipo_plantilla_id: requerido
class Plantilla < ActiveRecord::Base
  belongs_to :tipo_plantilla, :foreign_key => 'tipo_plantilla_id'
  attr_accessible :descripcion,:imagen, :nombre,:id,:tipo_plantilla, :tipo_plantilla_id
  self.primary_key = 'id'

  has_many :actividads, dependent: :destroy
  has_many :compuertus, dependent: :destroy
  has_many :eventos, dependent: :destroy
  has_many :ruta, dependent: :destroy

  has_many :my_js_trees, dependent: :destroy
  
  validates :tipo_plantilla, :presence => true
  validates :nombre, :presence => true , format: { with:VALID_NAME }, :length => { :maximum => 140 }

  has_attached_file :imagen, :url => "/images/plantillas/:id_:style.:extension",
                             #:path => ":rails_root/public/images/plantillas/:id_:style.:extension",
                             :path => ":rails_root/public/images/plantillas/:id_:style.img",
                             :default_url => "/images/default/missing_:style.png"
  attr_accessor :imagen_file_name
  attr_accessor :imagen_content_type
  attr_accessor :imagen_file_size
  attr_accessor :imagen_updated_at

  validates_attachment_size :imagen, :less_than => 1.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']

end
