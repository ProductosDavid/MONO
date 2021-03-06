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
class TareaPresedencium < ActiveRecord::Base
  belongs_to :tarea, :foreign_key => 'predecesora_id'
  belongs_to :tarea, :foreign_key => 'sucesora_id'
  belongs_to :proceso, :foreign_key => 'proceso_id'
  belongs_to :rutum, :foreign_key => 'ruta_id'
  attr_accessible :predecesora_id, :sucesora_id, :tipo_relacion, :proceso_id, :ruta_id, :loop_id
end
