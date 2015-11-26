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

describe "actividad_revisions/edit" do
  before(:each) do
    @actividad_revision = assign(:actividad_revision, stub_model(ActividadRevision,
      :id => 1,
      :nombre => "MyString",
      :actividad_id => 1,
      :tipo_recurso_id => 1
    ))
  end

  it "renders the edit actividad_revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actividad_revisions_path(@actividad_revision), :method => "post" do
      assert_select "input#actividad_revision_id", :name => "actividad_revision[id]"
      assert_select "input#actividad_revision_nombre", :name => "actividad_revision[nombre]"
      assert_select "input#actividad_revision_actividad_id", :name => "actividad_revision[actividad_id]"
      assert_select "input#actividad_revision_tipo_recurso_id", :name => "actividad_revision[tipo_recurso_id]"
    end
  end
end
