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

describe "proyecto_artefactos/edit" do
  before(:each) do
    @proyecto_artefacto = assign(:proyecto_artefacto, stub_model(ProyectoArtefacto,
      :proyecto_id => 1,
      :artefacto_id => 1
    ))
  end

  it "renders the edit proyecto_artefacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proyecto_artefactos_path(@proyecto_artefacto), :method => "post" do
      assert_select "input#proyecto_artefacto_proyecto_id", :name => "proyecto_artefacto[proyecto_id]"
      assert_select "input#proyecto_artefacto_artefacto_id", :name => "proyecto_artefacto[artefacto_id]"
    end
  end
end
