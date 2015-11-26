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
class MergesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @merges = Merge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merges }
    end
  end

  def edit
    @merge = Merge.find(params[:id])
    @proceso = @merge.proceso
    @myjstree = @merge.my_js_tree


    respond_to do |format|
      format.html { render layout: "actividads" }
      format.json { render json: @merge }
    end

  end

  def create
    @merge = Merge.new(params[:merge])

    @nodo = MyJsTree.new(
        :parent_id => params[:nodo_padre],
        :position => params[:posicion],
        :type => params[:nodo_tipo],
        :title => params[:nodo_titulo],
        :plantilla_id => @merge.plantilla_id,
        :proceso_id => @merge.proceso_id,
        :left => 0,
        :right => 0,
        :level => 0
    )

    if @nodo.save
      @merge.my_js_tree_id=MyJsTree.last().id

      if @merge.save
        render :text => "true";
      else
        render :text => "false"
      end
    else
      render :text => "false"
    end
  end

  def update
    #puts params[:merge]
    #puts params[:mergecompuertas]
    #sleep 5

    @merge = Merge.find(params[:id])
    @proceso = @merge.proceso
    @myjstree = @merge.my_js_tree

    _node = MyJsTree.find(@merge.my_js_tree_id)

    respond_to do |format|

      if(@merge.update_attributes(params[:merge]))
        @message = t('datos_guardados')

        MergeCompuerta.where(merge_id: params[:id]).delete_all
        params[:mergecompuertas].each do |mergecompuerta|
          mergcomp = MergeCompuerta.new(:proceso_id => @merge.proceso_id, :ruta_id => mergecompuerta, :merge_id => @merge.id)
          mergcomp.save!
        end

        format.html { render action: "edit", layout: "actividads" }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "actividads" }
        format.json { render json: @merge.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @merge = Merge.find(params[:id])
    if( @merge.destroy)
      render :text => "true";
    else
      render :text => "false"
    end
  end
end

