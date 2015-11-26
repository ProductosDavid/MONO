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
class TareasController < ApplicationController
  # GET /tareas
  # GET /tareas.json
  before_filter :authenticate_user!
  include LoopsHelper
  include MergeHelper

  def index
    @proceso = Proceso.find(params[:proceso_id])
    @actividades = @proceso.actividads.all
    @tareas = @proceso.tareas.all

    @organizaciones = Array.new
    @proyecto_orgs = ProyectoOrganizacion.find_all_by_proyecto_id(@proceso.proyecto_id)
    @proyecto_orgs.each do |proyect_org|
      @organizaciones.push proyect_org.organizacion
    end

    @tarea = Tarea.new
    @tarea_participante = TareaParticipante.new
    @tarea_recurso = TareaRecurso.new
    @tarea_artefacto = TareaArtefacto.new

    crear_programa()

    @tareas = @proceso.tareas.all

    respond_to do |format|
      format.html { render :layout => 'actividads'}
      format.json { render json: @tareas }
    end
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarea }
    end
  end

  # GET /tareas/new
  # GET /tareas/new.json
  def new
    @tarea = Tarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea }
    end
  end

  # GET /tareas/1/edit
  def edit
    @tarea = Tarea.find(params[:id])
  end

  # POST /tareas
  # POST /tareas.json
  def create
    @tarea = Tarea.new(params[:tarea])

    respond_to do |format|
      if @tarea.save
        format.html { redirect_to @tarea, notice: 'Tarea was successfully created.' }
        format.json { render json: @tarea, status: :created, location: @tarea }
      else
        format.html { render action: "new" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareas/1
  # PUT /tareas/1.json
  def update
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
        format.html { redirect_to @tarea, notice: 'Tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea = Tarea.find(params[:id])
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to tareas_url }
      format.json { head :no_content }
    end
  end

  def crear_programa

    @proceso = Proceso.find(params[:proceso_id])

    @actividades = Actividad.find_all_by_proceso_id(@proceso.id)

    prioridad = 0

    @actividades.each do |actividad|

      @tarea_existentes = Tarea.find_all_by_actividad_id(actividad.id, nil)
      @num_inst_anterior = @tarea_existentes.count()

      if actividad.num_instancias != nil then
        @num_instancias = actividad.num_instancias
      else
        @num_instancias = 1
      end

      if @num_inst_anterior > @num_instancias then

        until @num_inst_anterior == @num_instancias do
          @num_inst_anterior -= 1;
          Tarea.destroy_all("inst_num ="+ @num_inst_anterior.to_s + " and actividad_id =" + actividad.id.to_s)
        end
      end

      prioridad = prioridad + 1

      if actividad.modoejecucion == 1 then

        if @num_inst_anterior == 0 then

          @task = Tarea.new(
              :nombre => actividad.nombre,
              :descripcion => actividad.descripcion,
              :actividad_id => actividad.id,
              :fecha_inicio => nil,
              :fecha_fin => nil,
              :inst_num => 0,
              :duracion => actividad.duracion,
              :horas_planeadas => actividad.horas_estimadas,
              :horas_ejecutadas => 0,
              :responsable_id => actividad.responsable_id,
              :proceso_id => actividad.proceso_id,
              :prioridad => prioridad,
              :estado => 1,
              :columna => 1)

          @task.save!

        end
      end

      if actividad.modoejecucion == 2 || actividad.modoejecucion == 3 then

        @num_inst_agregar = @num_instancias
        @i = @num_inst_anterior

        until @i >= @num_inst_agregar do

          @task = Tarea.new(
              :nombre => actividad.nombre + " " + @i.to_s(),
              :descripcion => actividad.descripcion,
              :actividad_id => actividad.id,
              :fecha_inicio => nil,
              :fecha_fin => nil,
              :inst_num => @i,
              :duracion => actividad.duracion,
              :horas_planeadas => actividad.horas_estimadas,
              :horas_ejecutadas => 0,
              :responsable_id => actividad.responsable_id,
              :proceso_id => actividad.proceso_id,
              :prioridad => prioridad,
              :estado => 1,
              :columna => 1)

          @task.save!

          @i += 1

        end

      end

      # crear_revisiones actividad
    end

    @compuertas = Compuertu.find_all_by_proceso_id(@proceso.id)

    @compuertas.each do |compuerta|

      if(Tarea.find_by_compuerta_id(compuerta.id) == nil)

        prioridad = prioridad + 1

        @task = Tarea.new(
            :nombre => compuerta.nombre,
            :descripcion => compuerta.descripcion,
            :fecha_inicio => nil,
            :fecha_fin => nil,
            :inst_num => 1,
            :duracion => 1,
            :horas_planeadas => 1,
            :horas_ejecutadas => 0,
            :proceso_id => compuerta.proceso_id,
            :prioridad => prioridad,
            :compuerta_id => compuerta.id,
            :es_desicion => true,
            :estado => 1,
            :columna => 1)

        @task.save!
      end

    end

    @precedencias = TareaPresedencium.find_all_by_proceso_id(@proceso.id)
    @precedencias.each do |presedencia|
      presedencia.delete
    end

    @tree_root  = MyJsTree.find_by_proceso_id_and_type(@proceso.id, "root")
    #crear precedencia de tareas basica, OJO no cambiar el orden de estos metodos, se ejecutan por jerarquia
    crear_precedencias @proceso.id, @tree_root.id, nil
    finalizar_precedencias @proceso.id
    #identificar los loops y actualizar la tabla de precedencias
    revisarloops @proceso.id, @tree_root.id
    #agregar todos los padres de las tareas sucesoras
    agregar_rutas_precedencia @proceso.id
    #evaluar los casos de merge de forma automatica
    evaluar_merges @proceso.id
  end

  def crear_precedencias (proceso_id, tree_node_id, ultima_tarea)

    _ultima_tarea = ultima_tarea
    _tree_nodes = MyJsTree.find_all_by_proceso_id_and_parent_id(proceso_id, tree_node_id,:order => 'position')
    if(_tree_nodes.count() > 0)

      _sorted_pos = SortedSet.new
      _sorted_nodes = Hash.new

      _num=0
      _tree_nodes.each do |child_node|
        _sorted_pos << child_node.position
        #_sorted_nodes[_sorted_pos] = child_node
        _sorted_nodes[_num] = child_node
        _num += 1
      end

      _i=0
      until _i >= _num  do
        _child_node = _sorted_nodes[_i]

        if _child_node.type == "tarea_simple" || _child_node.type == "tarea_multi_seq" || _child_node.type == "tarea_multi_para" ||
            _child_node.type == "tarea_simple_rev" || _child_node.type == "tarea_multi_seq_rev" || _child_node.type == "tarea_multi_para_rev"
        then

          _actividad = Actividad.find_by_proceso_id_and_my_js_tree_id(proceso_id, _child_node.id)
          _tareas = Tarea.find_all_by_proceso_id_and_actividad_id(proceso_id, _actividad.id)

          _tareas.each do |tarea|

            _tarea_presedencia = TareaPresedencium.new(
                :predecesora_id => _ultima_tarea,
                :sucesora_id => tarea.id,
                :proceso_id => proceso_id
            )

            _tarea_presedencia.save!

            if _actividad.modoejecucion == 2 || _actividad.modoejecucion == 1 then
              _ultima_tarea = tarea.id
            end
          end

          if _actividad.modoejecucion == 3 && _tareas.count() > 0
            _ultima_tarea = _tareas.last().id
          end
        end

        if _child_node.type == "compuerta_inclu" || _child_node.type == "compuerta_exclu" || _child_node.type == "compuerta_para"
        then
          _compuerta = Compuertu.find_by_proceso_id_and_my_js_tree_id(proceso_id, _child_node.id)
          _tarea = Tarea.find_by_proceso_id_and_compuerta_id(proceso_id, _compuerta.id)

          _tarea_presedencia = TareaPresedencium.new(
              :predecesora_id => _ultima_tarea,
              :sucesora_id => _tarea.id,
              :proceso_id => proceso_id
          )

          _tarea_presedencia.save!

          _ultima_tarea = _tarea.id
        end

        crear_precedencias(proceso_id, _child_node.id, _ultima_tarea)
        _i += 1
      end
    end

      return true
  end

  def revisarloops (proceso_id, tree_node_id)

    _tree_nodes_bucles = MyJsTree.find_all_by_proceso_id_and_type(proceso_id, "loop")

    if(_tree_nodes_bucles.count() > 0) then
      _tree_nodes_bucles.each do |buc|
        _loop = Loop.find_by_proceso_id_and_my_js_tree_id(proceso_id, buc.id)
        unless _loop.compuerta_id == "" && _loop.actividad_id == "" then
          precedencias_agregar buc, _loop.actividad_id, _loop.compuerta_id
        end
      end
    end
  end



  def finalizar_precedencias proceso_id

    _tareas = Tarea.find_all_by_proceso_id(proceso_id)
    _tareas.each do |tarea|

      _predecesoras = TareaPresedencium.find_all_by_predecesora_id(tarea.id)
      _sucesoras = TareaPresedencium.find_all_by_sucesora_id(tarea.id)

      if(_predecesoras.count == 0 && _sucesoras.count > 0)
        _tarea_presedencia = TareaPresedencium.new(
            :predecesora_id => tarea.id,
            :sucesora_id => nil,
            :proceso_id => @proceso.id
        )

        _tarea_presedencia.save!
      end
    end

  end

  def asignar_responsable
    @tarea_id = params[:id_tarea];
    @responsable_id = params[:id_responsable];

    @tarea = Tarea.find(@tarea_id)
    @tarea.responsable_id = @responsable_id

    if @tarea.save

      @proyecto_usuarios = ProyectoUsuario.find_all_by_proyecto_id_and_usuario_id(@tarea.proceso.proyecto_id, @tarea.responsable_id)
      if @proyecto_usuarios.count() == 0 then

        @proyecto_usuario = ProyectoUsuario.new(
            :usuario_id => @tarea.responsable_id,
            :proyecto_id => @tarea.proceso.proyecto_id
        )

        @proyecto_usuario.save
      end
      redirect_to request.protocol + request.host_with_port + "/tareas?proceso_id=+" + @tarea.proceso_id.to_s()

    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar_tarea
    @tarea_id = params[:id_tarea]
    @valor = params[:valor]
    @campo = params[:campo]

    @tarea = Tarea.find(@tarea_id)

    if @campo == "nombre" then
        @tarea.nombre = @valor
    end
    if @campo == "descripcion" then
        @tarea.descripcion = @valor
    end
    if @campo == "estado" then
        @tarea.estado = @valor
    end
    if @campo == "prioridad" then
        @tarea.prioridad = @valor
    end
    if @campo == "duracion" then
        @tarea.duracion = @valor
    end
    if @campo == "horas_planeadas" then
        @tarea.horas_planeadas = @valor
    end

    if @campo == "fecha_inicio" then
      @tarea.fecha_inicio = @valor
    end

    if @campo == "fecha_fin" then
      @tarea.fecha_fin = @valor
    end

    if @campo == "hito" then
      @tarea.hito = @valor
    end


    if @tarea.save then
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def get_json_data
    _tarea_id = params[:id_tarea]
    _tarea = Tarea.find(_tarea_id);

    @result = Hash.new

    @result[:nombre] = _tarea.nombre;
    @result[:descripcion] = _tarea.descripcion;

    if FileTest.exist?(Dir.pwd + "/public/images/actividades/" + _tarea.actividad.id.to_s() + "_original.img") then
      @result[:imagen] = "/images/actividades/" + _tarea.actividad.id.to_s() + "_original.img"
    else
      @result[:imagen] = "/images/noimage.jpg"
    end

    @result[:tipo_control] = _tarea.actividad.tipocontrol
    @result[:fecha_inicio] = _tarea.fecha_inicio
    @result[:fecha_fin] = _tarea.fecha_fin
    @result[:horas_planeadas] = _tarea.horas_planeadas != nil ? _tarea.horas_planeadas : 0
    @result[:horas_ejecutadas] = _tarea.horas_ejecutadas != nil ? _tarea.horas_ejecutadas : 0
    @result[:avance] = _tarea.avance != nil ? _tarea.avance : 0
    @result[:columna] = _tarea.columna

    @result[:modo_revision] = _tarea.actividad.modo_revision

    @result[:entradas]= ""
    @result[:salidas]= ""
    _tipoartefactos = ActividadTipoartefacto.find_all_by_actividad_id(_tarea.actividad.id)
     _tipoartefactos.each do |act_tipoartefacto|
        if(act_tipoartefacto.modo == "In" || act_tipoartefacto.modo == "In/Out")
          @result[:entradas] += act_tipoartefacto.tipo_artefacto.nombre + ","
        elsif(act_tipoartefacto.modo == "Out" || act_tipoartefacto.modo == "In/Out")
          @result[:salidas] += act_tipoartefacto.tipo_artefacto.nombre + ","
        else
        end
     end

    render :json => @result
  end


end
