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
  factory :proyecto do |proyecto|
    proyecto.nombre { Faker::Company.name }
    proyecto.descripcion { Faker::Company.catch_phrase }
    proyecto.director "1"
    proyecto.fecha_inicio { Time.now.strftime "%Y-%m-%d" }
    proyecto.fecha_fin { Time.now.strftime "%Y-%m-%d" }
  end
end
