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

describe "tarea_presedencia/edit" do
  before(:each) do
    @tarea_presedencium = assign(:tarea_presedencium, stub_model(TareaPresedencium,
      :predecesora_id => 1,
      :sucesora_id => 1,
      :tipo_relacion => "MyString"
    ))
  end

  it "renders the edit tarea_presedencium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tarea_presedencia_path(@tarea_presedencium), :method => "post" do
      assert_select "input#tarea_presedencium_predecesora_id", :name => "tarea_presedencium[predecesora_id]"
      assert_select "input#tarea_presedencium_sucesora_id", :name => "tarea_presedencium[sucesora_id]"
      assert_select "input#tarea_presedencium_tipo_relacion", :name => "tarea_presedencium[tipo_relacion]"
    end
  end
end
