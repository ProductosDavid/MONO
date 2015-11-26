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

describe "tareas/new" do
  before(:each) do
    assign(:tarea, stub_model(Tarea,
      :id => 1,
      :nombre => "MyString",
      :descripcion => "MyString",
      :actividad_id => 1,
      :responsable_id => 1,
      :estado => "MyString",
      :prioridad => 1,
      :comentarios => "MyString",
      :avance => 1.5,
      :esfuerzo => 1,
      :unidad_esfuerzo => "MyString"
    ).as_new_record)
  end

  it "renders new tarea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tareas_path, :method => "post" do
      assert_select "input#tarea_id", :name => "tarea[id]"
      assert_select "input#tarea_nombre", :name => "tarea[nombre]"
      assert_select "input#tarea_descripcion", :name => "tarea[descripcion]"
      assert_select "input#tarea_actividad_id", :name => "tarea[actividad_id]"
      assert_select "input#tarea_responsable_id", :name => "tarea[responsable_id]"
      assert_select "input#tarea_estado", :name => "tarea[estado]"
      assert_select "input#tarea_prioridad", :name => "tarea[prioridad]"
      assert_select "input#tarea_comentarios", :name => "tarea[comentarios]"
      assert_select "input#tarea_avance", :name => "tarea[avance]"
      assert_select "input#tarea_esfuerzo", :name => "tarea[esfuerzo]"
      assert_select "input#tarea_unidad_esfuerzo", :name => "tarea[unidad_esfuerzo]"
    end
  end
end
