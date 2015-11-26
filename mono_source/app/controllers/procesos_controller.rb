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
require 'rbconfig'
require 'fileutils'
require 'rexml/document'
require 'bunny'

include REXML
include Config
include ProcesosHelper
include XpdlHelper
include PnmlHelper
include XpdldataHelper
include LoopsHelper


class ProcesosController < ActionController::Base
  # GET /procesos
  # GET /procesos.json
  #before_filter :authenticate_user!


  def index
    @procesos = Proceso.all.sort_by(&:created_at).reverse
    @proceso = Proceso.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procesos }
    end
  end


  # GET /procesos/1
  # GET /procesos/1.json
  def show
    @proceso = Proceso.find(params[:id])
    @proyecto=Proyecto.find_by_id(@proceso.proyecto_id)

    @actividades= @proceso.actividads.all

    @tipo_recursos=TipoRecurso.all.uniq

    respond_to do |format|
      format.html { render :layout => 'proyectos1' } # show.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/new
  # GET /procesos/new.json

  def change_tipoPlantilla #Funcion Ajax que modificara el combo de plantillas
    @obj_proceso = Proceso.new()
    @list_plantillas = Plantillas.find(:all, :conditions => {:tipo_plantilla_id => params[:tipo_plantilla_id_id].to_i})

    #change_companies.rjs
    page.replace_html("list_plantillas", :partial => "select_plantillas")
  end

  def getTipoPlantilla

    @data_for_select2 = TipoPlantilla.all

    #render :json =>"{"+@comilla+"1"+@comilla+":"+@comilla+"Alto Orinoco"+@comilla+","+@comilla+"2"+@comilla+":"+@comilla+"Huachamacare"+@comilla+"}"
    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    @data = @c+"({"+"\""
    @data_for_select2.each do |select|

      @data = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

      if @tam!=@i
        @data=@data+","+"\""
      else
        @data=@data+"})"
      end
      @i=@i+1
    end
    #3143216669

    #  @data=@c+"({"+"\""+"1"+"\""+":"+"\""+"Hola"+"\""+","+"\""+"3"+"\""+":"+"\""+"Chao"+"\""+"})"
    #@data=TipoPlantilla.all.map{|p| [p.id.to_s,p.id.to_s+":"+p.nombre] }
    #render :json => @data_for_select2.map{|c| [c.id.to_s(), c.nombre] }
    render :text => @data

  end

  def getdata

    @comilla='"';
    @data_for_select1 = params[:tipo_plantilla]

    @data_for_select2 = Plantilla.where(:tipo_plantilla_id => @data_for_select1).all
    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    if @tam!=0

      @data = @c+"({"+"\""

      @data_for_select2.each do |select|

        @data = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

        if @tam!=@i
          @data=@data+","+"\""
        else
          @data=@data+"})"
        end

        @i=@i+1

      end

    else
      @data=""
    end

    render :json => @data

  end

  def new

    @proceso = Proceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/1/edit
  def edit
    @proceso = Proceso.find(params[:id])
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(params[:proceso])
    @proceso.proyecto_id=params[:proyecto_id]
    @proceso.tipo_plantilla_id=params[:proceso_tipo_plantilla]
    @id_plantilla = params[:plantilla]

    if (@id_plantilla == nil)
      @id_plantilla = 22
    end

    @proyecto = Proyecto.find(params[:proyecto_id])
    @procesos= Proceso.find_all_by_proyecto_id(:proyecto_id)

    lunes = params[:lunes]
    martes = params[:martes]
    miercoles = params[:miercoles]
    jueves = params[:jueves]
    viernes = params[:viernes]
    sabado = params[:sabado]
    domingo = params[:domingo]
    if (lunes == '')
      lunes = 0
    end
    if (martes == '')
      martes = 0
    end
    if (miercoles == '')
      miercoles = 0
    end
    if (jueves == '')
      jueves = 0
    end
    if (viernes == '')
      viernes = 0
    end
    if (sabado == '')
      sabado = 0
    end
    if (domingo == '')
      domingo = 0
    end

    @proceso.lunes = lunes
    @proceso.martes = martes
    @proceso.miercoles = miercoles
    @proceso.jueves = jueves
    @proceso.viernes = viernes
    @proceso.sabado = sabado
    @proceso.domingo = domingo
    @proceso.fechaini = params[:fini]
    @proceso.fechafin = params[:ffin]

    respond_to do |format|
      if @proceso.save

        clonar_plantilla(@id_plantilla, @proceso.id)


        horastrabajadas = [domingo, lunes, martes, miercoles, jueves, viernes, sabado]
        crearCalendario(@proyecto, @proceso.id, horastrabajadas, params[:fini], params[:ffin])

        format.html { redirect_to @proceso, notice: 'Proceso was successfully created.' }
        format.json { render json: @proceso, status: :created, location: @proceso }
      else
        format.html { render action: "new" }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  def crearCalendario(proyecto, proceso_id, horastrabajadas, fini, ffin)
    dayweek = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"]
    fecha_ini = Date.parse(fini)
    fecha_fin = Date.parse(ffin)

    while fecha_ini <= fecha_fin do
      calendario = Calendario.new(:fecha => fecha_ini, :horas => horastrabajadas[fecha_ini.wday], :dia => dayweek[fecha_ini.wday], :proceso_id => proceso_id)
      fecha_ini = fecha_ini + 1.days
      calendario.save!
    end
  end

  # PUT /procesos/1
  # PUT /procesos/1.json
  def update
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      if @proceso.update_attributes(params[:proceso])
        format.html { redirect_to @proceso, notice: 'Proceso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso = Proceso.find(params[:id])
    @proceso.destroy

    respond_to do |format|
      format.html { redirect_to procesos_url }
      format.json { head :no_content }
    end
  end

  def crear_procesoopt
    generate_xpdl_metamodel
    generate_pnml_metamodel
    generate_data_process

    conn = Bunny.new(:automatically_recover => false)
    conn.start

    ch = conn.create_channel
    q = ch.queue("envio", :durable => true)
    msg = params[:id_proceso]

    q.publish(msg, :persistent => true)

    conn.close
  end

  def crear_procesooptimi
    _id_proceso = params[:id_proceso]

    @proceso = Proceso.find(_id_proceso)

    puts "hola"
    xmlfile = File.new("public/templates/gantt.xml")
    puts "hola1"
    xmldoc = Document.new(xmlfile)
    puts "hola2"

    @procesoOpt = Proceso.new
    @procesoOpt.nombre = @proceso.nombre + " Optimizado"
    @procesoOpt.descripcion = @proceso.descripcion + " Optimizado"
    @procesoOpt.tipo_plantilla = @proceso.tipo_plantilla
    @procesoOpt.proyecto_id = @proceso.proyecto_id
    @procesoOpt.estado = @proceso.estado
    @procesoOpt.lunes = @proceso.lunes
    @procesoOpt.martes = @proceso.martes
    @procesoOpt.miercoles = @proceso.miercoles
    @procesoOpt.jueves = @proceso.jueves
    @procesoOpt.viernes = @proceso.viernes
    @procesoOpt.sabado = @proceso.sabado
    @procesoOpt.domingo = @proceso.domingo
    @procesoOpt.fechaini = @proceso.fechaini
    @procesoOpt.fechafin = @proceso.fechafin

    @procesoOpt.save!

    @my_js_treeRoot = MyJsTree.new(
        :position => 0,
        :left => 0,
        :right => 0,
        :level => 0,
        :title => "Proceso",
        :type => "root",
        :proceso_id => @procesoOpt.id
    )

    @my_js_treeRoot.save!

    @my_js_treeIni = MyJsTree.new(
        :parent_id => @my_js_treeRoot.id,
        :position => 0,
        :left => 0,
        :right => 0,
        :level => 0,
        :title => "Inicio",
        :type => "evento_inicio",
        :proceso_id => @procesoOpt.id
    )

    @my_js_treeIni.save!

    @eventoIni = Evento.new(
        :nombre => "Inicio",
        :descripcion => "",
        :tipo => 1,
        :my_js_tree_id => @my_js_treeIni.id,
        :proceso_id => @procesoOpt.id
    )

    @eventoIni.save!

    _i = 0
    # This will output all the movie titles.
    xmldoc.elements.each("project/tasks/task") {
        |e|
      @actividad = Actividad.find(e.attributes["id"])
      @actividadOpt = Actividad.new(
          :nombre => @actividad.nombre,
          :descripcion => @actividad.descripcion,
          :modoejecucion => @actividad.modoejecucion,
          :duracion => @actividad.duracion,
          :plantilla_id => @actividad.plantilla_id,
          :proceso_id => @procesoOpt.id,
          :num_instancias => @actividad.num_instancias,
          :responsable_id => @actividad.responsable_id,
          :horas_estimadas => @actividad.horas_estimadas,
          :tipocontrol => @actividad.tipocontrol,
          :modo_revision => @actividad.modo_revision
      )

      @nodo = MyJsTree.new(
          :parent_id => @my_js_treeIni.id,
          :position => _i,
          :type => "tarea_simple",
          :title => @actividadOpt.nombre,
          :plantilla_id => @actividadOpt.plantilla_id,
          :proceso_id => @procesoOpt.id,
          :left => 0,
          :right => 0,
          :level => 0
      )

      if @nodo.save
        @actividadOpt.my_js_tree_id = @nodo.id
        if @actividadOpt.save
          @tarea = Tarea.where(:actividad_id => @actividad.id, :proceso_id => @proceso.id).first()
          if (@tarea!= nil)
            @tareaOpt = Tarea.new(
                :nombre => @tarea.nombre,
                :descripcion => @tarea.descripcion,
                :actividad_id => @actividadOpt.id,
                :fecha_inicio => e.attributes["start"],
                :fecha_fin => @tarea.fecha_fin,
                :responsable_id => @tarea.responsable_id,
                :prioridad => @tarea.prioridad,
                :comentarios => @tarea.comentarios,
                :avance => @tarea.avance,
                :duracion => e.attributes["duration"],
                :horas_planeadas => @tarea.horas_planeadas,
                :horas_ejecutadas => @tarea.horas_ejecutadas,
                :inst_num => @tarea.inst_num,
                :proceso_id => @procesoOpt.id,
                :estado => @tarea.estado,
                :columna => @tarea.columna,
                :hito => @tarea.hito,
                :horas_acumuladas => @tarea.horas_acumuladas,
                :activada => @tarea.activada,
                :es_aprobacion => @tarea.es_aprobacion,
                :tarea_revisar_id => @tarea.tarea_revisar_id,
                :es_desicion => @tarea.es_desicion,
                :compuerta_id => @tarea.compuerta_id
            )
            if @tareaOpt.save

            end
          end
        end
      end
      _i = _i + 1
    }

    @my_js_treeFin = MyJsTree.new(
        :parent_id => @my_js_treeIni.id,
        :position => _i,
        :left => 0,
        :right => 0,
        :level => 0,
        :title => "Fin",
        :type => "evento_fin",
        :proceso_id => @procesoOpt.id
    )

    @my_js_treeFin.save!

    @eventoFin = Evento.new(
        :nombre => "Fin",
        :descripcion => "",
        :tipo => 2,
        :my_js_tree_id => @my_js_treeFin.id,
        :proceso_id => @procesoOpt.id
    )

    @eventoFin.save!

    puts "termine"
    sleep 5

    if @proceso.save then
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def clonar_plantilla(id_plantilla, id_proceso)

    @id_plantilla = id_plantilla
    @id_proceso = id_proceso

    @plantilla = Plantilla.find(@id_plantilla)

      @my_js_all_tress = Array.new
      @my_js_all_oldnew = Hash.new

      @my_js_tree_origen = MyJsTree.find_by_plantilla_id(@plantilla.id)
      @my_js_tree = MyJsTree.new(
        :parent_id => 0,
        :position => @my_js_tree_origen.position,
        :left => @my_js_tree_origen.left,
        :right => @my_js_tree_origen.right,
        :title => @my_js_tree_origen.title,
        :type => @my_js_tree_origen.type,
        :level => @my_js_tree_origen.level,
        :proceso_id => Proceso.last().id
    )

    @my_js_tree.save!

    @my_js_all_tress.push @my_js_tree
    @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

    @actividades = Actividad.find_all_by_plantilla_id(@id_plantilla)

    @actividades.each do |origen_act|

      @my_js_tree_origen = MyJsTree.find(origen_act.my_js_tree_id)
      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      @actividad = Actividad.new(
          :nombre => origen_act.nombre,
          :descripcion => origen_act.descripcion,
          :modoejecucion => origen_act.modoejecucion,
          :duracion => origen_act.duracion,
          :horas_estimadas => 1,
          :num_instancias => 1,
          :tipocontrol => origen_act.tipocontrol,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      if (@actividad.save!)

        @act_tipo_recursos = ActividadTiporecurso.find_all_by_actividad_id(origen_act.id)

        @act_tipo_recursos.each do |origen_acttiporec|
          @act_tipo_recurso = ActividadTiporecurso.new(
              :actividad_id => Actividad.last().id,
              :tipo_recurso_id => origen_acttiporec.tipo_recurso_id,
              :cantidad => origen_acttiporec.cantidad
          )

          @act_tipo_recurso.save!

        end

        @act_tipo_artefactos = ActividadTipoartefacto.find_all_by_actividad_id(origen_act.id)

        @act_tipo_artefactos.each do |origen_acttipoart|
          @act_tipo_artefacto = ActividadTipoartefacto.new(
              :actividad_id => Actividad.last().id,
              :tipo_artefacto_id => origen_acttipoart.tipo_artefacto_id,
              :modo => origen_acttipoart.modo
          )

          @act_tipo_artefacto.save!

        end
      end

    end

    @compuertus = Compuertu.find_all_by_plantilla_id(@id_plantilla)

    @compuertus.each do |origen_com|

      @my_js_tree_origen = MyJsTree.find(origen_com.my_js_tree_id)
      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      @compuertu = Compuertu.new(
          :nombre => origen_com.nombre,
          :descripcion => origen_com.descripcion,
          :tipo => origen_com.tipo,
          :desicion => origen_com.desicion,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      @compuertu.save!

    end

    @eventos = Evento.find_all_by_plantilla_id(@id_plantilla)

    @eventos.each do |origen_eve|

      @my_js_tree_origen = MyJsTree.find(origen_eve.my_js_tree_id)

      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      @evento = Evento.new(
          :nombre => origen_eve.nombre,
          :tipo => origen_eve.tipo,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      @evento.save!

    end

    @rutas = Rutum.find_all_by_plantilla_id(@id_plantilla)

    @rutas.each do |origen_rut|

      @my_js_tree_origen = MyJsTree.find(origen_rut.my_js_tree_id)

      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      @ruta = Rutum.new(
          :nombre => origen_rut.nombre,
          :tipo => origen_rut.tipo,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      @ruta.save!

    end


    @loops = Loop.find_all_by_plantilla_id(@id_plantilla)

    act_plantilla = Actividad.find_all_by_plantilla_id(@id_plantilla, :order => 'id')
    act_proceso = Actividad.find_all_by_proceso_id(Proceso.last().id, :order => 'id')
    comp_plantilla = Compuertu.find_all_by_plantilla_id(@id_plantilla, :order => 'id')
    comp_proceso = Compuertu.find_all_by_proceso_id(Proceso.last().id, :order => 'id')

    act_plantilla_array = convertir_en_arreglo act_plantilla
    act_proceso_array = convertir_en_arreglo act_proceso
    comp_plantilla_array = convertir_en_arreglo comp_plantilla
    comp_proceso_array = convertir_en_arreglo comp_proceso

    # File.open('log-prueba.txt', 'a+') do |f2|
    #   f2.puts "comp_plantilla_array: #{comp_plantilla_array}"
    #   f2.puts "comp_proceso_array: #{comp_proceso_array}"
    # end


    @loops.each do |origen_lop|

      @my_js_tree_origen = MyJsTree.find(origen_lop.my_js_tree_id)

      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      if origen_lop.compuerta_id != nil then
        comp_id = comp_proceso_array[comp_plantilla_array.index(origen_lop.compuerta_id)]
      else
        comp_id = origen_lop.compuerta_id
      end

      if origen_lop.actividad_id != nil then
        acti_id = act_proceso_array[act_plantilla_array.index(origen_lop.actividad_id)]
      else
        acti_id = origen_lop.actividad_id
      end

      @loop = Loop.new(
          :nombre => origen_lop.nombre,
          :actividad_id => acti_id,
          :compuerta_id => comp_id,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      @loop.save!

    end

    @merges = Merge.find_all_by_plantilla_id(@id_plantilla)

    @merges.each do |origen_mer|

      @my_js_tree_origen = MyJsTree.find(origen_mer.my_js_tree_id)

      @my_js_tree = MyJsTree.new(
          :parent_id => @my_js_tree_origen.parent_id,
          :position => @my_js_tree_origen.position,
          :left => @my_js_tree_origen.left,
          :right => @my_js_tree_origen.right,
          :title => @my_js_tree_origen.title,
          :type => @my_js_tree_origen.type,
          :level => @my_js_tree_origen.level,
          :proceso_id => Proceso.last().id
      )

      @my_js_tree.save!

      @my_js_all_tress.push @my_js_tree
      @my_js_all_oldnew[@my_js_tree_origen.id] = MyJsTree.last().id

      @merge = Merge.new(
          :nombre => origen_mer.nombre,
          :proceso_id => Proceso.last().id,
          :my_js_tree_id => MyJsTree.last().id
      )

      @merge.save!

    end

    @my_js_all_tress.each do |js_tree|
      js_tree.parent_id = @my_js_all_oldnew[js_tree.parent_id]
      js_tree.save!

    end
    end

  def aprobaciones
    @infotoshow = Array.new
    @proceso = Proceso.find(params[:id_proceso])
    @actividades = Actividad.where("proceso_id =" + @proceso.id.to_s + " AND modo_revision IS NOT NULL")

    @actividades.each do |unaactividad|
      @elemento = Hash.new
      @elemento["nombre"] = unaactividad.nombre
      @elemento["id"] = unaactividad.id
      @elemento["modo_revision"] = unaactividad.modo_revision
      @lastareas = Tarea.find_all_by_actividad_id(unaactividad.id)
      @subelemento = Array.new
      @lastareas.each do |unatarea|
        if !unatarea.es_aprobacion
          @subelementohash = Hash.new
          @subelementohash["tarea_nombre"] = unatarea.nombre
          @subelementohash["tarea_id"] = unatarea.id
          @subelementohash["revisiones"] = Array.new
          @subelementohash["aprobaciones"] = Array.new

          revisiones = TareaRevision.find_all_by_tarea_id(unatarea.id)
          revisiones.each do |unarevision|
            @revisionhash = Hash.new
            @revisionhash["usuario"] = Usuario.find(unarevision.usuario_id).nombre
            @revisionhash["aprobado"] = unarevision.aprobado.to_s
            @revisionhash["turno"] = unarevision.turno.to_s
            @subelementohash["revisiones"].push @revisionhash
          end

          aprobaciones = TareaAprobacion.find_all_by_tarea_id(unatarea.id, :order => "created_at ASC")
          aprobaciones.each do |unaaprobacion|
            @aprobacionhash = Hash.new
            @aprobacionhash["usuario"] = Usuario.find(unaaprobacion.usuario_id).nombre
            @aprobacionhash["aprobado"] = unaaprobacion.aprobado.to_s
            @aprobacionhash["fecha_aprobado"] = unaaprobacion.created_at
            @subelementohash["aprobaciones"].push @aprobacionhash
          end

          @subelemento.push @subelementohash
          @elemento["tareas"] = @subelemento
        end
      end

      @infotoshow.push @elemento

    end

    respond_to do |format|
      format.html { render layout: "actividads" }
      format.json { render json: @procesos }
    end
    #puts @infotoshow

  end

  def GenerateXPDL

    generate_xpdl_metamodel
    generate_pnml_metamodel
    generate_data_process

    _url = request.protocol + request.host_with_port
    _xml = "<html><body>
            <a href=\"#{_url}/XPDLMetamodel.ecore\" />XPDL Metamodel en formato ECore</a> <br>
            <a href=\"#{_url}/PNMLMetamodel.ecore\" />PNML Metamodel en formato ECore</a> <br>
            <a href=\"#{_url}/XPDLMetamodel.dsl\" />XPDL Metamodel en formato  DSL </a> <br>
            <a href=\"#{_url}/XPDLModel.dsl\" />XPDL Model en formato DSL </a> <br>
            <a href=\"#{_url}/PNMLModel.dsl\" />PNML Model en formato DSL </a> <br>
            <a href=\"#{_url}/templates/xpdl_template.tpl\" />XPDL Plantilla de generacion </a> <br>
            <a href=\"#{_url}/templates/" + params[:id_proceso] + "/proceso_out.xpdl\" />XPDL Model en formato XML </a> <br>
            <a href=\"#{_url}/templates/" + params[:id_proceso] + "/proceso_data.xml\" />XML Datos del proceso </a> <br>

            </body></html>"
    render text: _xml
  end

  end

