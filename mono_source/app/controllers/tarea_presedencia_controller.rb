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
class TareaPresedenciaController < ApplicationController
  # GET /tarea_presedencia
  # GET /tarea_presedencia.json
  before_filter :authenticate_user!

  def index
    @tarea_presedencia = TareaPresedencium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tarea_presedencia }
    end
  end

  # GET /tarea_presedencia/1
  # GET /tarea_presedencia/1.json
  def show
    @tarea_presedencium = TareaPresedencium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarea_presedencium }
    end
  end

  # GET /tarea_presedencia/new
  # GET /tarea_presedencia/new.json
  def new
    @tarea_presedencium = TareaPresedencium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea_presedencium }
    end
  end

  # GET /tarea_presedencia/1/edit
  def edit
    @tarea_presedencium = TareaPresedencium.find(params[:id])
  end

  # POST /tarea_presedencia
  # POST /tarea_presedencia.json
  def create
    @tarea_presedencium = TareaPresedencium.new(params[:tarea_presedencium])

    respond_to do |format|
      if @tarea_presedencium.save
        format.html { redirect_to @tarea_presedencium, notice: 'Tarea presedencium was successfully created.' }
        format.json { render json: @tarea_presedencium, status: :created, location: @tarea_presedencium }
      else
        format.html { render action: "new" }
        format.json { render json: @tarea_presedencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tarea_presedencia/1
  # PUT /tarea_presedencia/1.json
  def update
    @tarea_presedencium = TareaPresedencium.find(params[:id])

    respond_to do |format|
      if @tarea_presedencium.update_attributes(params[:tarea_presedencium])
        format.html { redirect_to @tarea_presedencium, notice: 'Tarea presedencium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarea_presedencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarea_presedencia/1
  # DELETE /tarea_presedencia/1.json
  def destroy
    @tarea_presedencium = TareaPresedencium.find(params[:id])
    @tarea_presedencium.destroy

    respond_to do |format|
      format.html { redirect_to tarea_presedencia_url }
      format.json { head :no_content }
    end
  end
end
