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
class LoopsController < ApplicationController
  before_filter :authenticate_user!
  include LoopsHelper

  def index
    @loops = Loop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loops }
    end
  end

  def edit
    @loop = Loop.find(params[:id])
    @proceso = @loop.proceso
    respond_to do |format|
      format.html { render layout: "actividads" }
      format.json { render json: @loop }
    end
  end

  def create
    @loop = Loop.new(params[:loop])

    @nodo = MyJsTree.new(
        :parent_id => params[:nodo_padre],
        :position => params[:posicion],
        :type => params[:nodo_tipo],
        :title => params[:nodo_titulo],
        :plantilla_id => @loop.plantilla_id,
        :proceso_id => @loop.proceso_id,
        :left => 0,
        :right => 0,
        :level => 0
    )

    if @nodo.save
      @loop.my_js_tree_id=MyJsTree.last().id

      if @loop.save
        render :text => "true";
      else
        render :text => "false"
      end
    else
      render :text => "false"
    end
  end

  def update
    @loop = Loop.find(params[:id])


    @proceso = @loop.proceso

    id_nodo = @loop.read_attribute(:my_js_tree_id)


    respond_to do |format|

      if(@loop.update_attributes(params[:loop]))
        @message = t('datos_guardados')

        @my_js_tree = MyJsTree.find(id_nodo)
        @my_js_tree.update_attribute("title",params[:loop][:nombre])

        #actualizar la tabla de presedencia
        if @proceso != nil then
          precedencias_agregar @my_js_tree , params[:loop][:actividad_id], params[:loop][:compuerta_id]
        end

        format.html { render action: "edit", layout: "actividads" }
        format.json { head :no_content }
       else
        format.html { render action: "edit", layout: "actividads" }
        format.json { render json: @loop.errors, status: :unprocessable_entity }
       end
    end
  end

  def destroy
    @loop = Loop.find(params[:id])
    if( @loop.destroy)
      render :text => "true";
    else
      render :text => "false"
    end
  end

  def updateName
    @loop = Loop.find(params[:id])

    if @loop.update_attribute("nombre", params[:nombre])

      @my_js_tree = MyJsTree.find(params[:nodo_id])

      if @my_js_tree.update_attribute("title",params[:nombre])
        render :text => "true";
      else
        render :text => "false"
      end
    else
      render :text => "false"
    end
  end

end

