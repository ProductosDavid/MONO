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
class Usuario < ActiveRecord::Base



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # porque este metodo esta en usuarios?
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def role?(role)
    return self.roles.find_by_name(role).try(:name) == role.to_s
  end

  belongs_to :tipo_recurso, :foreign_key => 'tipo_recurso_id'
  belongs_to :organizacion, :foreign_key => 'organizacion_id'

  has_many :roles_usuarios, dependent: :destroy
  has_many  :roles, :through => :roles_usuarios

  has_many :proyecto_usuarios, dependent: :destroy
  has_many :proyectos, :through => :proyecto_usuarios

  has_many :tarea_participantes, dependent: :destroy
  has_many :tareas, :through => :tarea_participantes

  has_many :tarea_revisions, dependent: :destroy

  attr_accessible :imagen, :login, :nombre, :tipo_recurso_id, :organizacion_id, :password, :password_confirm, :apellidos, :email , :remember_me, :password_confirmation, :roles, :costo, :habilitado
  has_attached_file :imagen, :url => "/images/usuarios/:id_:style.:extension",
                    :path => ":rails_root/public/images/usuarios/:id_:style.img",
                    :default_url => "/images/default/missing_:style.png"

  attr_accessor :imagen_file_name
  attr_accessor :imagen_content_type
  attr_accessor :imagen_file_size
  attr_accessor :imagen_updated_at

  validates_attachment_size :imagen, :less_than => 1.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']

# NUEVO
# validates :password, :presence =>true,
#                   :length => { :minimum => 5, :maximum => 12 },
#                   :confirmation => true
# validates_confirmation_of :password
#
end
