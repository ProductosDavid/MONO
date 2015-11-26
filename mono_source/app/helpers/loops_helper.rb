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
module LoopsHelper

  # metodo para la actualizacion de tabla de presedencias para los bucles
  def precedencias_agregar (my_js_tree, act_sucesora, dec_sucesora)
    # Encuentra el nodo anterior al bucle y la ruta asociada
    nodo_anterior_arbol = encontrar_nodo_anterior (my_js_tree)
    # Encuentra la tarea sucesora
    if act_sucesora != nil
      tarea_sucesora = Tarea.find_by_actividad_id(act_sucesora)
    else
      tarea_sucesora = Tarea.find_by_compuerta_id(dec_sucesora)
    end
    #encontrando la tarea asociada al nodo anterior del bucle
    if nodo_anterior_arbol.type == "tarea_simple" || nodo_anterior_arbol.type == "tarea_multi_seq" || nodo_anterior_arbol.type == "tarea_multi_para" then
      actividad_anterior = Actividad.find_by_my_js_tree_id(nodo_anterior_arbol.id)
      tarea_anterior = Tarea.find_by_actividad_id(actividad_anterior.id)
      #actualizando la tabla de presedencias si es una actividad
      if tarea_sucesora != nil then
        presedencia = TareaPresedencium.find_by_predecesora_id(tarea_anterior.id)
        presedencia.update_attribute(:sucesora_id , tarea_sucesora.id )
        presedencia.update_attribute(:tipo_relacion,"bucle")
        presedencia.update_attribute(:loop_id, my_js_tree.id)
      end
    end
    if nodo_anterior_arbol.type == "compuerta_exclu" then
      compuerta_anterior = Compuertu.find_by_my_js_tree_id(nodo_anterior_arbol.id)
      tarea_anterior = Tarea.find_by_compuerta_id(compuerta_anterior.id)
      #actualizando la tabla de presedencias si es una desicion, creando una nueva presedencia
      if tarea_sucesora != nil then
        tarea_presedencia = TareaPresedencium.new(
            :predecesora_id => tarea_anterior.id,
            :sucesora_id => tarea_sucesora.id ,
            :proceso_id => tarea_anterior.proceso_id,
            :tipo_relacion => "bucle",
            :loop_id => my_js_tree.id
        )
        tarea_presedencia.save!
      end
    end
  end

  # encuentra el nodo anterior al bucle sea una actividad o una desicion
  def encontrar_nodo_anterior my_js_tree
    padre = my_js_tree.parent_id
    #ruta_id = Rutum.find_by_my_js_tree_id(padre).id
    miarray=[]
    contador=0
    # carga todos los hijos de una rama
    hijos_rama = MyJsTree.find_all_by_parent_id(padre, :order => 'position')
    hijos_rama.each do |dato|
      miarray[contador] = dato.id
      contador=contador+1
    end
    if my_js_tree.id == miarray.first then
      # si es igual al hijo menor el bucle esta pegado a la ruta
      nodo_anterior_arbol = MyJsTree.find(padre)
      if nodo_anterior_arbol.type == "ruta" then
        nodo_anterior_arbol = MyJsTree.find(nodo_anterior_arbol.parent_id)
      end
    else
      # si es diferente al hijo menor tiene almenos una actividad o un nodo antes
      index_anterior = miarray.index(my_js_tree.id)-1
      nodo_anterior_arbol = MyJsTree.find(miarray[index_anterior])
    end
    #return [nodo_anterior_arbol, ruta_id]
    return nodo_anterior_arbol
  end

  #encuentra el camino de padres entre un origen y un destino
  def encontrar_camino nodo_partida, nodo_llegada, inc_padre_partida
    # Nodos de origen y destino
    nodo1 = MyJsTree.find(nodo_partida)
    nodo2 = MyJsTree.find(nodo_llegada)
    # Nodos padre de los nodos origen y destino
    mi_padre = MyJsTree.find(nodo1.parent_id)
    llegada_padre = MyJsTree.find(nodo2.parent_id)
    # arreglo de respuesta y contador del arreglo
    arreglo_padres=[]
    contador = 0
    # opcion que habilita la inclusion del padre de origen en el arreglo de padres
    if inc_padre_partida == true then
      arreglo_padres=[mi_padre.id]
      contador = 1
    end
    # recorrido del arbol y llenado del arreglo
    while mi_padre.id != llegada_padre.id do
      mi_padre = MyJsTree.find(mi_padre.parent_id)
      arreglo_padres[contador] = mi_padre.id
      contador=contador+1
    end
    # retorno de valores
    return arreglo_padres
  end

  # Convierte una coleccion obtenida de una consulta a la BD en un arreglo de ids mas facil de manejar
  def convertir_en_arreglo coleccion
    my_array=[]
    contador=0
    coleccion.each do |objeto|
      my_array[contador] = objeto.id
      contador=contador+1
    end
    return my_array
  end

  # Realiza el reordenamiento de los index del arbol
  def ordenar_arbol tipo , id
    tipo_nodos =  ['evento_inicio','compuerta_exclu', 'compuerta_para','compuerta_inclu','ruta']
    # consulta los nodos padre
    if tipo == "plantilla" then
      nodos_padre = MyJsTree.find_all_by_plantilla_id(id, :conditions => [ "type IN (?)", tipo_nodos],:order =>"position")
    else
      nodos_padre = MyJsTree.find_all_by_proceso_id(id,  :conditions => [ "type IN (?)", tipo_nodos],:order =>"position")
    end
    # convierte los padres en arreglo
    arreglo_padres = convertir_en_arreglo nodos_padre
    # para cada padre obtiene los hijos y los renumera
    arreglo_padres.each do |padre|
      hijos = MyJsTree.find_all_by_parent_id(padre,:order =>"position")
      if hijos.count > 0 then
        contador = 0
        hijos.each do |hijo|
          hijo.update_attribute(:position,contador)
          contador = contador +1
        end
      end
    end
  end


end
