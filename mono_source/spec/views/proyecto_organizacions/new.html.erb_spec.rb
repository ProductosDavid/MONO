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

describe "proyecto_organizacions/new" do
  before(:each) do
    assign(:proyecto_organizacion, stub_model(ProyectoOrganizacion,
      :proyecto_id => 1,
      :organizacion_id => 1
    ).as_new_record)
  end

  it "renders new proyecto_organizacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proyecto_organizacions_path, :method => "post" do
      assert_select "input#proyecto_organizacion_proyecto_id", :name => "proyecto_organizacion[proyecto_id]"
      assert_select "input#proyecto_organizacion_organizacion_id", :name => "proyecto_organizacion[organizacion_id]"
    end
  end
end
