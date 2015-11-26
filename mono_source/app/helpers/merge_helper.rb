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
module MergeHelper

  #Agregar las rutas de todos los nodos a la tabla de precedencias
  def agregar_rutas_precedencia proceso_id
    #Cargar tareas del proceso
    tareas = Tarea.find_all_by_proceso_id(proceso_id)
    if(tareas.count() > 0) then
      tareas.each do |tarea|
        #por cada tarea obtener el id del arbol asociado
        if tarea.es_desicion != true then
          objeto = Actividad.find(tarea.actividad_id)
        else
          objeto = Compuertu.find(tarea.compuerta_id)
        end
        nodo_arbol = MyJsTree.find(objeto.my_js_tree_id)
        #actualizar la tabla de presedencias agregando el id del padre en la columna de rutas
        sucesoras = TareaPresedencium.find_all_by_sucesora_id(tarea.id)
        sucesoras.each do |p| p.update_attribute(:ruta_id,nodo_arbol.parent_id) end
      end
    end
  end

  #identificar merges
  def evaluar_merges proceso_id
    #Cargar tareas de disicion del proceso
    tareas = Tarea.find_all_by_proceso_id(proceso_id, :conditions => [ "es_desicion = (?)", true])
    if(tareas.count() > 0) then
      tareas.each do |tarea|
        #por cada tarea obtener el id del arbol asociado
        objeto = Compuertu.find(tarea.compuerta_id)
        nodo_arbol_predecesora = MyJsTree.find(objeto.my_js_tree_id)
        #por cada tarea de desicion obtener las relaciones
        predecesoras = TareaPresedencium.find_all_by_predecesora_id(tarea.id)
        predecesoras.each do |predecesora|
          #por cada relacion comprobar si se tiene el mismo padre para predecesora y sucesora
          if nodo_arbol_predecesora.parent_id == predecesora.ruta_id then
            if predecesora.tipo_relacion != "bucle"
              predecesora.update_attribute(:tipo_relacion, "merge")
            end
          end
        end
      end
    end
  end
end
