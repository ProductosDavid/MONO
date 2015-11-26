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
# = Controlador de Recurso
# Esta clase implementa el controlador en el patron MVC para la tabla de recursos.
# Un recurso es un elemento que pertenece a una organizacion y es utilizado en un proyecto.
class RecursosController < ApplicationController
# ===  Accion Index
# Lista todos los recursos que pertenecen a una organizacion y los visualiza en una grilla
# * GET /recursos
# * GET /recursos.json
  before_filter :authenticate_user!

  def index
    @recursos = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
    @recursosd = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
    @tipo_recursos = TipoRecurso.all.uniq
    @organizacions = Organizacion.all.uniq
    @var=1
    @org=1
    @recurso = Recurso.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recursos }
    end
  end

# ===  Accion Show
# Presenta la informacion de un recurso de acuerdo al id enviado
# * GET /recursos/1
# * GET /recursos/1.json
  def show
    @recurso = Recurso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recurso }
    end
  end

# ===  Accion New
# Presenta el formulario para la creacion de un recurso
# * GET /recursos/new
# * GET /recursos/new.json
  def new
    @recurso = Recurso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recurso }
    end
  end

# ===  Accion edit
# Presenta el formulario para la edicion de un recurso de acuerdo al id enviado
# * GET /recursos/1/edit
  def edit
    @recurso = Recurso.find(params[:id])
  end

# ===  Accion create
# Crea un recurso de acuerdo a los datos enviados en el formulario de creacion
# * POST /recursos
# * POST /recursos.json
  def create
    if  params[:idTart] != '' then
      @recurso = Recurso.find(params[:idTart])

      respond_to do |format|
        if @recurso.update_attributes(params[:recurso])
          @tipo_recursos = TipoRecurso.all.uniq
          @recurso = Recurso.new
          @recursos = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
          @recursosd = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse

          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @recursos }
        else
          format.html { render action: "new" }
          format.json { render json: @recurso.errors, status: :unprocessable_entity }
        end
      end
    else
      @recurso = Recurso.new(params[:recurso])
      @recurso.habilitado = 1
      @recurso.organizacion_id=Usuario.find_by_id(current_user.id).organizacion_id

      respond_to do |format|
        if @recurso.save
          @tipo_recursos = TipoRecurso.all.uniq
          @recurso = Recurso.new
          @recursos = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
          @recursosd = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @recurso, status: :created, location: @recurso }
        else
          format.html { render action: "new" }
          format.json { render json: @recurso.errors, status: :unprocessable_entity }
        end
      end
    end
  end

# ===  Accion update
# Actualiza un recurso de acuerdo a los datos enviados en el formulario de edicion
# * PUT /recursos/1
# * PUT /recursos/1.json
  def update
    @recurso = Recurso.find(params[:id])

    respond_to do |format|
      if @recurso.update_attributes(params[:recurso])
        format.html { redirect_to @recurso, notice: 'Recurso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recurso.errors, status: :unprocessable_entity }
      end
    end
  end

  def deshabilitar
    if  params[:idTartE] != '' then
      @recurso = Recurso.find(params[:idTartE])

      _data_rec = Hash.new

      if (@recurso.habilitado == "\x01" ? true : false)
        _data_rec[:habilitado] = 0
      else
        _data_rec[:habilitado] = 1
      end

      respond_to do |format|
        if @recurso.update_attributes(_data_rec)
          @tipo_recursos = TipoRecurso.all.uniq
          @recursos = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
          @recursosd = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse

          @message = t('datos_deshabilitados')
          format.html { redirect_to request.protocol + request.host_with_port + "/recursos?locale=es"}
          #format.html { render action: "index" }
          #format.json { render json: @recursos }
        else
          format.html { render action: "new" }
          format.json { render json: @recurso.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def deshabilitarg
    print params
    sleep 5
    if  params[:idTartE] != '' then
      @recurso = Recurso.find(params[:idTartE])

      _data_rec = Hash.new

      if (@recurso.habilitado == "\x01" ? true : false)
        _data_rec[:habilitado] = 0
      else
        _data_rec[:habilitado] = 1
      end

      if @recurso.update_attributes(_data_rec)
        render :text => "true"
      else
        render :text => "false"
      end
    end
  end

  #def habilitarvista
  #    respond_to do |format|
  #      @recurso = Recurso.new
  #      @tipo_recursos = TipoRecurso.all.uniq
  #      @recursos = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.sort_by(&:created_at).reverse
  #      @recursosd = Recurso.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id, :habilitado => 0).all.sort_by(&:created_at).reverse
  #      @message = t('vista_habilitada')
  #      format.html { render action: "index" }
  #      format.json { render json: @recursos }
  #    end
  #end

# ===  Accion destroy
# Elimina un recurso de acuerdo al id enviado
# * DELETE /recursos/1
# * DELETE /recursos/1.json
  def destroy
    @recurso = Recurso.find(params[:id])
    @recurso.destroy

    respond_to do |format|
      format.html { redirect_to recursos_url }
      format.json { head :no_content }
    end
  end

  def existe
    @recurso = Recurso.find_by_nombre(params[:nombre])
    if(@recurso)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def get_recurso
    _id = params[:id]
    _recurso = Recurso.find(_id);

    @result = Hash.new

    @result[:nombre] = _recurso.nombre;
    @result[:tipo_recurso_id] = _recurso.tipo_recurso_id;
    @result[:unidades] = _recurso.unidades;
    @result[:costo] = _recurso.costo ;
    @result[:descripcion] = _recurso.descripcion;

    render :json => @result
  end
end


