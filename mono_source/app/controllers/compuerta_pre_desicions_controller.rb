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
class CompuertaPreDesicionsController < ApplicationController
  # GET /compuerta_pre_desicions
  # GET /compuerta_pre_desicions.json
  def index
    @compuerta_pre_desicions = CompuertaPreDesicion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compuerta_pre_desicions }
    end
  end

  # GET /compuerta_pre_desicions/1
  # GET /compuerta_pre_desicions/1.json
  def show
    @compuerta_pre_desicion = CompuertaPreDesicion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compuerta_pre_desicion }
    end
  end

  # GET /compuerta_pre_desicions/new
  # GET /compuerta_pre_desicions/new.json
  def new
    @compuerta_pre_desicion = CompuertaPreDesicion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compuerta_pre_desicion }
    end
  end

  # GET /compuerta_pre_desicions/1/edit
  def edit
    @compuerta_pre_desicion = CompuertaPreDesicion.find(params[:id])
  end

  # POST /compuerta_pre_desicions
  # POST /compuerta_pre_desicions.json
  def create


    params[:cantidad].to_i.times do |count|

      if params[:compuerta_pre]
        @compuerta_pre_desicion = CompuertaPreDesicion.find(params[:compuerta_pre][count.to_s])
      else
        @compuerta_pre_desicion = CompuertaPreDesicion.new
      end

      @compuerta_pre_desicion.compuerta_id = params[:compuerta_id]
      @compuerta_pre_desicion.tarea_desicion_id = params[:tarea_desicion_id]
      @compuerta_pre_desicion.ruta_id = params[:compuerta_ruta][count.to_s]
      if params[:compuerta_type] == 'compuerta_exclu'
        @compuerta_pre_desicion.elegida = params[:compuerta_ruta][count.to_s] == params[:elegida]
      else
        if params[:ruta]
          @compuerta_pre_desicion.elegida = params[:compuerta_ruta][count.to_s] == params[:ruta][count.to_s]
        else
          @compuerta_pre_desicion.elegida = false
        end

      end

      @compuerta_pre_desicion.save

    end
    #@compuerta_pre_desicion = CompuertaPreDesicion.new(params[:compuerta_pre_desicion])

    respond_to do |format|
      if @compuerta_pre_desicion.save
        format.html { redirect_to "/tarea_participantes", notice: 'Compuerta pre desicion was successfully created.' }
        format.json { render json: @compuerta_pre_desicion, status: :created, location: @compuerta_pre_desicion }
      else
        format.html { render action: "new" }
        format.json { render json: @compuerta_pre_desicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compuerta_pre_desicions/1
  # PUT /compuerta_pre_desicions/1.json
  def update
    @compuerta_pre_desicion = CompuertaPreDesicion.find(params[:id])

    respond_to do |format|
      if @compuerta_pre_desicion.update_attributes(params[:compuerta_pre_desicion])
        format.html { redirect_to @compuerta_pre_desicion, notice: 'Compuerta pre desicion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compuerta_pre_desicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compuerta_pre_desicions/1
  # DELETE /compuerta_pre_desicions/1.json
  def destroy
    @compuerta_pre_desicion = CompuertaPreDesicion.find(params[:id])
    @compuerta_pre_desicion.destroy

    respond_to do |format|
      format.html { redirect_to compuerta_pre_desicions_url }
      format.json { head :no_content }
    end
  end
end
