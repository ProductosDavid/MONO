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
# = Controlador de Tipos de Plantillas
# Esta clase implementa el controlador en el patron MVC para la tabla de tipos de plantillas.
# Un tipo de plantilla es una clasificacion de las plantillas que pueden ser utilizados en diferentes proyectos.
class TipoPlantillasController < ApplicationController
  before_filter :authenticate_user!

  # ===  Accion Index
  # Lista todos los tipos de plantillas y los visualiza en una grilla
  # GET /tipo_plantillas
  # GET /tipo_plantillas.json
  def index
     @tipo_plantillas = TipoPlantilla.all.sort_by(&:created_at).reverse
     @var=1
    @tipo_plantilla = TipoPlantilla.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_plantillas }
    end
  end

  # ===  Accion Show
  # Presenta la informacion de un tipo de plantilla de acuerdo al id enviado
  # GET /tipo_plantillas/1
  # GET /tipo_plantillas/1.json
  def show
    @tipo_plantilla = TipoPlantilla.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_plantilla }
    end
  end

  # ===  Accion New
  # Presenta el formulario para la creacion de un tipo de plantilla
  # GET /tipo_plantillas/new
  # GET /tipo_plantillas/new.json
  def new
    @tipo_plantilla = TipoPlantilla.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_plantilla }
    end
  end

  # ===  Accion edit
  # Presenta el formulario para la edicion de un tipo de plantilla de acuerdo al id enviado
  # GET /tipo_plantillas/1/edit
  def edit
    @tipo_plantilla = TipoPlantilla.find(params[:id])
  end

  # ===  Accion create
  # Crea un tipo de plantilla de acuerdo a los datos enviados en el formulario de creacion
  # POST /tipo_plantillas
  # POST /tipo_plantillas.json
  def create
    if  params[:idTart] != '' then
      @tipo_plantilla = TipoPlantilla.find(params[:idTart])

      respond_to do |format|
        if @tipo_plantilla.update_attributes(params[:tipo_plantilla])
          @tipo_plantilla = TipoPlantilla.new
          @tipo_plantillas = TipoPlantilla.all

          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @tipo_plantillas }
        else
          format.html { render action: "new" }
          format.json { render json: @tipo_plantilla.errors, status: :unprocessable_entity }
        end
      end
    else
      @tipo_plantilla = TipoPlantilla.new(params[:tipo_plantilla])

      respond_to do |format|
        if @tipo_plantilla.save
          @tipo_plantilla = TipoPlantilla.new
          @tipo_plantillas = TipoPlantilla.all
          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @tipo_plantillas }
        else
          format.html { render action: "new" }
          format.json { render json: @tipo_plantilla.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # ===  Accion update
  # Actualiza un tipo de plantilla de acuerdo a los datos enviados en el formulario de edicion
  # PUT /tipo_plantillas/1
  # PUT /tipo_plantillas/1.json
  def update
    @tipo_plantilla = TipoPlantilla.find(params[:id])

    respond_to do |format|
      if @tipo_plantilla.update_attributes(params[:tipo_plantilla])
        format.html { redirect_to @tipo_plantilla, notice: 'Tipo plantilla was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_plantilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # ===  Accion destroy
  # Elimina un tipo de plantilla de acuerdo al id enviado
  # DELETE /tipo_plantillas/1
  # DELETE /tipo_plantillas/1.json
  def destroy
    @tipo_plantilla = TipoPlantilla.find(params[:id])
    @tipo_plantilla.destroy

    respond_to do |format|
      format.html { redirect_to tipo_plantillas_url }
      format.json { head :no_content }
    end
  end

# ===  Accion existe
# Determina si existe un tipo de plantilla de acuerdo a un nombre
# * GET /tipo_plantilla/exist/nombre
  def existe
    @tipo_plantilla = TipoPlantilla.find_by_nombre(params[:nombre])
    if(@tipo_plantilla)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def get_tipo_plantilla
    _id = params[:id]
    _tipoPlantilla = TipoPlantilla.find(_id);

    @result = Hash.new

    @result[:nombre] = _tipoPlantilla.nombre;
    @result[:descripcion] = _tipoPlantilla.descripcion;

    render :json => @result
  end
end
