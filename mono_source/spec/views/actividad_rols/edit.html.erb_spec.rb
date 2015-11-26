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

describe "actividad_rols/edit" do
  before(:each) do
    @actividad_rol = assign(:actividad_rol, stub_model(ActividadRol,
      :id => 1,
      :actividad_id => 1,
      :rol_id => 1
    ))
  end

  it "renders the edit actividad_rol form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actividad_rols_path(@actividad_rol), :method => "post" do
      assert_select "input#actividad_rol_id", :name => "actividad_rol[id]"
      assert_select "input#actividad_rol_actividad_id", :name => "actividad_rol[actividad_id]"
      assert_select "input#actividad_rol_rol_id", :name => "actividad_rol[rol_id]"
    end
  end
end
