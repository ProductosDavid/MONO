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

describe "actividad_tiporecursos/edit" do
  before(:each) do
    @actividad_tiporecurso = assign(:actividad_tiporecurso, stub_model(ActividadTiporecurso,
      :actividad => nil,
      :tipo_recurso => nil
    ))
  end

  it "renders the edit actividad_tiporecurso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actividad_tiporecursos_path(@actividad_tiporecurso), :method => "post" do
      assert_select "input#actividad_tiporecurso_actividad", :name => "actividad_tiporecurso[actividad]"
      assert_select "input#actividad_tiporecurso_tipo_recurso", :name => "actividad_tiporecurso[tipo_recurso]"
    end
  end
end
