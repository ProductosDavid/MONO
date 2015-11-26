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
require 'rgen/metamodel_builder'
require 'rgen/serializer/xmi20_serializer'

module PnmlHelper

  module PNMLMetamodel

    extend RGen::MetamodelBuilder::ModuleExtension

    class Element < RGen::MetamodelBuilder::MMBase

    end

    class Pnml < Element
      has_attr 'xmlns', String
    end

    class Net < Element
      has_attr 'id', String
      has_attr 'type', String
    end

    class Page < Element
      has_attr 'id', String
    end

    class Place < Element
      has_attr 'id', String
    end

    class Transition < Element
      has_attr 'id', String
    end

    class Arc < Element
      has_attr 'id', String
      has_attr 'source', String
      has_attr 'target', String
    end

    Pnml.contains_many 'Nets',Net, 'container'
    Net.contains_many 'Pages', Page, 'container'
    Page.contains_many 'Places', Place, 'container'
    Page.contains_many 'Arcs', Arc, 'container'
    Page.contains_many 'Transitions', Transition, 'container'

  end

  def generate_pnml_metamodel

    File.open("public/PNMLMetamodel.ecore","w") do |f|
      ser = RGen::Serializer::XMI20Serializer.new(f)
      ser.serialize(PNMLMetamodel.ecore)
    end

    _model = RGen::ModelBuilder.build(PNMLMetamodel) do

      Pnml :xmlns => "" do
        Net :id => "PetriNet01", :name => "PetrinetDummy" do
            Page :id => "PetirnetPage" do
              Place :id => "nodo01"
              Place :id => "nodo02"
              Place :id => "nodo03"
              Transition :id => "transition01"
              Transition :id => "transition02"
              Arc :id => "arco01", :source => "nodo01", :target => "transition01"
              Arc :id => "arco02", :source => "nodo02", :target => "transition01"
              Arc :id => "arco03", :source => "nodo03", :target => "transition02"
              Arc :id => "arco04", :source => "nodo02", :target => "transition02"
            end
        end

      end

    end

    File.open("public/PNMLModel.dsl","w") do |f|
      serializer = RGen::ModelBuilder::ModelSerializer.new(f, PNMLMetamodel.ecore)
      serializer.serialize(_model)
    end

    return "ok"
  end

end
