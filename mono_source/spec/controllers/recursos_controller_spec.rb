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

describe RecursosController do
  login_user

  describe "GET #index" do
    it "populates an array of recursos" do
      tipo_recurso = FactoryGirl.create(:tipo_recurso)
      recurso = FactoryGirl.create(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
      get :index
      assigns(:recursos).should eq([recurso])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new recurso" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        expect{
          post :create, {:idTart => "", recurso: FactoryGirl.attributes_for(:recurso, tipo_recurso_id: tipo_recurso.id)}
        }.to change(Recurso,:count).by(1)
      end

      it "redirects to the new recurso" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        post :create, {:idTart => "", recurso: FactoryGirl.attributes_for(:recurso, tipo_recurso_id: tipo_recurso.id)}
        response.should render_template :index
      end
    end
  end

  describe "POST update" do
    context "with valid attributes" do
      it "changes @recurso's attributes" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        recursoNew = FactoryGirl.create(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        recursoUpdate = FactoryGirl.build(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        expect{
          post :create, {:idTart => recursoNew.id, :recurso => {:nombre => recursoUpdate.nombre, :unidades => recursoUpdate.unidades, :costo => recursoUpdate.costo, :descripcion => recursoUpdate.descripcion}}
        }.to change(Recurso,:count).by(0)
        recursoBD = Recurso.find_by_id(recursoNew.id)
        recursoBD.nombre.should eq(recursoUpdate.nombre)
        recursoBD.unidades.should eq(recursoUpdate.unidades)
        recursoBD.costo.should eq(recursoUpdate.costo)
        recursoBD.descripcion.should eq(recursoUpdate.descripcion)
      end

      it "redirects to the updated recurso" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        recursoNew = FactoryGirl.create(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        recursoUpdate = FactoryGirl.build(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        post :create, {:idTart => recursoNew.id, :recurso => {:nombre => recursoUpdate.nombre, :unidades => recursoUpdate.unidades, :costo => recursoUpdate.costo, :descripcion => recursoUpdate.descripcion}}
        response.should render_template :index
      end
    end
  end

  describe "POST deshabilitar" do
    context "with valid attributes" do
      it "changes @recurso's habilitado to deshabilitado" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        recursoNew = FactoryGirl.create(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        expect{
          post :deshabilitar, {:idTartE => recursoNew.id}
        }.to change(Recurso,:count).by(0)
        recursoBD = Recurso.find_by_id(recursoNew.id)
        (recursoBD.habilitado == "\x01" ? true : false).should == false
      end

      it "changes @recurso's deshabilitado to habilitado" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso)
        recursoNew = FactoryGirl.create(:recurso, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id, habilitado: 0)
        expect{
          post :deshabilitar, {:idTartE => recursoNew.id}
        }.to change(Recurso,:count).by(0)
        recursoBD = Recurso.find_by_id(recursoNew.id)
        (recursoBD.habilitado == "\x01" ? true : false).should == true
      end
    end
  end
end