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
class MyJsTree < ActiveRecord::Base
   has_one :actividad, dependent: :destroy
   has_one :compuertu, dependent: :destroy
   has_one :evento, dependent: :destroy
   has_one :rutum, dependent: :destroy
   belongs_to :plantilla, :foreign_key => 'plantilla_id'
   belongs_to :proceso,  :foreign_key => 'proceso_id'

  has_many :hijos, :class_name => "MyJsTree",
    :foreign_key => "MyJsTree_id"
  belongs_to :padre, :class_name => "MyJsTree", dependent: :delete


  self.inheritance_column=:_type_disable
  attr_accessible :left, :level, :parent_id, :position, :right, :title, :type, :plantilla_id, :proceso_id
end
