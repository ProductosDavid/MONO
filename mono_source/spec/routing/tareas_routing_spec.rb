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

describe TareasController do
  describe "routing" do

    it "routes to #index" do
      get("/tareas").should route_to("tareas#index")
    end

    it "routes to #new" do
      get("/tareas/new").should route_to("tareas#new")
    end

    it "routes to #show" do
      get("/tareas/1").should route_to("tareas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tareas/1/edit").should route_to("tareas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tareas").should route_to("tareas#create")
    end

    it "routes to #update" do
      put("/tareas/1").should route_to("tareas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tareas/1").should route_to("tareas#destroy", :id => "1")
    end

  end
end
