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

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It     demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProcesosController do
  login_user

  describe "GET #index" do
    it "populates an array of procesos" do
      proceso = FactoryGirl.create(:proceso)
      get :index
      assigns(:procesos).should eq([proceso])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new proceso" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso, unit: "1")
        usuario = FactoryGirl.create(:usuario, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        proyecto = FactoryGirl.create(:proyecto, director: usuario.id)
        tipo_plantilla = FactoryGirl.create(:tipo_plantilla)
        plantilla = FactoryGirl.create(:plantilla, tipo_plantilla_id: tipo_plantilla.id)
        myjstree = MyJsTree.new(:parent_id => 0,:position => 0,:type => 'root',:title => plantilla.nombre,:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
        myjstree.save
        myjstree1 = MyJsTree.new(:parent_id => MyJsTree.last().id,:position => 0,:type => 'evento_inicio',:title => 'Inicio',:plantilla_id => plantilla.id,:left => 0,:right => 0,:level => 0)
        myjstree1.save

        expect{
          post :create, {proceso: FactoryGirl.attributes_for(:proceso, tipo_plantilla_id: tipo_plantilla.id, proyecto_id: proyecto.id), :proyecto_id => proyecto.id, :proceso_tipo_plantilla => tipo_plantilla.id, :plantilla => plantilla.id, :proyecto_id => proyecto.id, :lunes => 8, :martes => 8, :miercoles => 8, :jueves => 8, :viernes => 8, :sabado => 4,:domingo =>0, :fini => '2014/07/14', :ffin => '2015/07/14'}
        }.to change(Proceso,:count).by(1)
      end
    end
  end
end
