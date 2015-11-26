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
module MyJsTreesHelper
  def get_children_for_root(all_ous, id_p)
    boo={}
    boo = add_children( get_Root(id_p),all_ous)
    return boo
  end

  def add_children(parent_id, all_ous)
    data={:data=> (get_OU_Name(parent_id)),:attr=> { rel:(get_OU_Type(parent_id)),id:(parent_id),idreal:(get_OU_Id(parent_id)),idparent:(get_OU_IdParent(parent_id)),pos:(get_OU_Position(parent_id)) }}
    data[:children]=children=[]



    all_ous.each_with_index do |ou,index|
      if(parent_id==ou.parent_id)
        children << add_children(ou.id,all_ous)
      end
    end
    if children.empty?
      data.delete(:children)

    end


    return data
  end


  def get_Root(id)
    if(@id_plantilla)
      @ou=MyJsTree.find_by_plantilla_id_and_type(id,"root")
    else
      @ou=MyJsTree.find_by_proceso_id_and_type(id,"root")
    end
    return @ou.id;
  end

  def get_OU_IdParent(id)
    @ou=MyJsTree.find(id)
    return @ou.parent_id;
  end

  def get_OU_Name(id)
    @ou=MyJsTree.find(id)
    return @ou.title
  end

  def get_OU_Type(id)
    @ou=MyJsTree.find(id)
    return @ou.type
  end

  def get_OU_Position(id)
    @ou=MyJsTree.find(id)
    return @ou.position
  end

   def get_OU_Id(id)
   @ou=MyJsTree.find(id)
    if (@ou.type == "tarea_simple" || @ou.type == "tarea_multi_para" || @ou.type == "tarea_multi_seq" ||
        @ou.type == "tarea_simple_rev" || @ou.type == "tarea_multi_para_rev" || @ou.type == "tarea_multi_seq_rev")
      return Actividad.find_all_by_my_js_tree_id(id).first().id
    end
   if (@ou.type == "ruta")
      return Rutum.find_all_by_my_js_tree_id(id).first().id
    end
    if (@ou.type == "compuerta_exclu" || @ou.type == "compuerta_inclu" || @ou.type == "compuerta_para")
      return Compuertu.find_all_by_my_js_tree_id(id).first().id
    end
    if (@ou.type == "evento_inicio" || @ou.type == "evento_fin" || @ou.type == "evento_intermedio")
      return Evento.find_all_by_my_js_tree_id(id).first().id
    end
   if (@ou.type == "loop")
     return Loop.find_all_by_my_js_tree_id(id).first().id
   end
   if (@ou.type == "merge")
     return Merge.find_all_by_my_js_tree_id(id).first().id
   end

  #  end
  #  end
  #  end
  #  end
    return -1;
  end



end



