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
# = Controlador de Compuertas
# Esta clase implementa el controlador en el patron MVC para la tabla de compuertas.
# Una compuerta es una desición en el estandar BPMN
class CompuertusController < ApplicationController

  before_filter :authenticate_user!
  # ===  Accion Index
  # Lista todos las compuertas y las visualiza en una grilla
  # GET /compuertus
  # GET /compuertus.json
  def index
    @compuertus = Compuertu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compuertus }
    end
  end

  # ===  Accion Show
  # Presenta la informacion de una compuerta de acuerdo al id enviado
  # GET /compuertus/1
  # GET /compuertus/1.json
  def show
    @compuertu = Compuertu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compuertu }
    end
  end

  # ===  Accion New
  # Presenta el formulario para la creacion de una compuerta
  # GET /compuertus/new
  # GET /compuertus/new.json
  def new
    @compuertu = Compuertu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compuertu }
    end
  end

  # ===  Accion edit
  # Presenta el formulario para la edicion de una compuerta
  # GET /compuertus/1/edit
  def edit
    @compuertu = Compuertu.find(params[:id])

    respond_to do |format|
      format.html { render layout: "actividads" }
      format.json { render json: @compuertu }
    end

  end

  # ===  Accion create
  # Crea una compuerta de acuerdo a los datos enviados en el formulario de creacion
  # POST /compuertus
  # POST /compuertus.json
  def create
    @compuertu = Compuertu.new(params[:compuertu])

    @nodo = MyJsTree.new(
        :parent_id => params[:nodo_padre],
        :position => params[:posicion],
        :type => params[:nodo_tipo],
        :title => params[:nodo_titulo],
        :plantilla_id => @compuertu.plantilla_id,
        :proceso_id => @compuertu.proceso_id,
        :left => 0,
        :right => 0,
        :level => 0
    )

    if @nodo.save
        @compuertu.my_js_tree_id=MyJsTree.last().id
        if @compuertu.save

        #_nodotipo = ""
        #if(params[:nodo_tipo] == "compuerta_exclu")
        #  _nodotipo = "andjoin_exclu"
        #elsif(params[:nodo_tipo] == "compuerta_inclu")
        #  _nodotipo = "andjoin_inclu"
        #else
        #  _nodotipo = "andjoin_para"
        #end

=begin creacion del nodo join automatico
        if(params[:nodo_tipo] == "compuerta_para")
          _nodotipo = "merge"

          @nodoJoin = MyJsTree.new(
              :parent_id => params[:nodo_padre],
              :position => (params[:posicion].to_i() + 1).to_i(),
              :type => _nodotipo,
              :title => "Join " + params[:nodo_titulo],
              :plantilla_id => @compuertu.plantilla_id,
              :proceso_id => @compuertu.proceso_id,
              :left => 0,
              :right => 0,
              :level => 0
          )

          @nodoJoin.save!

          @nodoMerge = Merge.new(
              :nombre => "Join " + params[:nodo_titulo],
              :proceso_id => @compuertu.proceso_id,
              :plantilla_id => @compuertu.plantilla_id,
              :my_js_tree_id => @nodoJoin.id
          )

          @nodoMerge.save!
        end
=end

        #@nodo_cierre = MyJsTree.new(
        #      :parent_id => params[:nodo_padre],
        #      :position => (params[:posicion].to_i() + 1).to_i(),
        #      :type => _nodotipo,
        #      :title => "Fin " + params[:nodo_titulo],
        #      :plantilla_id => @compuertu.plantilla_id,
        #      :proceso_id => @compuertu.proceso_id,
        #      :left => 0,
        #      :right => 0,
        #      :level => 0
        #  )

        #@nodo_cierre.save!

        #CompuertaCierre cierre = CompuertaCierre.new(
        #    :nombre => "Fin " + params[:nodo_titulo],
        #    :plantilla_id => @compuertu.plantilla_id,
        #    :proceso_id => @compuertu.proceso_id,
        #    :my_js_tree_id => MyJsTree.last().id
        #)

        #cierre.save!

        render :text => "true"
        else
          render :text => "false"
        end
     else
     render :text => "false"
    end
  end

  # ===  Accion update
  # Actualiza una compuerta de acuerdo a los datos enviados en el formulario de edicion
  # PUT /compuertus/1
  # PUT /compuertus/1.json
  def update
    @compuertu = Compuertu.find(params[:id])

    # Actualizacion de nodo y tarea

    id_nodo = @compuertu.read_attribute(:my_js_tree_id)
    @my_js_tree = MyJsTree.find(id_nodo)
    @my_js_tree.update_attribute("title",params[:compuertu][:nombre])

    id_proceso = @compuertu.read_attribute(:proceso_id)
    if id_proceso != ""
      @tareas = Tarea.find_all_by_compuerta_id(params[:id])
      @tareas.each do |tarea|
        tarea.update_attribute("nombre", params[:compuertu][:nombre])
      end
    end

    ####

    respond_to do |format|
      if @compuertu.update_attributes(params[:compuertu])
        format.html { render action: "edit", layout: "actividads" }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "actividads" }
        format.json { render json: @compuertu.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateName
    @compuertu = Compuertu.find(params[:id])

    if @compuertu.update_attribute("nombre", params[:nombre]) #update_attributes(params[:actividad])
      @my_js_tree = MyJsTree.find(params[:nodo_id])
      if @my_js_tree.update_attribute("title",params[:nombre])
        render :text => "true";
      else
        render :text => "false"
      end
      id_proceso = @compuertu.read_attribute(:proceso_id)
      if id_proceso != ""
        @tareas = Tarea.find_all_by_compuerta_id(params[:id])
        @tareas.each do |tarea|
          tarea.update_attribute("nombre", params[:nombre])
        end
      end
    else
      render :text => "false"
    end
   end

  def updateType
    @compuertu = Compuertu.find(params[:id])

    if @compuertu.update_attribute("tipo", params[:nuevo_tipo]) #update_attributes(params[:actividad])

      @my_js_tree = MyJsTree.find(params[:nodo_id])

      if @my_js_tree.update_attribute("type",params[:nuevo_tipo_nodo])
        render :text => "true";
      else
        render :text => "false"
      end
    else
      render :text => "false"
    end
  end


  # ===  Accion destroy
  # Elimina una compuerta de acuerdo al id enviado
  # DELETE /compuertus/1
  # DELETE /compuertus/1.json
  def destroy
    # Eliminación de actividades hijas si existen
        if ( params[:actividades_hijas] != "")
          @actividad = Actividad.find(params[:actividades_hijas])
          @actividad.each do |activ|
            @tareas = Tarea.find_all_by_actividad_id(activ.id)
            @tareas.each do |tarea|
              tarea.destroy
            end
            activ.destroy
          end
        end

    # Eliminación de compuertas hijas si existen
        if ( params[:compuertas_hijas] != "")
          @compuertashijas = Compuertu.find(params[:compuertas_hijas])
          @compuertashijas.each do |compu|
             compu.destroy
          end
        end
    # Eliminación de rutas hijas si existen
        if ( params[:rutas_hijas] != "")
          @rutashijas = Rutum.find(params[:rutas_hijas])
          @rutashijas.each do |ruta|
            ruta.destroy
          end
        end
    # Eliminación nodo padre
        @compuertu = Compuertu.find(params[:id])
        if( @compuertu.destroy)
          render :text => "true"
        else
          render :text => "false"
        end
    end
end
