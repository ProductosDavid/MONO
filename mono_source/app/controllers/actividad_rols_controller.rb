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
class ActividadRolsController < ApplicationController
  # GET /actividad_rols
  # GET /actividad_rols.json
  before_filter :authenticate_user!

  def index
    @actividad_rols = ActividadRol.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividad_rols }
    end
  end

  # GET /actividad_rols/1
  # GET /actividad_rols/1.json
  def show
    @actividad_rol = ActividadRol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad_rol }
    end
  end

  # GET /actividad_rols/new
  # GET /actividad_rols/new.json
  def new
    @actividad_rol = ActividadRol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad_rol }
    end
  end

  # GET /actividad_rols/1/edit
  def edit
    @actividad_rol = ActividadRol.find(params[:id])
  end

  # POST /actividad_rols
  # POST /actividad_rols.json
  def create
    @rol_id = Rol.find_by_nombre(params[:rol_name]).id;

    @actividad_rol = ActividadRol.find_by_rol_id_and_actividad_id(@rol_id,params[:actividad_id]);

    if( @actividad_rol == nil)

      @actividad_rol = ActividadRol.new(
          :rol_id => @rol_id,
          :actividad_id => params[:actividad_id]
      )

    end

    if @actividad_rol.save

      redirect_to request.protocol + request.host_with_port + "/actividads/" + params[:actividad_id] + "/edit"

    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @actividad_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actividad_rols/1
  # PUT /actividad_rols/1.json
  def update
    @actividad_rol = ActividadRol.find(params[:id])

    respond_to do |format|
      if @actividad_rol.update_attributes(params[:actividad_rol])
        format.html { redirect_to @actividad_rol, notice: 'Actividad rol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_rols/1
  # DELETE /actividad_rols/1.json
  def destroy
    @actividad_rol = ActividadRol.find(params[:id])
    @actividad_rol.destroy

    respond_to do |format|
      format.html { redirect_to actividad_rols_url }
      format.json { head :no_content }
    end
  end
end
