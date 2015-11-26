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

describe "procesos/new" do
  before(:each) do
    assign(:proceso, stub_model(Proceso,
      :id => 1,
      :nombre => "MyString",
      :descripcion => "MyString",
      :tipo_plantilla_id => 1,
      :proyecto_id => 1
    ).as_new_record)
  end

  it "renders new proceso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procesos_path, :method => "post" do
      assert_select "input#proceso_id", :name => "proceso[id]"
      assert_select "input#proceso_nombre", :name => "proceso[nombre]"
      assert_select "input#proceso_descripcion", :name => "proceso[descripcion]"
      assert_select "input#proceso_tipo_plantilla_id", :name => "proceso[tipo_plantilla_id]"
      assert_select "input#proceso_proyecto_id", :name => "proceso[proyecto_id]"
    end
  end
end
