=begin
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
=end
require "spec_helper"

describe ActividadRevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("/actividad_revisions").should route_to("actividad_revisions#index")
    end

    it "routes to #new" do
      get("/actividad_revisions/new").should route_to("actividad_revisions#new")
    end

    it "routes to #show" do
      get("/actividad_revisions/1").should route_to("actividad_revisions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/actividad_revisions/1/edit").should route_to("actividad_revisions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/actividad_revisions").should route_to("actividad_revisions#create")
    end

    it "routes to #update" do
      put("/actividad_revisions/1").should route_to("actividad_revisions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/actividad_revisions/1").should route_to("actividad_revisions#destroy", :id => "1")
    end

  end
end
