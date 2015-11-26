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
class EstadoTareasController < ApplicationController
  before_filter :authenticate_user!

  # GET /estado_tareas
  # GET /estado_tareas.json
  def index
    @estado_tareas = EstadoTarea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estado_tareas }
    end
  end

  # GET /estado_tareas/1
  # GET /estado_tareas/1.json
  def show
    @estado_tarea = EstadoTarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estado_tarea }
    end
  end

  # GET /estado_tareas/new
  # GET /estado_tareas/new.json
  def new
    @estado_tarea = EstadoTarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estado_tarea }
    end
  end

  # GET /estado_tareas/1/edit
  def edit
    @estado_tarea = EstadoTarea.find(params[:id])
  end

  # POST /estado_tareas
  # POST /estado_tareas.json
  def create
    @estado_tarea = EstadoTarea.new(params[:estado_tarea])

    respond_to do |format|
      if @estado_tarea.save
        format.html { redirect_to @estado_tarea, notice: 'Estado tarea was successfully created.' }
        format.json { render json: @estado_tarea, status: :created, location: @estado_tarea }
      else
        format.html { render action: "new" }
        format.json { render json: @estado_tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estado_tareas/1
  # PUT /estado_tareas/1.json
  def update
    @estado_tarea = EstadoTarea.find(params[:id])

    respond_to do |format|
      if @estado_tarea.update_attributes(params[:estado_tarea])
        format.html { redirect_to @estado_tarea, notice: 'Estado tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estado_tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_tareas/1
  # DELETE /estado_tareas/1.json
  def destroy
    @estado_tarea = EstadoTarea.find(params[:id])
    @estado_tarea.destroy

    respond_to do |format|
      format.html { redirect_to estado_tareas_url }
      format.json { head :no_content }
    end
  end
end
