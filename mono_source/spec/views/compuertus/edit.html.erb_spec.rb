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

describe "compuertus/edit" do
  before(:each) do
    @compuertu = assign(:compuertu, stub_model(Compuertu,
      :nombre => "MyString",
      :descripcion => "MyString",
      :tipo => 1,
      :desicion => 1,
      :plantilla => nil
    ))
  end

  it "renders the edit compuertu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compuertus_path(@compuertu), :method => "post" do
      assert_select "input#compuertu_nombre", :name => "compuertu[nombre]"
      assert_select "input#compuertu_descripcion", :name => "compuertu[descripcion]"
      assert_select "input#compuertu_tipo", :name => "compuertu[tipo]"
      assert_select "input#compuertu_desicion", :name => "compuertu[desicion]"
      assert_select "input#compuertu_plantilla", :name => "compuertu[plantilla]"
    end
  end
end
