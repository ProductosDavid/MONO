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

describe "compuerta_desicions/index" do
  before(:each) do
    assign(:compuerta_desicions, [
      stub_model(CompuertaDesicion,
        :id => 1,
        :compuerta_id => 2,
        :ruta_id => 3,
        :elegida => false
      ),
      stub_model(CompuertaDesicion,
        :id => 1,
        :compuerta_id => 2,
        :ruta_id => 3,
        :elegida => false
      )
    ])
  end

  it "renders a list of compuerta_desicions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
