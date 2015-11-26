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

describe TareaRevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("/tarea_revisions").should route_to("tarea_revisions#index")
    end

    it "routes to #new" do
      get("/tarea_revisions/new").should route_to("tarea_revisions#new")
    end

    it "routes to #show" do
      get("/tarea_revisions/1").should route_to("tarea_revisions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tarea_revisions/1/edit").should route_to("tarea_revisions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tarea_revisions").should route_to("tarea_revisions#create")
    end

    it "routes to #update" do
      put("/tarea_revisions/1").should route_to("tarea_revisions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tarea_revisions/1").should route_to("tarea_revisions#destroy", :id => "1")
    end

  end
end
