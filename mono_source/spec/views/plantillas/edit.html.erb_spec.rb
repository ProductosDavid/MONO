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

describe "plantillas/edit" do
  before(:each) do
    @plantilla = assign(:plantilla, stub_model(Plantilla,
      :nombre => "MyString",
      :tipo_plantilla => nil,
      :descripcion => "MyText",
      :logo => "",
      :filename => "MyString"
    ))
  end

  it "renders the edit plantilla form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plantillas_path(@plantilla), :method => "post" do
      assert_select "input#plantilla_nombre", :name => "plantilla[nombre]"
      assert_select "input#plantilla_tipo_plantilla", :name => "plantilla[tipo_plantilla]"
      assert_select "textarea#plantilla_descripcion", :name => "plantilla[descripcion]"
      assert_select "input#plantilla_logo", :name => "plantilla[logo]"
      assert_select "input#plantilla_filename", :name => "plantilla[filename]"
    end
  end
end
