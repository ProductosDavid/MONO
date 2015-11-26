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

describe "actividad_tipoartefactos/new" do
  before(:each) do
    assign(:actividad_tipoartefacto, stub_model(ActividadTipoartefacto,
      :id => 1,
      :actividad_id => 1,
      :tipo_artefacto_id => 1,
      :modo => "MyString"
    ).as_new_record)
  end

  it "renders new actividad_tipoartefacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actividad_tipoartefactos_path, :method => "post" do
      assert_select "input#actividad_tipoartefacto_id", :name => "actividad_tipoartefacto[id]"
      assert_select "input#actividad_tipoartefacto_actividad_id", :name => "actividad_tipoartefacto[actividad_id]"
      assert_select "input#actividad_tipoartefacto_tipo_artefacto_id", :name => "actividad_tipoartefacto[tipo_artefacto_id]"
      assert_select "input#actividad_tipoartefacto_modo", :name => "actividad_tipoartefacto[modo]"
    end
  end
end
