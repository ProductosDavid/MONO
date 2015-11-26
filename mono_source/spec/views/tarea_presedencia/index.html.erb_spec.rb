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

describe "tarea_presedencia/index" do
  before(:each) do
    assign(:tarea_presedencia, [
      stub_model(TareaPresedencium,
        :predecesora_id => 1,
        :sucesora_id => 2,
        :tipo_relacion => "Tipo Relacion"
      ),
      stub_model(TareaPresedencium,
        :predecesora_id => 1,
        :sucesora_id => 2,
        :tipo_relacion => "Tipo Relacion"
      )
    ])
  end

  it "renders a list of tarea_presedencia" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Relacion".to_s, :count => 2
  end
end
