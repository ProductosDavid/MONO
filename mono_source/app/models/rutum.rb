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
class Rutum < ActiveRecord::Base
  belongs_to :plantilla, :foreign_key => 'plantilla_id'
  belongs_to :proceso,  :foreign_key => 'proceso_id'
  belongs_to :my_js_tree,  :foreign_key => 'my_js_tree_id' , dependent: :destroy
  attr_accessible :descripcion, :nombre, :tipo, :plantilla_id, :my_js_tree_id, :proceso_id
  self.primary_key = 'id'

   validates :nombre, :presence => true , format: { with:VALID_NAME }, :length => { :maximum => 140 }
   validates :tipo, :presence => true
end
