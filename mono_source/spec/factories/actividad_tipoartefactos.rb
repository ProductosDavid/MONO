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
require 'faker'

FactoryGirl.define do
  factory :actividad_tipoartefacto do |actividad_tipoartefacto|
    actividad_tipoartefacto.actividad_id "1"
    actividad_tipoartefacto.tipo_artefacto_id "1"
    actividad_tipoartefacto.modo "In"
  end
end
