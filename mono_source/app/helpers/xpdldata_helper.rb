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
module XpdldataHelper

  def generate_data_process

    _xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?> \n"


    _xml += "<data>\n"

    _xml += "\t<organization_types>\n"

    TipoOrganizacion.all.each do |tipo_org|
      _xml += "\t\t<organization_type id=\"#{tipo_org.id}\" name=\"#{tipo_org.name}\" />\n"
    end

    _xml += "\t</organization_types>\n"


    _xml += "\t<festivos>\n"

    Festivo.all.each do |festivo|
      _xml += "\t\t<festivo id=\"#{festivo.id}\" dia=\"#{festivo.dia}\" mes=\"#{festivo.mes}\" />\n"
    end

    _xml += "\t</festivos>\n"

    _xml += "\t<resource_types>\n"

    TipoRecurso.find_all_by_unit(2).each do |tipo_rec|
      _xml += "\t\t<resource_type id=\"#{tipo_rec.id}\" name=\"#{tipo_rec.nombre}\" />\n"
    end

    _xml += "\t</resource_types>\n"

    _xml += "\t<roles>\n"

    TipoRecurso.find_all_by_unit(1).each do |rol|
      _xml += "\t\t<role id=\"#{rol.id}\" name=\"#{rol.nombre}\" />\n"
    end

    _xml += "\t</roles>\n"

    _xml += "\t<template_types>\n"

    TipoPlantilla.all.each do |tipo_tpl|
      _xml += "\t\t<template_type id=\"#{tipo_tpl.id}\" name=\"#{tipo_tpl.nombre}\" />\n"
    end

    _xml += "\t</template_types>\n"

    _xml += "\t<asset_types>\n"

    TipoArtefacto.all.each do |tipo_ass|
      _xml += "\t\t<asset_type id=\"#{tipo_ass.id}\" name=\"#{tipo_ass.nombre}\" />\n"
    end

    _xml += "\t</asset_types>\n"

    _xml += "\t<repository_types>\n"

    TipoDeposito.all.each do |rep_type|
      _xml += "\t\t<repository_type id=\"#{rep_type.id}\" name=\"#{rep_type.nombre}\" />\n"
    end

    _xml += "\t</repository_types>\n"

    _xml += "\t<repositories>\n"

    Deposito.all.each do |rep|
      _xml += "\t\t<repository id=\"#{rep.id}\" name=\"#{rep.nombre}\" user=\"#{rep.usuario}\" password=\"#{rep.contrasena}\" account=\"#{rep.cuenta}\" type=\"#{rep.tipo_deposito_id}\" />\n"
    end

    _xml += "\t</repositories>\n"


    _xml += "\t<organizations>\n"

    Organizacion.all.each do |org|

      _xml += "\t\t<organization id=\"#{org.id}\" nit=\"#{org.nit}\" name=\"#{org.nombre}\" type=\"#{org.tipo_organizacion_id}\">\n"

      _xml += "\t\t\t<resources> \n"

      Recurso.find_all_by_organizacion_id(org.id).each do |recurso|
        _xml += "\t\t\t\t<resource id=\"#{ recurso.id }\" name=\"#{ recurso.nombre }\" units=\"#{ recurso.unidades }\" cost=\"#{ recurso.costo }\" type=\"#{ recurso.tipo_recurso_id}\" /> \n"
      end

      _xml += "\t\t\t</resources> \n"

      _xml += "\t\t\t<users> \n"

      Usuario.find_all_by_organizacion_id(org.id).each do |usuario|
        _xml += "\t\t\t\t<user id=\"#{ usuario.id }\" fisrt_name=\"#{ usuario.nombre }\" last_name=\"#{ usuario.apellidos }\" email=\"#{ usuario.email }\" password=\"#{ User.find(usuario.id).encrypted_password }\" role=\"#{ usuario.tipo_recurso_id}\" cost=\"#{ usuario.costo }\" /> \n"
      end

      _xml += "\t\t\t</users> \n"

      _xml += "\t\t</organization>\n"

    end

    _xml += "\t</organizations>\n"

    _xml += "\t<templates>\n"

    Plantilla.all.each do |plantilla|

      _xml += "\t\t<template id=\"#{plantilla.id }\" name=\"#{plantilla.nombre }\"> \n"

      _xml += "\t\t\t<activities>\n"

      Actividad.find_all_by_plantilla_id(plantilla.id).each do |actividad|

        _modo_ejecucion = actividad.modoejecucion == 1 ? "simple" : actividad.modoejecucion == 2 ? "sequential" : "parallel";
        _tipo_control = actividad.tipocontrol == "fechas" ? "fechas" : actividad.tipocontrol == "horas" ? "horas" : "none";
        _modo_aprobacion = actividad.modo_revision == "sequ" ? "sequential" : actividad.modo_revision == "para" ? "parallel" : "auto"

        _xml += "\t\t\t\t<activity id=\"#{actividad.id}\" name=\"#{ actividad.nombre }\" execution_mode=\"#{_modo_ejecucion}\" estimated_duration=\"#{actividad.duracion}\" estimated_hours=\"#{actividad.horas_estimadas}\" control_type=\"#{_tipo_control}\" approval_mode=\"#{_modo_aprobacion}\" >\n"

        _xml += "\t\t\t\t\t<resource_types>\n"

        ActividadTiporecurso.find_all_by_actividad_id(actividad.id).each do |tipo_rec|
          if(tipo_rec.tipo_recurso.unit == 2)
          _xml += "\t\t\t\t\t\t<resource_type id=\"#{tipo_rec.tipo_recurso_id}\" />\n"
         end
        end

        _xml += "\t\t\t\t\t</resource_types>\n"

        _xml += "\t\t\t\t\t<participants>\n"

        ActividadTiporecurso.find_all_by_actividad_id(actividad.id).each do |tipo_rec|
          if(tipo_rec.tipo_recurso.unit == 1)
            _xml += "\t\t\t\t\t\t<participant id=\"#{tipo_rec.tipo_recurso_id}\" />\n"
          end
        end

        _xml += "\t\t\t\t\t</participants>\n"

        _xml += "\t\t\t\t\t<asset_types>\n"

        ActividadTipoartefacto.find_all_by_actividad_id(actividad.id).each do |tipo_ass|
          _xml += "\t\t\t\t\t\t<asset_type id=\"#{tipo_ass.tipo_artefacto_id}\" mode=\"#{tipo_ass.modo}\" />\n"
        end

        _xml += "\t\t\t\t\t</asset_types>\n"

        _xml += "\t\t\t\t\t<revisions>\n"

        ActividadRevision.find_all_by_actividad_id(actividad.id).each do |revision|
          _xml += "\t\t\t\t\t\t<revision role=\"#{revision.tipo_recurso_id}\" />\n"
        end

        _xml += "\t\t\t\t\t</revisions>\n"

        _xml += "\t\t\t\t</activity>\n"
      end

      _xml += "\t\t\t</activities>\n"

      _xml += "\t\t\t<gateways>\n"

      Compuertu.find_all_by_plantilla_id(plantilla.id).each do |compuerta|
        _tipo_compuerta = compuerta.tipo == 1 ? "OR" : compuerta.tipo == 2 ? "XOR" : "AND";
        _xml += "\t\t\t\t<gateway id=\"#{compuerta.id}\" name=\"#{ compuerta.nombre }\" tipo=\"#{_tipo_compuerta}\" />\n"
      end

      _xml += "\t\t\t</gateways>\n"

      _xml += "\t\t\t<events>\n"

      Evento.find_all_by_plantilla_id(plantilla.id).each do |evento|
        _tipo_evento = evento.tipo == 1 ? "Start" : "End";
        _xml += "\t\t\t\t<event id=\"#{evento.id}\" name=\"#{ evento.nombre }\" type=\"#{_tipo_evento}\" />\n"
      end

      _xml += "\t\t\t</events>\n"

      _xml += "\t\t\t<routes>\n"

      Rutum.find_all_by_plantilla_id(plantilla.id).each do |ruta|
        _tipo_ruta = ruta.tipo == 1 ? "fordward" : "backward";
        _xml += "\t\t\t\t<route id=\"#{ruta.id}\" name=\"#{ ruta.nombre }\" type=\"#{_tipo_ruta}\" />\n"
      end

      _xml += "\t\t\t</routes>\n"

      _xml += "\t\t</template>\n"

    end

    _xml += "\t</templates>\n"

    _xml += "\t<projects>\n"

    Proyecto.all.each do |proyecto|

    _xml += "\t\t<project id=\"#{proyecto.id }\" name=\"#{proyecto.nombre }\"> \n"

    _xml += "\t\t\t<organizations>\n"

    ProyectoOrganizacion.find_all_by_proyecto_id(proyecto.id).each do |org|
      _xml += "\t\t\t\t<organization id=\"#{org.organizacion_id}\" />\n"
    end

    _xml += "\t\t\t</organizations>\n"

    _xml += "\t\t\t<participants>\n"

    ProyectoUsuario.find_all_by_proyecto_id(proyecto.id).each do |usr|
      _xml += "\t\t\t\t<participant id=\"#{usr.usuario_id}\" />\n"
    end

    _xml += "\t\t\t</participants>\n"

    _xml += "\t\t\t<resources>\n"

    ProyectoRecurso.find_all_by_proyecto_id(proyecto.id).each do |rec|
      _xml += "\t\t\t\t<resource id=\"#{rec.recurso_id}\" />\n"
    end

    _xml += "\t\t\t</resources>\n"

    Proceso.find_all_by_proyecto_id(proyecto.id).each do |proceso|

    _xml += "\t\t\t<workflow id=\"#{proceso.id }\" name=\"#{proceso.nombre }\" L=\"#{proceso.lunes }\" M=\"#{proceso.martes }\" I=\"#{proceso.miercoles }\" J=\"#{proceso.jueves }\" V=\"#{proceso.viernes }\" S=\"#{proceso.sabado }\" D=\"#{proceso.domingo }\" FI=\"#{proceso.fechaini }\" FF=\"#{proceso.fechafin }\"> \n"

    _xml += "\t\t\t<calendars>\n"

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Lunes", proceso.lunes).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Martes", proceso.martes).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Miercoles", proceso.miercoles).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Jueves", proceso.jueves).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Viernes", proceso.viernes).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Sabado", proceso.sabado).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    Calendario.where("proceso_id = ? and dia = ? and horas != ?",proceso.id, "Domingo", proceso.domingo).each do |calendario|
      _xml += "\t\t\t\t<calendar fecha=\"#{calendario.fecha}\" ht=\"#{calendario.horas}\" />\n"
    end

    _xml += "\t\t\t</calendars>\n"

    _xml += "\t\t\t\t<activities>\n"

    Actividad.find_all_by_proceso_id(proceso.id).each do |actividad|

      _modo_ejecucion = actividad.modoejecucion == 1 ? "simple" : actividad.modoejecucion == 2 ? "sequential" : "parallel";
      _tipo_control = actividad.tipocontrol == "fechas" ? "fechas" : actividad.tipocontrol == "horas" ? "horas" : "none";
      _modo_aprobacion = actividad.modo_revision == "sequ" ? "sequential" : actividad.modo_revision == "para" ? "parallel" : "auto"

      _xml += "\t\t\t\t\t<activity id=\"#{actividad.id}\" name=\"#{ actividad.nombre }\" execution_mode=\"#{_modo_ejecucion}\" estimated_duration=\"#{actividad.duracion}\" estimated_hours=\"#{actividad.horas_estimadas}\" control_type=\"#{_tipo_control}\" approval_mode=\"#{_modo_aprobacion}\" >\n"

      _xml += "\t\t\t\t\t\t<resource_types>\n"

      ActividadTiporecurso.find_all_by_actividad_id(actividad.id).each do |tipo_rec|
        if(tipo_rec.tipo_recurso.unit == 2)
          _xml += "\t\t\t\t\t\t<resource_type id=\"#{tipo_rec.tipo_recurso_id}\" />\n"
        end
      end

      _xml += "\t\t\t\t\t</resource_types>\n"

      _xml += "\t\t\t\t\t<participants>\n"

      ActividadTiporecurso.find_all_by_actividad_id(actividad.id).each do |tipo_rec|
        if(tipo_rec.tipo_recurso.unit == 1)
          _xml += "\t\t\t\t\t\t<participant id=\"#{tipo_rec.tipo_recurso_id}\" />\n"
        end
      end

      _xml += "\t\t\t\t\t</participants>\n"

      _xml += "\t\t\t\t\t\t<asset_types>\n"

      ActividadTipoartefacto.find_all_by_actividad_id(actividad.id).each do |tipo_ass|
        _xml += "\t\t\t\t\t\t\t<asset_type id=\"#{tipo_ass.tipo_artefacto_id}\" mode=\"#{tipo_ass.modo}\" />\n"
      end

      _xml += "\t\t\t\t\t\t</asset_types>\n"

      _xml += "\t\t\t\t\t\t<revisions>\n"

      ActividadRevision.find_all_by_actividad_id(actividad.id).each do |revision|
        _xml += "\t\t\t\t\t\t\t<revision role=\"#{revision.tipo_recurso_id}\" />\n"
      end

      _xml += "\t\t\t\t\t\t</revisions>\n"

      _xml += "\t\t\t\t\t</activity>\n"
    end

    _xml += "\t\t\t\t</activities>\n"

    _xml += "\t\t\t\t<gateways>\n"

    Compuertu.find_all_by_proceso_id(proceso.id).each do |compuerta|
      _tipo_compuerta = compuerta.tipo == 1 ? "OR" : compuerta.tipo == 2 ? "XOR" : "AND";
      _xml += "\t\t\t\t\t<gateway id=\"#{compuerta.id}\" name=\"#{ compuerta.nombre }\" tipo=\"#{_tipo_compuerta}\" />\n"
    end

    _xml += "\t\t\t\t</gateways>\n"

    _xml += "\t\t\t\t<events>\n"

    Evento.find_all_by_proceso_id(proceso.id).each do |evento|
      _tipo_evento = evento.tipo == 1 ? "Start" : "End";
      _xml += "\t\t\t\t\t<event id=\"#{evento.id}\" name=\"#{ evento.nombre }\" type=\"#{_tipo_evento}\" />\n"
    end

    _xml += "\t\t\t\t</events>\n"

    _xml += "\t\t\t\t<routes>\n"

    Rutum.find_all_by_proceso_id(proceso.id).each do |ruta|
      _tipo_ruta = ruta.tipo == 1 ? "fordward" : "backward";
      _xml += "\t\t\t\t\t<route id=\"#{ruta.id}\" name=\"#{ ruta.nombre }\" type=\"#{_tipo_ruta}\" />\n"
    end

    _xml += "\t\t\t\t</routes>\n"

    _xml += "\t\t\t\t<implementation>\n"

    _xml += "\t\t\t\t\t<activity_tasks>\n"

    Actividad.find_all_by_proceso_id(proceso.id).each do |actividad|

      _xml += "\t\t\t\t\t\t<activity id=\"#{actividad.id}\">\n"

      Tarea.find_all_by_actividad_id(actividad.id).each do |tarea|

        _xml += "\t\t\t\t\t\t\t<task id=\"#{tarea.id}\" name=\"#{ tarea.nombre }\" duration=\"#{ tarea.duracion }\" planned=\"#{ tarea.horas_planeadas }\" executed=\"#{ tarea.horas_ejecutadas }\" priority=\"#{ tarea.prioridad }\" >\n"

        _xml += "\t\t\t\t\t\t\t\t<resources>\n"

        TareaRecurso.find_all_by_tarea_id(tarea.id).each do |tarea_recurso|
          _xml += "\t\t\t\t\t\t\t\t\t<resource id=\"#{tarea_recurso.recurso.id}\" units=\"#{ tarea_recurso.unidades }\" />\n"
        end

        _xml += "\t\t\t\t\t\t\t\t</resources>\n"

        _xml += "\t\t\t\t\t\t\t\t<participants>\n"

        TareaParticipante.find_all_by_tarea_id(tarea.id).each do |tarea_participante|
          _xml += "\t\t\t\t\t\t\t\t\t<participant id=\"#{tarea_participante.usuario.id}\" assigment=\"#{ tarea_participante.dedicacion }\" />\n"
        end

        _xml += "\t\t\t\t\t\t\t\t</participants>\n"

        _xml += "\t\t\t\t\t\t\t</task>\n"

      end

      _xml += "\t\t\t\t\t\t</activity>\n"

    end

    _xml += "\t\t\t\t\t</activity_tasks>\n"

    _xml += "\t\t\t\t\t<desicion_tasks>\n"

    Compuertu.find_all_by_proceso_id(proceso.id).each do |compuerta|

      _xml += "\t\t\t\t\t\t<gateway id=\"#{compuerta.id}\" >\n"

      Tarea.find_all_by_compuerta_id(compuerta.id).each do |tarea|

        _xml += "\t\t\t\t\t\t\t<task id=\"#{tarea.id}\" name=\"#{ tarea.nombre }\" duration=\"#{ tarea.duracion }\" planned=\"#{ tarea.horas_planeadas }\" executed=\"#{ tarea.horas_ejecutadas }\" priority=\"#{ tarea.prioridad }\" >\n"

        _xml += "\t\t\t\t\t\t\t\t<resources>\n"

        TareaRecurso.find_all_by_tarea_id(tarea.id).each do |tarea_recurso|
          _xml += "\t\t\t\t\t\t\t\t\t<resource id=\"#{tarea_recurso.recurso.id}\" units=\"#{ tarea_recurso.unidades }\" />\n"
        end

        _xml += "\t\t\t\t\t\t\t\t</resources>\n"

        _xml += "\t\t\t\t\t\t\t\t<participants>\n"

        TareaParticipante.find_all_by_tarea_id(tarea.id).each do |tarea_participante|
          _xml += "\t\t\t\t\t\t\t\t\t<participant id=\"#{tarea_participante.usuario.id}\" assigment=\"#{ tarea_participante.dedicacion }\" />\n"
        end

        _xml += "\t\t\t\t\t\t\t\t</participants>\n"

        _xml += "\t\t\t\t\t\t\t</task>\n"

      end

      _xml += "\t\t\t\t\t\t</gateway>\n"

    end

    _xml += "\t\t\t\t\t</desicion_tasks>\n"

    _xml += "\t\t\t\t\t<transitions>\n"

    TareaPresedencium.find_all_by_proceso_id(proceso.id).each do |precedencia|
      _xml += "\t\t\t\t\t\t<transition from=\"#{precedencia.predecesora_id}\" to=\"#{precedencia.sucesora_id}\" />\n"
    end

    _xml += "\t\t\t\t\t</transitions>\n"

    _xml += "\t\t\t\t</implementation>\n"

    _xml += "\t\t\t</workflow>\n"

    end

    _xml += "\t\t</project>\n"

    end

    _xml += "\t</projects>\n"

    _xml += "</data>\n"

    File.open("public/templates/"+ params[:id_proceso] +"/proceso_data.xml","w") do |f|
      f.write(_xml)
    end

  end

end

