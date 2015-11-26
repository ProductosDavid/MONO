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
class CompuertaPreDesicion < ActiveRecord::Base
  belongs_to :compuertu, :foreign_key => 'compuerta_id'
  belongs_to :rutum, :foreign_key => 'ruta_id'
  belongs_to :tarea, :foreign_key => 'tarea_desicion_id'

  attr_accessible :compuerta_id, :elegida, :id, :ruta_id, :tarea_desicion_id
end
