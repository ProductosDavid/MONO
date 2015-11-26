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
class TareaAprobacionsController < ApplicationController
  # GET /tarea_aprobacions
  # GET /tarea_aprobacions.json
  def index
    @tarea_aprobacions = TareaAprobacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tarea_aprobacions }
    end
  end

  # GET /tarea_aprobacions/1
  # GET /tarea_aprobacions/1.json
  def show
    @tarea_aprobacion = TareaAprobacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarea_aprobacion }
    end
  end

  # GET /tarea_aprobacions/new
  # GET /tarea_aprobacions/new.json
  def new
    @tarea_aprobacion = TareaAprobacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea_aprobacion }
    end
  end

  # GET /tarea_aprobacions/1/edit
  def edit
    @tarea_aprobacion = TareaAprobacion.find(params[:id])
  end

  # POST /tarea_aprobacions
  # POST /tarea_aprobacions.json
  def create
    @tarea_aprobacion = TareaAprobacion.new(params[:tarea_aprobacion])

    respond_to do |format|
      if @tarea_aprobacion.save
        format.html { redirect_to @tarea_aprobacion, notice: 'Tarea aprobacion was successfully created.' }
        format.json { render json: @tarea_aprobacion, status: :created, location: @tarea_aprobacion }
      else
        format.html { render action: "new" }
        format.json { render json: @tarea_aprobacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tarea_aprobacions/1
  # PUT /tarea_aprobacions/1.json
  def update
    @tarea_aprobacion = TareaAprobacion.find(params[:id])

    respond_to do |format|
      if @tarea_aprobacion.update_attributes(params[:tarea_aprobacion])
        format.html { redirect_to @tarea_aprobacion, notice: 'Tarea aprobacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarea_aprobacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarea_aprobacions/1
  # DELETE /tarea_aprobacions/1.json
  def destroy
    @tarea_aprobacion = TareaAprobacion.find(params[:id])
    @tarea_aprobacion.destroy

    respond_to do |format|
      format.html { redirect_to tarea_aprobacions_url }
      format.json { head :no_content }
    end
  end
end
