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

describe ProyectoOrganizacionsController do
  login_user

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new proyecto_organizacion" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso, unit: "1")
        usuario = FactoryGirl.create(:usuario, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        proyecto = FactoryGirl.create(:proyecto, director: usuario.id)
        tipo_recurso1 = FactoryGirl.create(:tipo_recurso, unit: "1")
        tipo_organizacion = FactoryGirl.create(:tipo_organizacion)
        organizacion = FactoryGirl.create(:organizacion, tipo_organizacion_id: tipo_organizacion.id)
        organizacion2 = FactoryGirl.create(:organizacion, tipo_organizacion_id: tipo_organizacion.id)
        expect{
          post :create, {:proyecto_id => proyecto.id, :selected_organizacion => [organizacion,organizacion2]}
        }.to change(ProyectoOrganizacion,:count).by(2)
      end

      it "redirects to the new proyecto_organizacion" do
        tipo_recurso = FactoryGirl.create(:tipo_recurso, unit: "1")
        usuario = FactoryGirl.create(:usuario, tipo_recurso_id: tipo_recurso.id, organizacion_id: @organizacionMaster.id)
        proyecto = FactoryGirl.create(:proyecto, director: usuario.id)
        tipo_recurso1 = FactoryGirl.create(:tipo_recurso, unit: "1")
        tipo_organizacion = FactoryGirl.create(:tipo_organizacion)
        organizacion = FactoryGirl.create(:organizacion, tipo_organizacion_id: tipo_organizacion.id)
        organizacion2 = FactoryGirl.create(:organizacion, tipo_organizacion_id: tipo_organizacion.id)
        post :create, {:proyecto_id => proyecto.id, :selected_organizacion => [organizacion,organizacion2]}
        response.should redirect_to "/proyectos/#{proyecto.id}/configu"
      end
    end
  end
end
