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
class MergeCompuerta < ActiveRecord::Base
  belongs_to :proceso,  :foreign_key => 'proceso_id'
  belongs_to :ruta, :foreign_key => 'ruta_id'
  belongs_to :plantilla, :foreign_key => 'plantilla_id'
  belongs_to :merge,  :foreign_key => 'merge_id', dependent: :destroy

  attr_accessible :proceso_id, :ruta_id, :plantilla_id, :merge_id
  self.primary_key = 'id'
end
