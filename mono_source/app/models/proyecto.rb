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
class Proyecto < ActiveRecord::Base
  belongs_to :tipo_producto, :foreign_key => 'tipo_producto_id'
  belongs_to :usuario, :foreign_key => 'director'

  has_many :procesos, dependent: :destroy

  has_many :deposito_proyectos, dependent: :destroy
  has_many :depositos, :through => :deposito_proyectos

  has_many :archivo_proyectos, dependent: :destroy
  has_many :archivos, :through => :archivo_proyectos

  has_many :proyecto_usuarios, dependent: :destroy
  has_many :usuarios, :through => :proyecto_usuarios

  has_many :proyecto_artefactos, dependent: :destroy
  has_many :artefactos, :through => :proyecto_artefactos

  has_many :proyecto_recursos, dependent: :destroy
  has_many :recursos, :through => :proyecto_recursos

  has_many :proyecto_organizacion, dependent: :destroy
  has_many :organizacion, :through => :proyecto_organizacion

  attr_accessible :descripcion, :fcreado, :nombre, :id, :fecha_inicio, :fecha_fin, :tipo_producto, :tipo_producto_id,:imagen, :logo, :director, :presupuesto , :proyecto_usuarios , :proyecto_organizacion
   self.primary_key = 'id'
  #validates :tipo_producto, :presence => true
  validates :nombre, :presence => true


  has_attached_file :imagen, :url => "/images/proyectos/:id_:style.:extension",
                    :path => ":rails_root/public/images/proyectos/:id_:style.img",
                    :default_url => "/images/default/missing_:style.png"
  attr_accessor :imagen_file_name
  attr_accessor :imagen_content_type
  attr_accessor :imagen_file_size
  attr_accessor :imagen_updated_at

  validates_attachment_size :imagen, :less_than => 1.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']


end
