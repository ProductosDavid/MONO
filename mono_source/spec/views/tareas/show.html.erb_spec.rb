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

describe "tareas/show" do
  before(:each) do
    @tarea = assign(:tarea, stub_model(Tarea,
      :id => 1,
      :nombre => "Nombre",
      :descripcion => "Descripcion",
      :actividad_id => 2,
      :responsable_id => 3,
      :estado => "Estado",
      :prioridad => 4,
      :comentarios => "Comentarios",
      :avance => 1.5,
      :esfuerzo => 5,
      :unidad_esfuerzo => "Unidad Esfuerzo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Nombre/)
    rendered.should match(/Descripcion/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Estado/)
    rendered.should match(/4/)
    rendered.should match(/Comentarios/)
    rendered.should match(/1.5/)
    rendered.should match(/5/)
    rendered.should match(/Unidad Esfuerzo/)
  end
end
