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
class ProyectosController < ApplicationController
  include ReporteHelper

  before_filter :define_path
  before_filter :authenticate_user!

  @pag='Hola'

  def define_path
    @public_path = File.join(Rails.root.to_s, 'public')
    @uploads_url = '/uploads'
    @upload_path = File.join(@public_path, @uploads_url)
    @current_url = params[:dir] || @uploads_url
    @current_path = File.join(@public_path, @current_url)+ '/*'
  end
  

  def proy
    @organizacion=Organizacion.find_by_id(Usuario.find_by_id(current_user.id).organizacion_id)
    @proyectos = Proyecto.includes(:archivos).find_all_by_organizacion_id(@organizacion.id)
    @tipo_archivos = TipoArchivo.all.uniq

    @archivo = Archivo.new

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proyectos }
    end
  end
  # GET /proyectos
  # GET /proyectos.json
  def index
    @user1= current_user.id

    if (current_user.role? :nivel_1) || (current_user.role? :nivel_2)
      @organizacion=Organizacion.find_by_id(Usuario.find_by_id(current_user.id).organizacion_id)
      @empleados = Usuario.find_all_by_organizacion_id(@organizacion.id)

      #@proyectos = @organizacion.proyectos.sort_by(&:created_at).reverse
      @proyectos = Proyecto.all.reverse
      @proyecto = Proyecto.new

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @proyectos }
      end

    elsif current_user.role? :nivel_3
      redirect_to tarea_participantes_path
    elsif current_user.role? :nivel_0
      redirect_to plantillas_path
    else
      redirect_to request.protocol + request.host_with_port + "/users/sign_in"
    end
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
   #
    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
        format.html { render :action => '_overview', :layout => 'proyectos1'}# show.html.erb
        format.json { render :layout => 'proyectos1'}#render json: @proyecto }
    end
  end

  def configu
    #
    @tipo_plantillas=TipoPlantilla.all.uniq
    @proyecto = Proyecto.find(params[:id])
    @procesos= Proceso.find_all_by_proyecto_id(params[:id])
    @proyecto_organizacions =ProyectoOrganizacion.find_all_by_proyecto_id(params[:id])
    @proyecto_usuarios  =ProyectoUsuario.find_all_by_proyecto_id(params[:id])
    @proyecto_recursos  =ProyectoRecurso.find_all_by_proyecto_id(params[:id])
    @proyecto_artefactos  =ProyectoArtefacto.find_all_by_proyecto_id(params[:id])

    @proceso=Proceso.new
    @proyecto_organizacion = ProyectoOrganizacion.new

    respond_to do |format|
        format.html { render '_configuracion', :layout => 'proyectos1'}# show.html.erb
        format.json { render '_configuracion', :layout => 'proyectos1'}#render json: @proyecto }
    end
  end

  def configuempr
    #
    @tipo_plantillas=TipoPlantilla.all.uniq
    @proyecto = Proyecto.find(params[:id])
    @procesos= Proceso.find_all_by_proyecto_id(params[:id])
    @proyecto_organizacions =ProyectoOrganizacion.find_all_by_proyecto_id(params[:id])
    @proyecto_usuarios  =ProyectoUsuario.find_all_by_proyecto_id(params[:id])
    @proyecto_recursos  =ProyectoRecurso.find_all_by_proyecto_id(params[:id])
    @proyecto_artefactos  =ProyectoArtefacto.find_all_by_proyecto_id(params[:id])

    @proceso=Proceso.new
    @proyecto_organizacion = ProyectoOrganizacion.new

    respond_to do |format|
      format.html { render '_configuracionempr', :layout => 'proyectos1'}# show.html.erb
      format.json { render '_configuracionempr', :layout => 'proyectos1'}#render json: @proyecto }
    end
  end

  def configupart
    #
    @tipo_plantillas=TipoPlantilla.all.uniq
    @proyecto = Proyecto.find(params[:id])
    @procesos= Proceso.find_all_by_proyecto_id(params[:id])
    @proyecto_organizacions =ProyectoOrganizacion.find_all_by_proyecto_id(params[:id])
    @proyecto_usuarios  =ProyectoUsuario.find_all_by_proyecto_id(params[:id])
    @proyecto_recursos  =ProyectoRecurso.find_all_by_proyecto_id(params[:id])
    @proyecto_artefactos  =ProyectoArtefacto.find_all_by_proyecto_id(params[:id])

    @proceso=Proceso.new
    @proyecto_organizacion = ProyectoOrganizacion.new

    respond_to do |format|
      format.html { render '_configuracionpart', :layout => 'proyectos1'}# show.html.erb
      format.json { render '_configuracionpart', :layout => 'proyectos1'}#render json: @proyecto }
    end
  end

  def priorizar

    @proyecto = Proyecto.find(params[:id])
    @procesos=  Proyecto.find(params[:id]).procesos

    @data_for_select2 = Proyecto.find(params[:id]).usuarios

    @hash = Hash.new
    Proyecto.find(params[:id]).usuarios.each do |usuario|
      @hash[usuario.tipo_recurso_id] = Array.new
    end

    @hash.inject([]) { |result,h| result << h unless result.include?(h); result }
    @array = Array.new

    @hash.keys.each do |tipo_recurso_id|
      @tipoR=  TipoRecurso.find_by_id(tipo_recurso_id)
      @array.push( @tipoR)
    end

    @tipos=@array


    respond_to do |format|
      format.html { render '_priorizar', :layout => 'proyectos1'}# show.html.erb
      format.json { render '_priorizar', :layout => 'proyectos1'}#render json: @proyecto }
    end
  end
  @tareaSel=0

  def actualizarPriorizacion
    tareas = params[:tareas].split(':')

    prioridad = 0
    tareas.each do |tarea|

      prioridad = prioridad + 1
      @tareita= TareaParticipante.find_by_tarea_id_and_usuario_id(tarea,params[:usu])
      if(@tareita != nil)
        @tareita.prioridad=prioridad
        @tareita.save!
      end

    end

     render :text => "true"
  end

  def actualizarPrior
    @orden= params[:orden]


    $param=@orden.chomp.split(",")
    tam=$param.size
    prio=1;

    $param.each{ |a|
      a=a[11,a.bytesize]
      @tareita=TareaParticipante.find_by_usuario_id_and_tarea_id(params[:usu],a);
      @tareita.prioridad=prio;
      @tareita.save
      prio=prio+1;
    }



    render :text => "true"

  end


  def priorizarTareas

    @proyecto = Proyecto.find(params[:id])
    @usuario=Usuario.find(params[:idusuario])

    @tareaP = TareaParticipante.where(:usuario_id => @usuario.id).order("prioridad ASC").all
    @tareas = @usuario.tareas.order("tarea_id").all
    @tarea_revision = TareaRevision.new
    @tarea_artefacto = TareaArtefacto.new

    if(@tareaP.count > 0)
      @tarea_participante = @tareaP[0];
    else
      @tarea_participante = null;
    end

    @actividades = Array.new
    @tareaP.each do |tarea_participante|
      @actividades.push(tarea_participante.tarea.actividad)
    end

    #@hash = Hash.new
    #@tareaP.each do |tareaP|
    #   tarea=Tarea.find(tareaP.tarea_id)
    #   @hash[tarea.proceso_id] = Array.new
    # end

    # @hash.inject([]) { |result,h| result << h unless result.include?(h); result }
    # @array = Array.new

    # @hash.keys.each do |proceso_id|
    #  @proceso=  Proceso.find_by_id(proceso_id)
    #  if @proceso.proyecto_id=@proyecto.id
    #    @array.push( @proceso)
    #  end
    # end

    @procesos=@array

    respond_to do |format|
      format.html { render '_tareas', :layout => 'actividads'}# show.html.erb
      format.json { render '_tareas', :layout => 'actividads'}#render json: @proyecto }
    end
  end

  def arbol

    @proyecto = Proyecto.find(params[:id])
    @procesos=  Proyecto.find(params[:id]).procesos

    @data_for_select2 = Proyecto.find(params[:id]).usuarios

    @hash = Hash.new
    Proyecto.find(params[:id]).usuarios.each do |usuario|
      @hash[usuario.tipo_recurso_id] = Array.new
    end

    @hash.inject([]) { |result,h| result << h unless result.include?(h); result }
    @array = Array.new

    @hash.keys.each do |tipo_recurso_id|
      @tipoR=  TipoRecurso.find_by_id(tipo_recurso_id)
      @array.push( @tipoR)
    end

    @tipos=@array

    respond_to do |format|
      format.html { render '_arbol', :layout => 'reportes'}# show.html.erb
      format.json { render '_arbol', :layout => 'reportes'}#render json: @proyecto }
    end
  end


  def overview
    # Se busca la información correspondiente al proyecto
    @proyecto = Proyecto.find(params[:id])
    # Se consulta en la base de datos los procesos asociados al proyecto por su relación con dicha tabla
    @procesos = Proceso.find_all_by_proyecto_id(@proyecto.id)


    #### Se establecen los acumuladores para el reporte del proyecto ###
    # Se define un acumulador para las horas planeadas del proyecto
    @horas_plan_proy = 0
    # Se define un acumulador para las horas realas ejecutadas dentro del proyecto
    @horas_real_proy = 0
    # Se define un acumulador para los costos planeadas para el proyecto
    @costo_plan_proy = 0
    # Se define un acumulador para los costos reales del proyecto
    @costo_real_proy = 0

    ### Se definen los contenedores de cada tabla del proyecto (mano de obra,recursos,procesos, actividad) ###
    # Contenedor para mano obra
    @mano_proy = []
    # Contenedor para mano obra
    @recursos = []
    # Contenedor para mano obra
    @procesos_data = []

    ### Variables auxiliares ###
    trabajadores = {}
    insumos = {}

    # Por cada proceso del proyecto
    @procesos.each do |proceso|
      # Se define un acumulador para el número de horas planeadas del proceso
      horas_plan_pros =0
      # Se define un acumulador para el número de horas reales del proceso
      horas_real_pros =0
      # Se define un acumulador para el costo planeado del proceso
      costo_plan_pros =0
      # Se define un acumulador para el costo real del proceso
      costo_real_pros =0
      # Se consultan todas las tareas relacionadas con el proceso en la Base de datos.
      tareas = proceso.tareas

      tareas.each do |tarea|
        resumen = generar_resumen_tarea(tarea)
        horas_plan_pros = horas_plan_pros + resumen[:horas_plan]
        horas_real_pros = horas_real_pros + resumen[:horas_real]
        costo_plan_pros = costo_plan_pros + resumen[:costo_plan]
        costo_real_pros = costo_real_pros + resumen[:costo_real]
        trabajadores = actualizar_trabajadores(trabajadores, resumen[:usuario], resumen[:horas_plan], resumen[:horas_real])
        insumos = actualizar_recursos(insumos, resumen[:recursos])

      end

      @horas_plan_proy = @horas_plan_proy + horas_plan_pros
      @horas_real_proy = @horas_real_proy + horas_real_pros
      @costo_plan_proy = @costo_plan_proy + costo_plan_pros
      @costo_real_proy = @costo_real_proy + costo_real_pros

      @procesos_data.push([proceso.id, proceso.nombre, proceso.fechaini, proceso.fechafin, horas_plan_pros, horas_real_pros, costo_plan_pros, costo_real_pros])
    end

    @mano_proy = datos_mano_obra(trabajadores)
    @recursos = datos_recursos(insumos)

    @recursos_planeados = 0
    @recursos_ejecutado = 0
    @esfuerzo_planeados = 0
    @esfuerzo_ejecutado = 0

    # Se calcula es el costo de los recurso del proyecto
    @recursos.each do |r|
      @recursos_planeados = @recursos_planeados + r[5]
      @recursos_ejecutado = @recursos_ejecutado + r[6]
    end
    # Se calcula es el costo de los esfuerzos del proyecto
    @mano_proy.each do |t|
      @esfuerzo_planeados = @esfuerzo_planeados + t[6]
      @esfuerzo_ejecutado = @esfuerzo_ejecutado + t[7]
    end

    # Se totalizan el total de procesos del proyecto
    @num_procesos = @procesos.size
    @num_usuarios = trabajadores.size
    @num_organizaciones=ProyectoOrganizacion.find_all_by_proyecto_id(params[:id]).count

    respond_to do |format|
       format.html { render '_overview', :layout => 'proyectos1'}# show.html.erb
       format.json { render '_overview', :layout => 'proyectos1'}#render json: @proyecto }
    end
  end

  def new
    @proyecto = Proyecto.new
    @depositos = Deposito.all

       
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proyecto }
    end
  end

  # GET /proyectos/1/edit
  def edit
    @proyecto = Proyecto.find(params[:id])
    @depositos = Deposito.all
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    if  params[:idTart] != '' then
      @proyecto = Proyecto.find(params[:idTart])

      respond_to do |format|
        if @proyecto.update_attributes(params[:proyecto])
          @proyecto = Proyecto.new
          @proyectos = Proyecto.all.reverse
          @empleados = Usuario.find_all_by_organizacion_id(@proyecto.organizacion_id)

          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @proyectos }
        else
          format.html { render action: "new" }
          format.json { render json: @proyecto.errors, status: :unprocessable_entity }
        end
      end
    else
      # @depositos = Deposito.all
      @proyecto = Proyecto.new(params[:proyecto])
      @proyecto.fcreado=Time.now
      @proyecto.organizacion_id=Usuario.find_by_id(current_user.id).organizacion_id
      @empleados = Usuario.find_all_by_organizacion_id(@proyecto.organizacion_id)
      @razuna_folder = @proyecto.nombre

      respond_to do |format|
        if @proyecto.save
          @proyeOrg=ProyectoOrganizacion.new
          @proyeOrg.proyecto_id=@proyecto.id
          @proyeOrg.organizacion_id=@proyecto.organizacion_id
          @proyeOrg.save

          begin
            @wddx = WDDX.load(open(ENV['root_razuna_api'] + "global/api2/folder.cfc?method=setfolder&api_key=" + ENV['admindavid_razuna_key'] + "&folder_name=" +  CGI::escape(@proyecto.nombre) + "&__BDRETURNFORMAT=wddx"))
          rescue
          end

          @proyecto = Proyecto.new
          @proyectos = Proyecto.all.reverse

          @message = t('datos_guardados')

          format.html { render action: "index" }
          format.json { render json: @proyectos }
        else
          format.html { render action: "new" }
          format.json { render json: @proyecto.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /proyectos/1
  # PUT /proyectos/1.json
  def update
    @proyecto = Proyecto.find(params[:id])
    
    respond_to do |format|
      if @proyecto.update_attributes(params[:proyecto])
        format.html { redirect_to @proyecto, notice: 'El proyecto fue editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy

    respond_to do |format|
      format.html { redirect_to proyectos_url }
      format.json { head :no_content }
    end
  end

  # ===  Accion existe
  # Determina si existe un proyecto de acuerdo a un nombre
  def existe
    @proyecto = Proyecto.find_by_nombre(params[:nombre])
    if(@proyecto)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def get_organizaciones
    @data_for_select2 = Organizacion.all

    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    @data = @c+"({"+"\""
    @data_for_select2.each do |select|

      @data  = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

      if @tam!=@i
        @data=@data+","+"\""
      else
        @data=@data+"})"
      end
      @i=@i+1
    end

    render :text => @data
  end

  def get_usuarios_org
    @comilla='"';
    @data_for_select1 = params[:organizacion_id]

    @data_for_select2 = Usuario.find_all_by_organizacion_id(@data_for_select1)
    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    if @tam!=0

      @data = @c+"({"+"\""

      @data_for_select2.each do |select|

        @data  = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

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




  def getTipoRecurso

    @data_for_select2 = Proyecto.find(params[:id]).usuarios

    @hash = Hash.new
    Proyecto.find(params[:id]).usuarios.each do |usuario|
      @hash[usuario.tipo_recurso_id] = Array.new
    end

    @hash.inject([]) { |result,h| result << h unless result.include?(h); result }
    @array = Array.new

      @hash.keys.each do |tipo_recurso_id|
      @tipoR=  TipoRecurso.find_by_id(tipo_recurso_id)
      @array.push( @tipoR)
    end


    @data_for_select2=  @array

    #render :json =>"{"+@comilla+"1"+@comilla+":"+@comilla+"Alto Orinoco"+@comilla+","+@comilla+"2"+@comilla+":"+@comilla+"Huachamacare"+@comilla+"}"
    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    @data = @c+"({"+"\""
    @data_for_select2.each do |select|

      @data  = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

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
    @data_for_select1 = params[:tipo_recurso]

    @data_for_select2 =  Proyecto.find(params[:id]).usuarios.where(:tipo_recurso_id => @data_for_select1).all
    @procesos=  Proyecto.find(params[:id]).procesos

    @c= params[:callback]

    @tam=@data_for_select2.length
    @i=1
    if @tam!=0

      @data = @c+"({"+"\""

      @data_for_select2.each do |select|

        @data  = @data+select.id.to_s+"\""+":"+"\""+select.nombre+"\""

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

  def listar_procesos
    @usuario=Usuario.find_by_id(params[:id])
    @tareas=@usuario.tareas
    render :text => true
  end

  def get_proyecto
    _id = params[:id]
    _proyecto = Proyecto.find(_id);

    @result = Hash.new

    @result[:nombre] = _proyecto.nombre;
    @result[:descripcion] = _proyecto.descripcion;
    @result[:director] = _proyecto.director;
    @result[:fecha_inicio] = _proyecto.fecha_inicio;
    @result[:fecha_fin] = _proyecto.fecha_fin;

    render :json => @result
  end

  protected

  def secured_path?(file_path)
    return File.exist?(file_path) && ! File.dirname(file_path).index(@public_path).nil?
  end



  def slugify(value)
    return value.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s\
          .downcase\
          .gsub(/[']+/, '')\
          .gsub(/\W+/, ' ')\
          .strip\
          .gsub(' ', '-')
  end
end


