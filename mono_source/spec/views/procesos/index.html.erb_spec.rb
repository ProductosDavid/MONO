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

describe "procesos/index" do
  before(:each) do
    assign(:procesos, [
      stub_model(Proceso,
        :id => 1,
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :tipo_plantilla_id => 2,
        :proyecto_id => 3
      ),
      stub_model(Proceso,
        :id => 1,
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :tipo_plantilla_id => 2,
        :proyecto_id => 3
      )
    ])
  end

  it "renders a list of procesos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
