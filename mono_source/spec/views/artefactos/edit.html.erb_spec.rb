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

describe "artefactos/edit" do
  before(:each) do
    @artefacto = assign(:artefacto, stub_model(Artefacto,
      :id => 1,
      :nombre => "MyString",
      :tipo_artefacto_id => 1,
      :imagen => "MyString",
      :descripcion => "MyString"
    ))
  end

  it "renders the edit artefacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artefactos_path(@artefacto), :method => "post" do
      assert_select "input#artefacto_id", :name => "artefacto[id]"
      assert_select "input#artefacto_nombre", :name => "artefacto[nombre]"
      assert_select "input#artefacto_tipo_artefacto_id", :name => "artefacto[tipo_artefacto_id]"
      assert_select "input#artefacto_imagen", :name => "artefacto[imagen]"
      assert_select "input#artefacto_descripcion", :name => "artefacto[descripcion]"
    end
  end
end
