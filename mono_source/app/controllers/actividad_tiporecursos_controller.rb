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
class ActividadTiporecursosController < ApplicationController
  # GET /actividad_tiporecursos
  # GET /actividad_tiporecursos.json
  before_filter :authenticate_user!

  def index
    @actividad_tiporecursos = ActividadTiporecurso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividad_tiporecursos }
    end
  end

  # GET /actividad_tiporecursos/1
  # GET /actividad_tiporecursos/1.json
  def show
    @actividad_tiporecurso = ActividadTiporecurso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad_tiporecurso }
    end
  end

  # GET /actividad_tiporecursos/new
  # GET /actividad_tiporecursos/new.json
  def new
    @actividad_tiporecurso = ActividadTiporecurso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad_tiporecurso }
    end
  end

  # GET /actividad_tiporecursos/1/edit
  def edit
    @actividad_tiporecurso = ActividadTiporecurso.find(params[:id])
  end

  # POST /actividad_tiporecursos
  # POST /actividad_tiporecursos.json
  def create
    if params[:tiporecmat_name] != nil
      @tiporec_name = params[:tiporecmat_name]
      @tiporec_qty = params[:tiporecmat_qty]
    end

    if params[:tiporechum_name] != nil
      @tiporec_name = params[:tiporechum_name]
      @tiporec_qty = params[:tiporechum_qty]
    end

    @tipo_recurso_id = TipoRecurso.find_by_nombre(@tiporec_name).id;
    @actividad_tiporecurso = ActividadTiporecurso.find_by_tipo_recurso_id_and_actividad_id(@tipo_recurso_id,params[:actividad_id]);

    if( @actividad_tiporecurso == NIL)

      @actividad_tiporecurso = ActividadTiporecurso.new(
        :cantidad => @tiporec_qty,
        :tipo_recurso_id => @tipo_recurso_id,
        :actividad_id => params[:actividad_id]
      )

    else
      @actividad_tiporecurso.cantidad = @tiporec_qty
    end
   
    if @actividad_tiporecurso.save

      redirect_to request.protocol + request.host_with_port + "/actividads/" + params[:actividad_id] + "/edit"

    else
       respond_to do |format|
          format.html { render action: "edit" }
          format.json { render json: @actividad_tiporecurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actividad_tiporecursos/1
  # PUT /actividad_tiporecursos/1.json
  def update
    @actividad_tiporecurso = ActividadTiporecurso.find(params[:id])

    respond_to do |format|
      if @actividad_tiporecurso.update_attributes(params[:actividad_tiporecurso])
        format.html { redirect_to @actividad_tiporecurso, notice: 'Actividad tiporecurso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad_tiporecurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_tiporecursos/1
  # DELETE /actividad_tiporecursos/1.json
  def destroy
    @actividad_tiporecurso = ActividadTiporecurso.find(params[:id])
    @actividad_tiporecurso.destroy

    respond_to do |format|
      format.html { redirect_to actividad_tiporecursos_url }
      format.json { head :no_content }
    end
  end

  # ===  Accion existe
  # Determina si existe una tipo de recurso de acuerdo a un nombre en esta actividad
  def existe
    @tipo_recurso_id = TipoRecurso.find_by_nombre(params[:nombre]).id;

    @actividad_tiporecurso = ActividadTiporecurso.find_by_tipo_recurso_id_and_actividad_id(@tipo_recurso_id,params[:actividad_id]);
    if(@actividad_tiporecurso)
      render :text => "true"
    else
      render :text => "false"
    end

  end
end
