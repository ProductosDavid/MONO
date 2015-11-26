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
  factory :recurso do |recurso|
    recurso.nombre { Faker::Company.name }
    recurso.unidades { Faker::Number.number(2) }
    recurso.costo { Faker::Number.number(6) }
    recurso.descripcion { Faker::Name.title }
    recurso.tipo_recurso_id "2"
    recurso.habilitado 1
  end
end