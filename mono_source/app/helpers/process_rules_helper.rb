module ProcessRulesHelper
include LoopsHelper

  #METODOS GLOBALESd

  def eventos_proceso proceso

    if(proceso.estado == "publicado")

      Tarea.find_all_by_proceso_id(proceso.id).each do |tarea|
        begin
         task_rules = Rools::RuleSet.new do

            rule 'IsFirstTask' do
              parameter Integer
              condition   { is_first_task(tarea) }
              consequence { tarea.update_attribute(:activada, 1) }
            end

            rule 'PredecessorsBucle' do
              parameter Integer
              condition   { predecesor_bucle(tarea) }
              consequence { evento_bucle(tarea) }
            end

            rule 'PredecessorsMerge' do
              parameter Integer
              condition   { predecesor_merge(tarea) }
              consequence { evento_merge(tarea) }
            end

            rule 'PredecessorsIsAprobed' do
              parameter Integer
              condition   {predecesoras_aprobadas(tarea)}
              consequence {tarea.update_attribute(:activada, 1)}
            end

            rule 'IsDesicionTask' do
              parameter Integer
              condition   { tarea.es_desicion }
              consequence { evento_desicion(tarea) }
            end

            if(!tarea.es_aprobacion)
              rule 'IsRevisionToBegin' do
                parameter Integer
                condition   { revision_start(tarea) }
                consequence { iniciar_flujo_revision(tarea) }
              end
            end

            if(tarea.es_aprobacion)
              rule 'IsRevisionEvent' do
                parameter Integer
                condition   {revision_event(tarea)}
                consequence {evento_flujo_revision(tarea) }
              end
            end
          end
          task_rules.assert tarea.id
        end #end del begin
      end
    end
  end

  def predecesoras_aprobadas tarea
    aprobadas = true
    TareaPresedencium.find_all_by_sucesora_id(tarea.id).each do |presedencia|
      if(presedencia.predecesora_id != nil)
        tarea1 = Tarea.find(presedencia.predecesora_id)

        if presedencia.tipo_relacion != "bucle" then
          if(tarea1 != nil && tarea1.columna != 4) then
            aprobadas = false
          end
        end

        if  presedencia.tipo_relacion == "merge" then
          aprobadas = false
        end
        if  tarea1.es_desicion == true && presedencia.tipo_relacion != "bucle" then
          aprobadas = false
        end
      end
    end
    return aprobadas
  end

  def predecesor_bucle tarea
    es_loop = false
    if (TareaPresedencium.find_all_by_predecesora_id_and_tipo_relacion(tarea.id, "bucle").count > 0) then
      es_loop = true
    end
    return es_loop
  end

  def predecesor_merge tarea
    es_merge = false
    if (TareaPresedencium.find_all_by_predecesora_id_and_tipo_relacion(tarea.id, "merge").count > 0) then
      es_merge = true
    end
    return es_merge
  end

  def is_first_task tarea
    return (TareaPresedencium.find_all_by_sucesora_id_and_predecesora_id(tarea.id, nil).count > 0)
  end

  def revision_start tarea
    return (tarea.columna == 3 && tarea.actividad.modo_revision != nil && tarea.actividad.modo_revision != "auto")
  end

  def revision_event tarea
    return (tarea.columna == 3 && tarea.actividad.modo_revision != nil && tarea.actividad.modo_revision != "auto")
  end

  def iniciar_flujo_revision tarea
    _flujo_iniciado = false
    Tarea.find_all_by_tarea_revisar_id(tarea.id).each do |tarea_revision|
      if(tarea_revision.activada)
        _flujo_iniciado = true
      end
    end

    if(!_flujo_iniciado)
      Tarea.find_all_by_tarea_revisar_id(tarea.id).each do |tarea_revision|
        tarea_revision.activada = 1
        tarea_revision.save!
      end

      TareaRevision.find_all_by_tarea_id(tarea.id).each do |revision|
        revision.aprobado = nil
        revision.save!
      end
    end
  end

  def evento_flujo_revision tarea
    #TareaPresedencium.find_all_by_predecesora_id_and_tipo_relacion(tarea.id,"revision").each do |presedencia|

    #tarea_revision = Tarea.find(presedencia.sucesora_id)
    #if(tarea_revision != nil) then
    #tarea_revision.activado = true
    #tarea_revision.save!
    #end
    #end
    #end

    tarea_revisar = Tarea.find(tarea.tarea_revisar_id)

    rechazada = (TareaRevision.find_all_by_tarea_id_and_aprobado(tarea_revisar.id, 0).count > 0)

    if(rechazada)

      TareaRevision.find_all_by_tarea_id(tarea_revisar.id).each do |revision|
        revision.aprobado = 0
        revision.save!
      end

      Tarea.find_all_by_tarea_revisar_id(tarea_revisar.id).each do |tarea_revision|
        tarea_revision.estado = 8
        tarea_revision.columna = 4
        tarea_revision.activada = 1
        tarea_revision.save!
      end

      tarea_revisar.estado = 1
      tarea_revisar.columna = 1
      tarea_revisar.save!

    else

      num_revisiones = TareaRevision.find_all_by_tarea_id(tarea_revisar.id).count
      num_aceptados = TareaRevision.find_all_by_tarea_id_and_aprobado(tarea_revisar.id, true).count

      if num_revisiones == num_aceptados then

        Tarea.find_all_by_tarea_revisar_id(tarea_revisar.id).each do |tarea_revision|
          tarea_revision.estado = 8
          tarea_revision.columna = 4
          tarea_revision.activada = 1
          tarea_revision.save!
        end

        tarea_revisar.estado = 8
        tarea_revisar.columna = 4
        tarea_revisar.save!

      end
    end
  end

  def evento_desicion tarea
    _desiciones = CompuertaDesicion.find_all_by_tarea_desicion_id(tarea.id)
    _desiciones.each do |_desicion|
      _ruta = Rutum.find_by_my_js_tree_id( _desicion.ruta_id)
      _nodes = MyJsTree.find_all_by_parent_id(_ruta.my_js_tree_id,:order => 'position')
      arreglo_nodos = convertir_en_arreglo _nodes
      primer_nodo = MyJsTree.find(arreglo_nodos.first)
      if primer_nodo.type == 'tarea_simple'|| primer_nodo.type == 'tarea_multi_seq'|| primer_nodo.type == 'tarea_multi_para' then
        _actividad = Actividad.find_by_my_js_tree_id(primer_nodo.id)
        _tarea = Tarea.find_by_actividad_id(_actividad.id)
      elsif primer_nodo.type == 'compuerta_exclu'|| primer_nodo.type == 'compuerta_inclu'|| primer_nodo.type == 'compuerta_para' then
        _compuerta = Compuertu.find_by_my_js_tree_id(primer_nodo.id)
        _tarea = Tarea.find_by_compuerta_id(_compuerta.id)
      end
      if _tarea != nil then
        des = 0
        if _desicion.elegida == true then
          des = 1
        else
          des = 0
        end
        _tarea.activada = des
        _tarea.save!
      end
    end
  end

  def evento_bucle tarea
    TareaPresedencium.find_all_by_predecesora_id_and_tipo_relacion(tarea.id, "bucle").each do |predecesora|
      t_partida = Tarea.find(predecesora.predecesora_id)
      es_ruta_activa = loop_ruta_activa t_partida, predecesora.loop_id
      if (t_partida.columna == 4 && t_partida.activada != nil &&  es_ruta_activa == true)then
        nodo_llegada = predecesora.sucesora_id
        #tarea de llegada reinicializada
        t_llegada = Tarea.find(nodo_llegada)
        # captura de id del arbol de los nodos de partida y llegada
          my_js_tree_partida = obtener_id_nodo_arbol t_partida
          my_js_tree_llegada = obtener_id_nodo_arbol t_llegada
        # definicion del camino hasta la llegada
        arreglo_actividades=[]
        tipos_tareas = ['tarea_simple','tarea_multi_seq', 'tarea_multi_para', "compuerta_exclu" , "compuerta_inclu" , "compuerta_para"]
        arreglo_padres = encontrar_camino my_js_tree_partida, my_js_tree_llegada, true
        arreglo_padres.each do |p|
          nodo = MyJsTree.find(p)
          if nodo.type == "ruta" || nodo.type == "evento_inicio" then
            hijos_rama = MyJsTree.find_all_by_parent_id(nodo.id, :conditions => [ "type IN (?)", tipos_tareas],:order => 'position')
            arreglo_hijos_rama = convertir_en_arreglo hijos_rama
            if arreglo_hijos_rama.member?(my_js_tree_llegada)
              num = arreglo_hijos_rama.index(my_js_tree_llegada)
              arreglo_hijos_rama = arreglo_hijos_rama.drop(num)
            end
            if arreglo_hijos_rama.member?(my_js_tree_partida)
              num = arreglo_hijos_rama.index(my_js_tree_partida)
              arreglo_hijos_rama = arreglo_hijos_rama[0, arreglo_hijos_rama.size - ((arreglo_hijos_rama.length-1)  - num)]
            end
            arreglo_actividades = arreglo_actividades + arreglo_hijos_rama
          end
        end
        arreglo_actividades.each do |ac|
          nodo = MyJsTree.find(ac)
          if nodo.type == 'tarea_simple'||nodo.type =='tarea_multi_seq'||nodo.type == 'tarea_multi_para' then
            act = Actividad.find_by_my_js_tree_id(ac)
            task = Tarea.find_all_by_actividad_id(act.id)
          elsif nodo.type == 'compuerta_exclu'||nodo.type =='compuerta_inclu'||nodo.type == 'compuerta_para'
            act = Compuertu.find_by_my_js_tree_id(ac)
            task = Tarea.find_all_by_compuerta_id(act.id)
          end
          task.each do |t|
          end
          task.each do |t| actualizar_tarea t, 1,1,nil end
          task.each do |t|
          end
        end
        #Actualizar la tarea de llegada y si tiene aprobacion tambien
        if t_llegada.actividad_id == nil
          llegada = Tarea.find_all_by_compuerta_id(t_llegada.compuerta_id)
        else
          llegada = Tarea.find_all_by_actividad_id(t_llegada.actividad_id)
        end
        llegada.each do |t|
          actualizar_tarea t, 1,1,0
          actualizar_tarea t, 1,1,1
        end
      end
    end
  end

  def loop_ruta_activa tarea_desicion, id_nodo__loop
    es_activa = false
    arreglo_desiciones = []
    desiciones = CompuertaDesicion.find_all_by_tarea_desicion_id_and_elegida(tarea_desicion.id,true)
    desiciones.each do |d|  arreglo_desiciones.push(d.ruta_id) end
    nodo__loop = MyJsTree.find(id_nodo__loop)
    if arreglo_desiciones.member?(nodo__loop.parent_id)
      es_activa = true
    end
    return es_activa
  end

  def obtener_id_nodo_arbol tarea
    if tarea.actividad_id != nil then
      my_js_tree = Actividad.find(tarea.actividad_id).my_js_tree_id
    else
      my_js_tree = Compuertu.find(tarea.compuerta_id).my_js_tree_id
    end
    return my_js_tree
  end

  def evento_merge tarea
    #rutas activas
    if tarea.columna == 4 then
      tipo_nodos =  ['compuerta_exclu', 'compuerta_para','compuerta_inclu','tarea_simple','tarea_multi_seq','tarea_multi_para']
      arreglo_tareas = []
      arreglo_tareas_desicion = []
      desiciones = CompuertaDesicion.find_all_by_tarea_desicion_id_and_elegida(tarea.id,true)
      desiciones.each do |desicion|
        ruta = Rutum.find_by_my_js_tree_id( desicion.ruta_id)
        nodos = MyJsTree.find_all_by_parent_id(ruta.my_js_tree_id, :conditions => [ "type IN (?)", tipo_nodos],:order => 'position')
        nodos.each do |nodo|
          if nodo.type == 'tarea_simple'|| nodo.type == 'tarea_multi_seq'|| nodo.type == 'tarea_multi_para' then
            _actividad = Actividad.find_by_my_js_tree_id(nodo.id)
            _tarea = Tarea.find_all_by_actividad_id(_actividad.id)
            # esto incluye las tareas de aprobacion y seguimiento
            _tarea.each do |t|
              arreglo_tareas.push(t)
            end
          elsif nodo.type == 'compuerta_exclu'|| nodo.type == 'compuerta_inclu'|| nodo.type == 'compuerta_para' then
            _compuerta = Compuertu.find_by_my_js_tree_id(nodo.id)
            _tarea = Tarea.find_by_compuerta_id(_compuerta.id)
            arreglo_tareas_desicion.push(_tarea)
          end
        end
      end
      #if tareas_aprobadas (arreglo_tareas) == true then
      if tareas_aprobadas(arreglo_tareas) == true && desiciones_aprobadas(arreglo_tareas_desicion, tarea) == true then
        tarea_merge_id = TareaPresedencium.find_by_predecesora_id_and_tipo_relacion(tarea.id,"merge").sucesora_id
        tarea_merge = Tarea.find(tarea_merge_id)
        if tarea_merge.activada != true then
          actualizar_tarea tarea_merge, 1,1,1
        end
      end
    end
  end

  def tareas_aprobadas arreglo_tareas
    #compara las tareas activas contra las tareas finalizadas
    aprobadas = false
    if arreglo_tareas.size > 0 then
      contador_aprobadas = 0
      arreglo_tareas.each do |task|
        if task.estado == 8 then
          contador_aprobadas = contador_aprobadas + 1
        end
      end
      #si son iguales se ejecutaron todas las tareas
      if contador_aprobadas == arreglo_tareas.size
        aprobadas = true
      end
    end
    return aprobadas
  end

  def desiciones_aprobadas arreglo_tareas_desicion, tarea
    #inicializacion de variables
    aprobadas = true
    rutas_definitivas = []
    arreglo_tareas = []
    arreglo_rutas_aprobadas = []
    arreglo_rutas_camino  = []
    arreglo_caminos = []
    tipo_nodos =  ['tarea_simple','tarea_multi_seq','tarea_multi_para']
    #por cada tarea de desicion encuentre los caminos de finalizacion y elimine aquellos que no posean rutas activas
    # de todas las tareas de desicion
    if arreglo_tareas_desicion != [] then
      arreglo_tareas_desicion.each do |td|
        nodo_tarea = obtener_id_nodo_arbol td
        arreglo_caminos = obtencion_caminos nodo_tarea, tarea
        arreglo_caminos.each do |camino|
          rutas_camino = MyJsTree.find_all_by_proceso_id(tarea.proceso_id, :conditions => [ "id IN (?) AND type = ?", camino, "ruta"])
          arreglo_rutas_camino = convertir_en_arreglo rutas_camino
          desiciones = CompuertaDesicion.find_all_by_elegida(true,:conditions => [ "ruta_id IN (?)", arreglo_rutas_camino])
          #El numero de rutas del camino debe ser el mismo que el numero de rutas aprobadas
          if arreglo_rutas_camino.size == desiciones.count then
            rutas_definitivas.push(arreglo_rutas_camino)
          end
        end
      end

      if rutas_definitivas == [] then
        # si no quedan caminos aprobados la tarea no se aprueba
        aprobadas = false
      else
      if rutas_definitivas.size == arreglo_caminos.size then
          #si hay caminos con rutas aprobadas todas sus tareas deben ser aprobadas para que se apruebe el camino
          rutas_definitivas.each do |camino|
            camino.each do |r|
              nodos = MyJsTree.find_all_by_parent_id(r, :conditions => [ "type IN (?)", tipo_nodos],:order => 'position')
              nodos.each do |nodo|
                _actividad = Actividad.find_by_my_js_tree_id(nodo.id)
                # esto incluye las tareas de aprobacion y seguimiento
                _tarea = Tarea.find_all_by_actividad_id(_actividad.id)
                _tarea.each do |t|
                  arreglo_tareas.push(t)
                end
              end
              arreglo_rutas_aprobadas.push(tareas_aprobadas arreglo_tareas)
            end
          end
          #si todos los caminos fueron aprobados se aprueba la tarea de desicion
          if arreglo_rutas_aprobadas.include? false then
            aprobadas = false
          end
        else
          aprobadas = false
        end
      end
    end
    return aprobadas
  end

  def obtencion_caminos nodo_tarea_desicion, tarea
    arreglo_predecesoras = []
    arreglo_nodos_partida = []
    arreglo_caminos = []
    #identifique el nodo evento de inicio como punto de llegada
    nodo_llegada = MyJsTree.find_by_proceso_id(tarea.proceso_id, :conditions => [ "type = ?", "evento_inicio"]).id
    #Encuentre todos los nodos de finalizacion del arbol y ubiquelos en un arreglo
    tareas_finalizacion =  TareaPresedencium.find_all_by_proceso_id_and_sucesora_id(tarea.proceso_id,nil)
    tareas_finalizacion.each do |tf|
      arreglo_predecesoras.push(tf.predecesora_id)
    end
    tareas = Tarea.find_all_by_proceso_id(tarea.proceso_id,:conditions => [ "id IN (?)", arreglo_predecesoras])
    tareas.each do |t|
      #por cada tarea obtener el id del arbol asociado
      nodo_arbol = obtener_id_nodo_arbol t
      arreglo_nodos_partida.push(nodo_arbol)
    end
    #por cada nodo de partida encuentre un camino de llegada y elimine los nodos y caminos innecesarios
    arreglo_nodos_partida.each do |nodo_partida|
      camino = encontrar_camino nodo_partida, nodo_llegada, true
      if camino.include? nodo_tarea_desicion then
        #elimine los nodos innecesarios
        camino = camino[0, camino.size - ((camino.length)  - camino.index(nodo_tarea_desicion))]
        arreglo_caminos.push(camino)
      end
    end
    return arreglo_caminos
  end

  def actualizar_tarea (task,est,col,act)

  task.update_attributes(:estado => est, :columna => col, :activada => act)

  if task.es_desicion == true then
    desiciones = CompuertaDesicion.find_all_by_tarea_desicion_id(task.id)
    desiciones.each do |f|
      f.destroy
    end
  end
  if task.es_aprobacion == true then
    revisiones = TareaRevision.find_all_by_tarea_id(task.tarea_revisar_id)
    revisiones.each do |f|
      f.update_attributes(:aprobado => nil,:comentario => nil)
    end
    aprobaciones = TareaAprobacion.find_all_by_tarea_id(task.tarea_revisar_id)
    aprobaciones.each do |f|
      f.update_attributes(:aprobado => nil,:comentario => nil)
    end
  end
end

end

