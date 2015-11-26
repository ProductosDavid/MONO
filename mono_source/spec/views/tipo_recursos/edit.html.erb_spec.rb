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

describe "tipo_recursos/edit" do
  before(:each) do
    @tipo_recurso = assign(:tipo_recurso, stub_model(TipoRecurso,
      :nombre => "MyString"
    ))
  end

  it "renders the edit tipo_recurso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tipo_recursos_path(@tipo_recurso), :method => "post" do
      assert_select "input#tipo_recurso_nombre", :name => "tipo_recurso[nombre]"
    end
  end
end
