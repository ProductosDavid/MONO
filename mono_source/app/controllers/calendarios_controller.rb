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
class CalendariosController < ApplicationController
  # GET /tareas
  # GET /tareas.json
  before_filter :authenticate_user!
  def index
    @proceso = Proceso.find(params[:proceso_id])
    @calendarios = Calendario.where(:proceso_id => @proceso.id)

    respond_to do |format|
      format.html { render :layout => 'actividads'}
      format.json { render json: @tareas }
    end
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
    @calendario = Calendario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calendario }
    end
  end

  # GET /tareas/new
  # GET /tareas/new.json
  def new
    @tarea = Tarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea }
    end
  end


  # POST /tareas
  # POST /tareas.json
  def create
    @calendario = Calendario.new(params[:calendario])

    respond_to do |format|
      if @calendario.save
        format.html { redirect_to @calendario, notice: 'Calendario was successfully created.' }
        format.json { render json: @calendario, status: :created, location: @calendario }
      else
        format.html { render action: "new" }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareas/1
  # PUT /tareas/1.json
  def update
    @calendario = Calendario.find(params[:id])

    respond_to do |format|
      if @calendario.update_attributes(params[:calendario])
        format.html { redirect_to @calendario, notice: 'Tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @calendario = Calendario.find(params[:id])
    @calendario.destroy

    respond_to do |format|
      format.html { redirect_to calendario_url }
      format.json { head :no_content }
    end
  end

  def actualizar_calendario
    @calendario_id = params[:id_calendario]
    @valor = params[:valor]
    @campo = params[:campo]

    @calendario = Calendario.find(@calendario_id)

    if @campo == "horas" then
      @calendario.horas = @valor
    end

    if @calendario.save then
      render :text => "true"
    else
      render :text => "false"
    end
  end
end
