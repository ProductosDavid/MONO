require 'test_helper'

class TipoRecursosTest < ActionDispatch::IntegrationTest
  def setup
    @sleep = 3
    @tipo_organizacionMaster = FactoryGirl.create(:tipo_organizacion)
    @organizacionMaster = FactoryGirl.create(:organizacion, tipo_organizacion_id: @tipo_organizacionMaster.id)
    @tipo_recursoMaster = FactoryGirl.create(:tipo_recurso, unit: "1")
    @usuario = FactoryGirl.create(:usuario, tipo_recurso_id: @tipo_recursoMaster.id, organizacion_id: @organizacionMaster.id, habilitado: 1)
    @user = FactoryGirl.create(:user, id: @usuario.id)

    roles = Role.new(:name => "nivel_1")
    roles.id = "1"
    roles.save!
    rolesUser = RolesUsers.new(:role_id => "1", :user_id => @usuario.id)
    rolesUser.save!

    @usuarioApp = enter_site(:usuario)
    @usuarioApp.tries_to_go_to_admin
    @usuarioApp.logs_in_successfully(@user.email, @user.password)
  end

  #def test_successful_login

  #end

  def test_group_tests
    #INI creacion tipo recursos materiales
    cantTrmI = TipoRecurso.where(:unit => '2').all.count
    tipo_recursom = @usuarioApp.create_tipo_recurso_material("1")
    tipo_recursom2 = @usuarioApp.create_tipo_recurso_material("2")
    tipo_recursom3 = @usuarioApp.create_tipo_recurso_material("3")
    tipo_recursom4 = @usuarioApp.create_tipo_recurso_material("4")
    tipo_recursom5 = @usuarioApp.create_tipo_recurso_material("5")
    tipo_recursom6 = @usuarioApp.create_tipo_recurso_material("6")
    tipo_recursom7 = @usuarioApp.create_tipo_recurso_material("7")
    cantTrmF = TipoRecurso.where(:unit => '2').all.count
    assert_equal cantTrmI + 7, cantTrmF
    #FIN creacion tipo recursos materiales

    #INI creacion tipo recursos humanos
    cantTrhI = TipoRecurso.where(:unit => '1').all.count
    tipo_recursoh = @usuarioApp.create_tipo_recurso_humano("8")
    tipo_recursoh2 = @usuarioApp.create_tipo_recurso_humano("9")
    tipo_recursoh3 = @usuarioApp.create_tipo_recurso_humano("10")
    tipo_recursoh4 = @usuarioApp.create_tipo_recurso_humano("11")
    tipo_recursoh5 = @usuarioApp.create_tipo_recurso_humano("12")
    tipo_recursoh6 = @usuarioApp.create_tipo_recurso_humano("13")
    tipo_recursoh7 = @usuarioApp.create_tipo_recurso_humano("14")
    tipo_recursoh8 = @usuarioApp.create_tipo_recurso_humano("15")
    tipo_recursoh9 = @usuarioApp.create_tipo_recurso_humano("16")
    cantTrhF = TipoRecurso.where(:unit => '1').all.count
    assert_equal cantTrhI + 9, cantTrhF
    #FIN creacion tipo recursos humanos

    #INI creacion tipo organizacions
    cantToI = TipoOrganizacion.all.count
    tipo_organizacion = @usuarioApp.create_tipo_organizacion("1")
    tipo_organizacion2 = @usuarioApp.create_tipo_organizacion("2")
    tipo_organizacion3 = @usuarioApp.create_tipo_organizacion("3")
    tipo_organizacion4 = @usuarioApp.create_tipo_organizacion("4")
    tipo_organizacion5 = @usuarioApp.create_tipo_organizacion("5")
    tipo_organizacion6 = @usuarioApp.create_tipo_organizacion("6")
    tipo_organizacion7 = @usuarioApp.create_tipo_organizacion("7")
    tipo_organizacion8 = @usuarioApp.create_tipo_organizacion("8")
    cantToF = TipoOrganizacion.all.count
    assert_equal cantToI + 8, cantToF
    #FIN creacion tipo organizacions

    #INI creacion tipo plantillas
    cantTpI = TipoPlantilla.all.count
    tipo_plantilla = @usuarioApp.create_tipo_plantilla("1")
    tipo_plantilla2 = @usuarioApp.create_tipo_plantilla("2")
    tipo_plantilla3 = @usuarioApp.create_tipo_plantilla("3")
    tipo_plantilla4 = @usuarioApp.create_tipo_plantilla("4")
    tipo_plantilla5 = @usuarioApp.create_tipo_plantilla("5")
    tipo_plantilla6 = @usuarioApp.create_tipo_plantilla("6")
    tipo_plantilla7 = @usuarioApp.create_tipo_plantilla("7")
    tipo_plantilla8 = @usuarioApp.create_tipo_plantilla("8")
    tipo_plantilla9 = @usuarioApp.create_tipo_plantilla("9")
    cantTpF = TipoPlantilla.all.count
    assert_equal cantTpI + 9, cantTpF
    #FIN creacion tipo plantillas

    #INI creacion usuario
    cantUI = Usuario.all.count
    usuario = @usuarioApp.create_usuario("1",tipo_recursoh.id,"1")
    usuario2 = @usuarioApp.create_usuario("2",tipo_recursoh2.id,"2")
    usuario3 = @usuarioApp.create_usuario("3",tipo_recursoh3.id,"3")
    usuario4 = @usuarioApp.create_usuario("4",tipo_recursoh4.id,"1")
    usuario5 = @usuarioApp.create_usuario("5",tipo_recursoh5.id,"2")
    usuario6 = @usuarioApp.create_usuario("6",tipo_recursoh6.id,"3")
    usuario7 = @usuarioApp.create_usuario("7",tipo_recursoh7.id,"3")
    usuario8 = @usuarioApp.create_usuario("8",tipo_recursoh8.id,"3")
    usuario9 = @usuarioApp.create_usuario("9",tipo_recursoh9.id,"3")
    usuario10 = @usuarioApp.create_usuario("10",tipo_recursoh.id,"3")
    usuario11 = @usuarioApp.create_usuario("11",tipo_recursoh.id,"3")
    usuario12 = @usuarioApp.create_usuario("12",tipo_recursoh.id,"3")
    cantUF = Usuario.all.count
    assert_equal cantUI + 12, cantUF
    #FIN creacion usuario

    #INI creacion empresa
    cantEI = Organizacion.all.count
    empresa = @usuarioApp.create_empresa("1",tipo_organizacion.id,usuario)
    empresa2 = @usuarioApp.create_empresa("2",tipo_organizacion2.id,usuario4)
    empresa3 = @usuarioApp.create_empresa("3",tipo_organizacion3.id,usuario)
    empresa4 = @usuarioApp.create_empresa("4",tipo_organizacion4.id,usuario4)
    empresa5 = @usuarioApp.create_empresa("5",tipo_organizacion2.id,usuario)
    empresa6 = @usuarioApp.create_empresa("6",tipo_organizacion2.id,usuario4)
    empresa7 = @usuarioApp.create_empresa("7",tipo_organizacion2.id,usuario)
    empresa8 = @usuarioApp.create_empresa("8",tipo_organizacion2.id,usuario4)
    cantEF = Organizacion.all.count
    assert_equal cantEI + 8, cantEF
    #FIN creacion empresa

    #INI creacion recursos
    cantRI = Recurso.all.count
    recurso = @usuarioApp.create_recurso("1",tipo_recursom.id)
    recurso2 = @usuarioApp.create_recurso("2",tipo_recursom2.id)
    recurso3 = @usuarioApp.create_recurso("3",tipo_recursom3.id)
    recurso4 = @usuarioApp.create_recurso("4",tipo_recursom4.id)
    recurso5 = @usuarioApp.create_recurso("5",tipo_recursom4.id)
    recurso6 = @usuarioApp.create_recurso("6",tipo_recursom4.id)
    recurso7 = @usuarioApp.create_recurso("7",tipo_recursom4.id)
    recurso8 = @usuarioApp.create_recurso("8",tipo_recursom4.id)
    cantRF = Recurso.all.count
    assert_equal cantRI + 8, cantRF
    #FIN creacion recursos

    #INI creacion plantillas
    cantPI = Plantilla.all.count
    plantilla = @usuarioApp.create_plantilla("1",tipo_plantilla.id)
    plantilla2 = @usuarioApp.create_plantilla("2",tipo_plantilla2.id)
    plantilla3 = @usuarioApp.create_plantilla("3",tipo_plantilla3.id)
    plantilla4 = @usuarioApp.create_plantilla("4",tipo_plantilla4.id)
    plantilla5 = @usuarioApp.create_plantilla("5",tipo_plantilla5.id)
    plantilla6 = @usuarioApp.create_plantilla("6",tipo_plantilla6.id)
    plantilla7 = @usuarioApp.create_plantilla("7",tipo_plantilla7.id)
    plantilla8 = @usuarioApp.create_plantilla("8",tipo_plantilla8.id)
    plantilla9 = @usuarioApp.create_plantilla("9",tipo_plantilla9.id)
    cantPF = Plantilla.all.count
    assert_equal cantPI + 9, cantPF
    #FIN creacion plantillas

    #INI creacion proyectos
    cantPrI = Proyecto.all.count
    proyecto = @usuarioApp.create_proyecto("1",usuario2.id)
    proyecto2 = @usuarioApp.create_proyecto("2",usuario5.id)
    proyecto3 = @usuarioApp.create_proyecto("3",usuario2.id)
    proyecto4 = @usuarioApp.create_proyecto("4",usuario5.id)
    cantPrF = Proyecto.all.count
    assert_equal cantPrI + 4, cantPrF
    #FIN creacion proyectos

    #INI creacion procesos
    cantPrcI = Proceso.all.count
    nodoPadreP = [1]
    nodoPadreP2 = [1]
    nodoPadreP3 = [1]
    nodoPadreP4 = [1]
    nodoPadreP5 = [1]
    proceso = @usuarioApp.create_proceso("1",proyecto.id,plantilla.id,tipo_plantilla.id,nodoPadreP)
    proceso2 = @usuarioApp.create_proceso("2",proyecto2.id,plantilla2.id,tipo_plantilla2.id,nodoPadreP2)
    proceso3 = @usuarioApp.create_proceso("3",proyecto3.id,plantilla3.id,tipo_plantilla3.id,nodoPadreP3)
    proceso4 = @usuarioApp.create_proceso("4",proyecto4.id,plantilla4.id,tipo_plantilla4.id,nodoPadreP4)
    proceso5 = @usuarioApp.create_proceso("5",proyecto.id,plantilla5.id,tipo_plantilla5.id,nodoPadreP5)
    cantPrcF = Proceso.all.count
    assert_equal cantPrcI + 5, cantPrcF
    #FIN creacion procesos

    #INI creacion actividades para un proceso (proceso)
    cantAPI = Actividad.all.count
    actividadP = @usuarioApp.create_actividad("1",proceso.id,plantilla.id,nodoPadreP[0])
    actividad2P = @usuarioApp.create_actividad("2",proceso.id,plantilla.id,nodoPadreP[0])
    actividad3P = @usuarioApp.create_actividad("3",proceso.id,plantilla.id,nodoPadreP[0])
    actividad4P = @usuarioApp.create_actividad("4",proceso.id,plantilla.id,nodoPadreP[0])
    cantAPF = Actividad.all.count
    assert_equal cantAPI + 4, cantAPF
    #FIN creacion actividades para un proceso (proceso)

    #INI creacion evento fin para un proceso (proceso)
    cantEFPI = Evento.all.count
    eventoFinP = @usuarioApp.create_evento_fin("5",proceso.id,plantilla.id,nodoPadreP[0])
    cantEFPF = Evento.all.count
    assert_equal cantEFPI + 1, cantEFPF
    #FIN creacion evento fin para un proceso (proceso)

    #INI obtener tareas para un proceso (proceso)
    cantTPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.get_tareas_proceso(proceso.id)
    cantTPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTPI + 4, cantTPF
    #FIN obtener tareas para un proceso (proceso)

    #INI actualizar descripcion tareas para un proceso (proceso)
    cantTDuPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.update_tarea(proceso.id,actividadP.id,"descripcion")
    @usuarioApp.update_tarea(proceso.id,actividad2P.id,"descripcion")
    @usuarioApp.update_tarea(proceso.id,actividad3P.id,"descripcion")
    @usuarioApp.update_tarea(proceso.id,actividad4P.id,"descripcion")
    cantTDuPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTDuPI, cantTDuPF
    #FIN actualizar descripcion tareas para un proceso (proceso)

    #INI actualizar duracion tareas para un proceso (proceso)
    cantTDuPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.update_tarea(proceso.id,actividadP.id,"duracion")
    @usuarioApp.update_tarea(proceso.id,actividad2P.id,"duracion")
    @usuarioApp.update_tarea(proceso.id,actividad3P.id,"duracion")
    @usuarioApp.update_tarea(proceso.id,actividad4P.id,"duracion")
    cantTDuPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTDuPI, cantTDuPF
    #FIN actualizar duracion tareas para un proceso (proceso)

    #INI actualizar horas planeadas tareas para un proceso (proceso)
    cantTDuPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.update_tarea(proceso.id,actividadP.id,"horas_planeadas")
    @usuarioApp.update_tarea(proceso.id,actividad2P.id,"horas_planeadas")
    @usuarioApp.update_tarea(proceso.id,actividad3P.id,"horas_planeadas")
    @usuarioApp.update_tarea(proceso.id,actividad4P.id,"horas_planeadas")
    cantTDuPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTDuPI, cantTDuPF
    #FIN actualizar horas planeadas tareas para un proceso (proceso)

    #INI actualizar fecha inicio tareas para un proceso (proceso)
    cantTDuPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.update_tarea(proceso.id,actividadP.id,"fecha_inicio")
    @usuarioApp.update_tarea(proceso.id,actividad2P.id,"fecha_inicio")
    @usuarioApp.update_tarea(proceso.id,actividad3P.id,"fecha_inicio")
    @usuarioApp.update_tarea(proceso.id,actividad4P.id,"fecha_inicio")
    cantTDuPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTDuPI, cantTDuPF
    #FIN actualizar fecha inicio tareas para un proceso (proceso)

    #INI actualizar fecha inicio tareas para un proceso (proceso)
    cantTDuPI = Tarea.where(:proceso_id => proceso.id).all.count
    @usuarioApp.update_tarea(proceso.id,actividadP.id,"fecha_fin")
    @usuarioApp.update_tarea(proceso.id,actividad2P.id,"fecha_fin")
    @usuarioApp.update_tarea(proceso.id,actividad3P.id,"fecha_fin")
    @usuarioApp.update_tarea(proceso.id,actividad4P.id,"fecha_fin")
    cantTDuPF = Tarea.where(:proceso_id => proceso.id).all.count
    assert_equal cantTDuPI, cantTDuPF
    #FIN actualizar fecha inicio tareas para un proceso (proceso)

    #INI asignar recursos a tarea para un proceso (proceso)
    cantTRPI = TareaRecurso.all.count
    @usuarioApp.asignar_recurso_tarea(proceso.id,actividadP.id,recurso,recurso2,recurso3,recurso4,recurso.id.to_s)
    @usuarioApp.asignar_recurso_tarea(proceso.id,actividad2P.id,recurso,recurso2,recurso3,recurso4,recurso2.id.to_s)
    @usuarioApp.asignar_recurso_tarea(proceso.id,actividad3P.id,recurso,recurso2,recurso3,recurso4,recurso3.id.to_s)
    @usuarioApp.asignar_recurso_tarea(proceso.id,actividad4P.id,recurso,recurso2,recurso3,recurso4,recurso4.id.to_s)
    cantTRPF = TareaRecurso.all.count
    assert_equal cantTRPI + 16, cantTRPF
    #FIN asignar recursos a tarea para un proceso (proceso)

    #INI asignar responsable a tarea para un proceso (proceso)
    cantTPPI = TareaParticipante.all.count
    @usuarioApp.asignar_responsable_tarea(proceso.id,actividadP.id,usuario6.id)
    @usuarioApp.asignar_responsable_tarea(proceso.id,actividad2P.id,usuario7.id)
    @usuarioApp.asignar_responsable_tarea(proceso.id,actividad3P.id,usuario8.id)
    @usuarioApp.asignar_responsable_tarea(proceso.id,actividad4P.id,usuario9.id)
    cantTPPF = TareaParticipante.all.count
    assert_equal cantTPPI + 4, cantTPPF
    #FIN asignar responsable a tarea para un proceso (proceso)

    #INI creacion tipo artefactos
    cantTaI = TipoArtefacto.all.count
    tipo_artefacto = @usuarioApp.create_tipo_artefacto("1")
    tipo_artefacto2 = @usuarioApp.create_tipo_artefacto("2")
    tipo_artefacto3 = @usuarioApp.create_tipo_artefacto("3")
    tipo_artefacto4 = @usuarioApp.create_tipo_artefacto("4")
    cantTaF = TipoArtefacto.all.count
    assert_equal cantTaI + 4, cantTaF
    #FIN creacion tipo artefactos

    #INI iniciar tarea en proceso para un proceso (proceso)
    @usuarioApp.iniciar_tarea(proceso.id,actividadP.id)
    @usuarioApp.iniciar_tarea(proceso.id,actividad2P.id)
    @usuarioApp.iniciar_tarea(proceso.id,actividad3P.id)
    @usuarioApp.iniciar_tarea(proceso.id,actividad4P.id)
    #FIN iniciar tarea en proceso para un proceso (proceso)

    #INI actualizar horas tarea para un proceso (proceso)
    @usuarioApp.actualizar_horas_ejecutadas_tarea(proceso.id,actividadP.id,usuario6.id)
    @usuarioApp.actualizar_horas_ejecutadas_tarea(proceso.id,actividad2P.id,usuario7.id)
    @usuarioApp.actualizar_horas_ejecutadas_tarea(proceso.id,actividad3P.id,usuario8.id)
    @usuarioApp.actualizar_horas_ejecutadas_tarea(proceso.id,actividad4P.id,usuario9.id)
    #FIN actualizar horas tarea para un proceso (proceso)

    #INI terminar tarea en proceso para un proceso (proceso)
    @usuarioApp.terminar_tarea(proceso.id,actividadP.id)
    @usuarioApp.terminar_tarea(proceso.id,actividad2P.id)
    @usuarioApp.terminar_tarea(proceso.id,actividad3P.id)
    @usuarioApp.terminar_tarea(proceso.id,actividad4P.id)
    #FIN terminar tarea en proceso para un proceso (proceso)
  end

  private

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def tries_to_go_to_admin
      get "/tipo_recursos"
      assert_response :redirect
      assert_redirected_to "/users/sign_in"
    end

    def logs_in_successfully(email, password)
      post_login(email, password)
    end

    def create_tipo_recurso_material(name)
      get "/tipo_recursos"
      assert_equal 200, status
      tipo_recurso = FactoryGirl.build(:tipo_recurso)
      post "/tipo_recursos", {:idTart => "", tipo_recurso: FactoryGirl.attributes_for(:tipo_recurso, nombre: tipo_recurso.nombre + name), :tiprec => "2"}
      assert_equal 200, status
      return TipoRecurso.last
    end

    def create_tipo_recurso_humano(name)
      get "/tipo_recursos"
      assert_equal 200, status
      tipo_recurso = FactoryGirl.build(:tipo_recurso)
      post "/tipo_recursos", {:idTart => "", tipo_recurso: FactoryGirl.attributes_for(:tipo_recurso, unit: "1", nombre: tipo_recurso.nombre + name), :tiprec => "2"}
      assert_equal 200, status
      return TipoRecurso.last
    end

    def create_tipo_artefacto(name)
      get "/tipo_artefactos"
      assert_equal 200, status
      tipo_artefacto = FactoryGirl.build(:tipo_artefacto)
      post "/tipo_artefactos", {:idTart => "", tipo_artefacto: FactoryGirl.attributes_for(:tipo_artefacto, nombre: tipo_artefacto.nombre + name)}
      assert_equal 200, status
      return TipoArtefacto.last
    end

    def create_tipo_plantilla(name)
      get "/tipo_plantillas"
      assert_equal 200, status
      tipo_plantilla = FactoryGirl.build(:tipo_plantilla)
      post "/tipo_plantillas", {:idTart => "", tipo_plantilla: FactoryGirl.attributes_for(:tipo_plantilla, nombre: tipo_plantilla.nombre + name)}
      assert_equal 200, status
      return TipoPlantilla.last
    end

    def create_tipo_organizacion(name)
      get "/tipo_organizacions"
      assert_equal 200, status
      tipo_organizacion = FactoryGirl.build(:tipo_organizacion)
      post "/tipo_organizacions", {:idTart => "", tipo_organizacion: FactoryGirl.attributes_for(:tipo_organizacion, name: tipo_organizacion.name + name)}
      assert_equal 200, status
      return TipoOrganizacion.last
    end

    def create_usuario(name,idRecursoHumano,rol)
      get "/usuarios"
      assert_equal 200, status
      usuario = FactoryGirl.build(:usuario)
      post "/usuarios", {:idTart => "", usuario: FactoryGirl.attributes_for(:usuario, tipo_recurso_id: idRecursoHumano, nombre: usuario.nombre + name, email: usuario.email + name), :roles => [rol]}
      assert_equal 200, status
      return Usuario.last
    end

    def create_empresa(name,idTipoOrganizacion,usuario)
      get "/organizacions"
      assert_equal 200, status
      organizacion = FactoryGirl.build(:organizacion)
      post "/organizacions", {:idTart => "", organizacion: FactoryGirl.attributes_for(:organizacion, tipo_organizacion_id: idTipoOrganizacion, nombre: organizacion.nombre + name), :usuario_opcion => "1", usuario: FactoryGirl.attributes_for(:usuario, nombre: usuario.nombre, apellidos: usuario.apellidos, email: usuario.email, tipo_recurso_id: usuario.tipo_recurso_id, organizacion_id: usuario.organizacion_id)}
      assert_equal 200, status
      return Usuario.last
    end

    def create_recurso(name,idTipoRecurso)
      get "/recursos"
      assert_equal 200, status
      recurso = FactoryGirl.build(:recurso)
      post "/recursos", {:idTart => "", recurso: FactoryGirl.attributes_for(:recurso, tipo_recurso_id: idTipoRecurso, nombre: recurso.nombre + name)}
      assert_equal 200, status
      return Recurso.last
    end

    def create_plantilla(name,idTipoPlantilla)
      get "/plantillas"
      assert_equal 200, status
      plantilla = FactoryGirl.build(:plantilla)
      post "/plantillas", {:idTart => "", plantilla: FactoryGirl.attributes_for(:plantilla, tipo_plantilla_id: idTipoPlantilla, nombre: plantilla.nombre + name)}
      assert_equal 200, status
      return Recurso.last
    end

    def create_proyecto(name,idUsuario)
      get "/proyectos"
      assert_equal 200, status
      proyecto = FactoryGirl.build(:proyecto)
      post "/proyectos", {:idTart => "", proyecto: FactoryGirl.attributes_for(:proyecto, director: idUsuario, nombre: proyecto.nombre + name)}
      assert_equal 200, status
      return Proyecto.last
    end

    def create_proceso(name,idProyecto,idPlantilla,idTipoPlantilla,nodoPadre)
      proceso = FactoryGirl.build(:proceso)
      post_via_redirect "/procesos", {proceso: FactoryGirl.attributes_for(:proceso, tipo_plantilla_id: idPlantilla, proyecto_id: idProyecto, nombre: proceso.nombre + name), :proyecto_id => idProyecto, :proceso_tipo_plantilla => idTipoPlantilla, :plantilla => idPlantilla, :proyecto_id => idProyecto, :lunes => 8, :martes => 8, :miercoles => 8, :jueves => 8, :viernes => 8, :sabado => 4,:domingo =>0, :fini => '2014/07/14', :ffin => '2015/07/14'}
      procesoBD = Proceso.last
      nodoPadre[0] = MyJsTree.last().id
      assert_equal '/procesos/' + procesoBD.id.to_s, path
      return procesoBD
    end

    def create_actividad(name,idProceso,idPlantilla,idNodoPadre)
      actividad = FactoryGirl.build(:actividad)
      post "/actividads", {actividad: FactoryGirl.attributes_for(:actividad, plantilla_id: idPlantilla, nombre: actividad.nombre + name, proceso_id: idProceso), :nodo_padre => idNodoPadre, :nodo_titulo => actividad.nombre + name, :nodo_tipo => "tarea_simple", :posicion => name}
      assert_equal 200, status
      return Actividad.last
    end

    def create_evento_fin(name,idProceso,idPlantilla,idNodoPadre)
      evento = FactoryGirl.build(:evento)
      post "/eventos", {evento: FactoryGirl.attributes_for(:evento, plantilla_id: idPlantilla, tipo: "2", nombre: evento.nombre + name), :nodo_padre => idNodoPadre, :nodo_titulo => evento.nombre, :nodo_tipo => "evento_fin", :posicion => name}
      assert_equal 200, status
      return Evento.last
    end

    def get_tareas_proceso(idProceso)
      get "/tareas", {:proceso_id => idProceso}
      assert_equal 200, status
    end

    def update_tarea(idProceso,idActividad,campo)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      tareaUpdate = FactoryGirl.build(:tarea)
      if (campo == "descripcion")
        valor = tareaUpdate.descripcion
      elsif (campo == "duracion")
        valor = tareaUpdate.duracion
      elsif (campo = "horas_planeadas")
        valor = tareaUpdate.horas_planeadas
      elsif (campo = "fecha_inicio")
        valor = tareaUpdate.fecha_inicio
      elsif (campo = "fecha_fin")
        valor = tareaUpdate.fecha_inicio
      end
      get "tareas/" + tareaBD.id.to_s + "/actualizar_tarea", {:campo => campo, :id_tarea => tareaBD.id, :valor => valor}
      assert_equal 200, status
      tareaBD = Tarea.find_by_id(tareaBD.id)
      if (campo == "descripcion")
        assert_equal tareaBD.descripcion, tareaUpdate.descripcion
      elsif (campo == "duracion")
        assert_equal tareaBD.duracion, tareaUpdate.duracion
      elsif (campo = "horas_planeadas")
        assert_equal tareaBD.horas_planeadas, tareaUpdate.horas_planeadas
      elsif (campo = "fecha_inicio")
        assert_equal tareaBD.fecha_inicio, tareaUpdate.fecha_inicio
      elsif (campo = "fecha_fin")
        assert_equal tareaBD.fecha_fin, tareaUpdate.fecha_fin
      end
    end

    def asignar_recurso_tarea(idProceso,idActividad,recurso,recurso2,recurso3,recurso4,asignado)
      tareaUpdate = FactoryGirl.build(:tarea)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      post_via_redirect "/tarea_recursos", {:tarea_seleccionada => tareaBD.id, :recurso => [recurso.id,recurso2.id,recurso3.id,recurso4.id], "qty_recurso_" + asignado => tareaUpdate.prioridad}
      assert_equal 200, status
    end

    def iniciar_tarea(idProceso,idActividad)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      post "/tarea_participantes/1/updateEstado", {:tarea => tareaBD.id, :columna => "2"}
      assert_equal 200, status
      tareaBD1 = Tarea.find_by_id(tareaBD.id)
      assert_equal tareaBD1.columna, 2
    end

    def actualizar_horas_ejecutadas_tarea(idProceso,idActividad,idUsuario)
      tareaUpdate = FactoryGirl.build(:tarea)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      post "/tarea_participantes/1/updateHoras", {:tarea => tareaBD.id, :horas => tareaUpdate.avance, :idUsuario => idUsuario}
      assert_equal 200, status
      tareaBD = Tarea.find_by_id(tareaBD.id)
      assert_equal tareaBD.horas_ejecutadas, tareaUpdate.avance
    end

    def terminar_tarea(idProceso,idActividad)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      post "/tarea_participantes/1/updateEstado", {:tarea => tareaBD.id, :columna => "3"}
      assert_equal 200, status
      tareaBD1 = Tarea.find_by_id(tareaBD.id)
      assert_equal tareaBD1.columna, 4
    end

    def asignar_responsable_tarea(idProceso,idActividad,idUsuario)
      tareaUpdate = FactoryGirl.build(:tarea)
      tareaBD = Tarea.where(:actividad_id => idActividad, :proceso_id => idProceso).first
      post_via_redirect "/tarea_participantes", {:tarea_seleccionada => tareaBD.id, :participante_id => idUsuario, "dedicacion_" + idUsuario.to_s => tareaUpdate.avance}
      assert_equal 200, status
    end

    private


    def post_login(email, password)
      post_via_redirect "/users/sign_in", {:user => {:email => email, :password => password}}
      get "/recursos"
      assert_equal 200, status
    end

    def post_sign_out
      delete_via_redirect "/users/sign_out"
    end
  end

  def enter_site(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end

  #test "login and browse site" do
  #  get "/users/sign_in"
  #  assert_response :success
  #  post_via_redirect "/users/sign_in", {:user => {:email => "admin@colgames.com", :password => "12345678"}}
  #  #assert_response :success

  #  get "/rols?locale=es"
  #  assert_response :success
  #end
end