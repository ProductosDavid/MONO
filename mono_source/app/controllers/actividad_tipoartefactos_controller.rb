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
class ActividadTipoartefactosController < ApplicationController
  # GET /actividad_tipoartefactos
  # GET /actividad_tipoartefactos.json
  before_filter :authenticate_user!

  def index
    @actividad_tipoartefactos = ActividadTipoartefacto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividad_tipoartefactos }
    end
  end

  # GET /actividad_tipoartefactos/1
  # GET /actividad_tipoartefactos/1.json
  def show
    @actividad_tipoartefacto = ActividadTipoartefacto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad_tipoartefacto }
    end
  end

  # GET /actividad_tipoartefactos/new
  # GET /actividad_tipoartefactos/new.json
  def new
    @actividad_tipoartefacto = ActividadTipoartefacto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad_tipoartefacto }
    end
  end

  # GET /actividad_tipoartefactos/1/edit
  def edit
    @actividad_tipoartefacto = ActividadTipoartefacto.find(params[:id])
  end

  # POST /actividad_tipoartefactos
  # POST /actividad_tipoartefactos.json
  def create
    @tipo_artefacto_id = TipoArtefacto.find_by_nombre(params[:tipoart_name]).id;

    @actividad_tipoartefacto = ActividadTipoartefacto.find_by_tipo_artefacto_id_and_actividad_id(@tipo_artefacto_id,params[:actividad_id]);

    if( @actividad_tipoartefacto == nil)

      @actividad_tipoartefacto = ActividadTipoartefacto.new(
          :tipo_artefacto_id => @tipo_artefacto_id,
          :actividad_id => params[:actividad_id],
          :modo => params[:tipoart_modo]
      )

    else
      @actividad_tipoartefacto.modo = params[:tipoart_modo]
    end


    if @actividad_tipoartefacto.save

      redirect_to request.protocol + request.host_with_port + "/actividads/" + params[:actividad_id] + "/edit"

    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @actividad_tipoartefacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actividad_tipoartefactos/1
  # PUT /actividad_tipoartefactos/1.json
  def update
    @actividad_tipoartefacto = ActividadTipoartefacto.find(params[:id])

    respond_to do |format|
      if @actividad_tipoartefacto.update_attributes(params[:actividad_tipoartefacto])
        format.html { redirect_to @actividad_tipoartefacto, notice: 'Actividad tipoartefacto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad_tipoartefacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_tipoartefactos/1
  # DELETE /actividad_tipoartefactos/1.json
  def destroy
    @actividad_tipoartefacto = ActividadTipoartefacto.find(params[:id])
    @actividad_tipoartefacto.destroy

    respond_to do |format|
      format.html { redirect_to actividad_tipoartefactos_url }
      format.json { head :no_content }
    end
  end

  # ===  Accion existe
  # Determina si existe una tipo de artefacto de acuerdo a un nombre en esta actividad
  def existe
    @tipo_artefacto_id = TipoArtefacto.find_by_nombre(params[:nombre]).id;

    @actividad_tipoartefacto = ActividadTipoartefacto.find_by_tipo_artefacto_id_and_actividad_id(@tipo_artefacto_id,params[:actividad_id]);
    if(@actividad_tipoartefacto)
      render :text => "true"
    else
      render :text => "false"
    end

  end

end
