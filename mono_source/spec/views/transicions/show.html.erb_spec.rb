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

describe "transicions/show" do
  before(:each) do
    @transicion = assign(:transicion, stub_model(Transicion,
      :id => 1,
      :nombre => "Nombre",
      :tipo_inicio => "Tipo Inicio",
      :incio_id => 2,
      :tipo_fin => "Tipo Fin",
      :fin_id => 3,
      :proceso_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Nombre/)
    rendered.should match(/Tipo Inicio/)
    rendered.should match(/2/)
    rendered.should match(/Tipo Fin/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
