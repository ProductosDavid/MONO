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

describe "recursos/edit" do
  before(:each) do
    @recurso = assign(:recurso, stub_model(Recurso,
      :nombre => "MyString",
      :tipo_recurso => nil,
      :costo => "",
      :unidades => "",
      :descripcion => "MyString",
      :organizacion => nil
    ))
  end

  it "renders the edit recurso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recursos_path(@recurso), :method => "post" do
      assert_select "input#recurso_nombre", :name => "recurso[nombre]"
      assert_select "input#recurso_tipo_recurso", :name => "recurso[tipo_recurso]"
      assert_select "input#recurso_costo", :name => "recurso[costo]"
      assert_select "input#recurso_unidades", :name => "recurso[unidades]"
      assert_select "input#recurso_descripcion", :name => "recurso[descripcion]"
      assert_select "input#recurso_organizacion", :name => "recurso[organizacion]"
    end
  end
end
