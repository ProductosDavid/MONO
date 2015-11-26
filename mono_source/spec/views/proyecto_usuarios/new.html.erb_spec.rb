<!--
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
-->
require 'spec_helper'

describe "proyecto_usuarios/new" do
  before(:each) do
    assign(:proyecto_usuario, stub_model(ProyectoUsuario,
      :proyecto_id => 1,
      :usuario_id => ""
    ).as_new_record)
  end

  it "renders new proyecto_usuario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proyecto_usuarios_path, :method => "post" do
      assert_select "input#proyecto_usuario_proyecto_id", :name => "proyecto_usuario[proyecto_id]"
      assert_select "input#proyecto_usuario_usuario_id", :name => "proyecto_usuario[usuario_id]"
    end
  end
end