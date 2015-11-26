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
require 'spec_helper'

describe ProcessRulesController do
  login_user

  describe "GET 'validate_process'" do
    it "validate process" do
      tipo_recurso = FactoryGirl.create(:tipo_recurso, unit: "1")
      usuario = FactoryGirl.create(:usuario, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
      proyecto = FactoryGirl.create(:proyecto, director: usuario.id)
      tipo_plantilla = FactoryGirl.create(:tipo_plantilla)
      plantilla = FactoryGirl.create(:plantilla, tipo_plantilla_id: tipo_plantilla.id)
      myjstree = MyJsTree.new(:parent_id => 0,:position => 0,:type => 'root',:title => plantilla.nombre,:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
      myjstree.save
      myjstree1 = MyJsTree.new(:parent_id => MyJsTree.last().id,:position => 0,:type => 'evento_inicio',:title => 'Inicio',:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
      myjstree1.save
      proceso = FactoryGirl.create(:proceso, tipo_plantilla_id: tipo_plantilla.id, proyecto_id: proyecto.id)
      tarea = FactoryGirl.create(:tarea, proceso_id: proceso.id)
      get :validate_process, {:proceso_id => proceso.id, :publicar => "false", :layout => "actividads", :locale => "es"}
      response.should be_success
    end

    it "publicar process" do
      tipo_recurso = FactoryGirl.create(:tipo_recurso, unit: "1")
      usuario = FactoryGirl.create(:usuario, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
      proyecto = FactoryGirl.create(:proyecto, director: usuario.id)
      tipo_plantilla = FactoryGirl.create(:tipo_plantilla)
      plantilla = FactoryGirl.create(:plantilla, tipo_plantilla_id: tipo_plantilla.id)
      myjstree = MyJsTree.new(:parent_id => 0,:position => 0,:type => 'root',:title => plantilla.nombre,:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
      myjstree.save
      myjstree1 = MyJsTree.new(:parent_id => MyJsTree.last().id,:position => 0,:type => 'evento_inicio',:title => 'Inicio',:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
      myjstree1.save
      proceso = FactoryGirl.create(:proceso, tipo_plantilla_id: tipo_plantilla.id, proyecto_id: proyecto.id)
      tarea = FactoryGirl.create(:tarea, proceso_id: proceso.id)
      get :publicar_proceso, {:proceso_id => proceso.id, :publicar => "true", :layout => "actividads", :locale => "es"}
      response.should be_success
    end
  end


end





