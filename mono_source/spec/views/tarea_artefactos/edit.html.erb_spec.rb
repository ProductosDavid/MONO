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

describe "tarea_artefactos/edit" do
  before(:each) do
    @tarea_artefacto = assign(:tarea_artefacto, stub_model(TareaArtefacto,
      :id => 1,
      :tarea_id => 1,
      :artefacto_id => 1,
      :modo => "MyString"
    ))
  end

  it "renders the edit tarea_artefacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tarea_artefactos_path(@tarea_artefacto), :method => "post" do
      assert_select "input#tarea_artefacto_id", :name => "tarea_artefacto[id]"
      assert_select "input#tarea_artefacto_tarea_id", :name => "tarea_artefacto[tarea_id]"
      assert_select "input#tarea_artefacto_artefacto_id", :name => "tarea_artefacto[artefacto_id]"
      assert_select "input#tarea_artefacto_modo", :name => "tarea_artefacto[modo]"
    end
  end
end
