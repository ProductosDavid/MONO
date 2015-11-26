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

describe "transicions/new" do
  before(:each) do
    assign(:transicion, stub_model(Transicion,
      :id => 1,
      :nombre => "MyString",
      :tipo_inicio => "MyString",
      :incio_id => 1,
      :tipo_fin => "MyString",
      :fin_id => 1,
      :proceso_id => 1
    ).as_new_record)
  end

  it "renders new transicion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transicions_path, :method => "post" do
      assert_select "input#transicion_id", :name => "transicion[id]"
      assert_select "input#transicion_nombre", :name => "transicion[nombre]"
      assert_select "input#transicion_tipo_inicio", :name => "transicion[tipo_inicio]"
      assert_select "input#transicion_incio_id", :name => "transicion[incio_id]"
      assert_select "input#transicion_tipo_fin", :name => "transicion[tipo_fin]"
      assert_select "input#transicion_fin_id", :name => "transicion[fin_id]"
      assert_select "input#transicion_proceso_id", :name => "transicion[proceso_id]"
    end
  end
end
