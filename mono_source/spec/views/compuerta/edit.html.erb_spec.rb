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

describe "compuerta/edit" do
  before(:each) do
    @compuertum = assign(:compuertum, stub_model(Compuertum,
      :nombre => "MyString",
      :descripcion => "MyString",
      :tipo => 1,
      :desicion => 1,
      :plantilla => nil
    ))
  end

  it "renders the edit compuertum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compuerta_path(@compuertum), :method => "post" do
      assert_select "input#compuertum_nombre", :name => "compuertum[nombre]"
      assert_select "input#compuertum_descripcion", :name => "compuertum[descripcion]"
      assert_select "input#compuertum_tipo", :name => "compuertum[tipo]"
      assert_select "input#compuertum_desicion", :name => "compuertum[desicion]"
      assert_select "input#compuertum_plantilla", :name => "compuertum[plantilla]"
    end
  end
end
