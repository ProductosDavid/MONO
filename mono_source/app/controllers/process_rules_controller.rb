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
class ProcessRulesController < ApplicationController
include ProcessRulesHelper

  def validate_process
    rules = nil
    @errors = Array.new

      proceso = Proceso.find(params[:proceso_id])
      fecha_ini = proceso.proyecto.fecha_inicio
      fecha_fin = proceso.proyecto.fecha_fin

      ProcesoValidacion.find_all_by_proceso_id(proceso.id).each do |validacion|
        validacion.destroy
      end

      #process_rules

      process_rules = Rools::RuleSet.new do
        rule 'ProcessHasStartEvent' do
          parameter Integer
          condition { Evento.find_all_by_proceso_id_and_tipo( proceso.id, 1 ).count == 0 }
          consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>proceso " + proceso.nombre.upcase + "</span> no tiene evento de inicio", :tipo => "error").save! }
        end

        rule 'ProcessHasEndEvent' do
          parameter Integer
          condition { Evento.find_all_by_proceso_id_and_tipo( proceso.id, 2 ).count == 0 }
          consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>proceso " + proceso.nombre.upcase + "</span> no tiene evento de fin", :tipo => "error").save! }
        end

      end

      process_rules.assert proceso.id

      Tarea.find_all_by_proceso_id(proceso.id).each do |tarea|

        task_rules = Rools::RuleSet.new do

          rule 'TaskHasResponsable' do
            parameter Integer
            condition { tarea.tarea_participantes.count == 0 && !tarea.es_aprobacion }
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> no tiene responsable", :tipo => "error").save! }
          end

          rule 'TaskHasRevision' do
            parameter Integer
            condition { tarea.actividad.modo_revision != nil &&
                tarea.actividad.modo_revision != 'auto' &&
                tarea.tarea_revisions.count == 0 &&
                !tarea.es_aprobacion }
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> requiere aprobaci&oacute;n pero no tiene revisiones creadas", :tipo => "warning").save! }
          end

          rule 'TaskHasPlanedHours' do
            parameter Integer
            condition { tarea.actividad.tipocontrol == 'horas' &&
                tarea.horas_planeadas == nil }
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> se controla por horas pero no tiene definidas horas planeadas", :tipo => "warning").save! }
          end

          rule 'TaskHasStartDate' do
            parameter Integer
            condition { # tarea.actividad.tipocontrol == 'fechas' &&
                tarea.fecha_inicio == nil  }
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> no tiene definida fecha de inicio", :tipo => "warning").save! }
          end

          rule 'TaskDateIniIsInRangeDate' do
            parameter Integer
            condition { # tarea.actividad.tipocontrol == 'fechas' &&
              tarea.fecha_inicio != nil  &&
              tarea.fecha_inicio < fecha_ini}
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> esta fuera del rango de fechas del proyecto (fecha inicial)", :tipo => "warning").save! }
          end

          rule 'TaskDateEndBiggerStartDate' do

            parameter Integer
            condition { # tarea.actividad.tipocontrol == 'fechas' &&
              tarea.fecha_inicio != nil  &&
                  tarea.fecha_inicio > tarea.fecha_fin}
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> La fecha de finalizaci&oacute;n debe ser mayor a la de inicio", :tipo => "error").save! }
          end

          rule 'TaskHasEndDate' do
            parameter Integer
            condition { # tarea.actividad.tipocontrol == 'fechas' &&
                tarea.fecha_fin == nil  }
            consequence {ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> no tiene definida fecha de fin", :tipo => "warning").save! }
          end

          rule 'TaskDateFinIsInRangeDate' do
            parameter Integer
            condition { # tarea.actividad.tipocontrol == 'fechas' &&
              tarea.fecha_fin != nil  &&
              tarea.fecha_fin > fecha_fin}
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>tarea " + tarea.nombre.upcase + "</span> esta fuera del rango de fechas del proyecto (fecha final)", :tipo => "warning").save! }
          end

        end

        task_rules.assert tarea.id

      end

      Compuertu.find_all_by_proceso_id(proceso.id).each do |compuerta|

        gateway_rules = Rools::RuleSet.new do
          rule 'GatewayHasRoutes' do
            parameter Integer
            condition { MyJsTree.find_all_by_parent_id(compuerta.my_js_tree_id).count == 0 }
            consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>compuerta " + compuerta.nombre.upcase + "</span> no tiene rutas validas", :tipo => "error").save! }
          end
        end

        gateway_rules.assert compuerta.id

      end

    Rutum.find_all_by_proceso_id(proceso.id).each do |ruta|

      route_rules = Rools::RuleSet.new do
        rule 'RouteHasTask' do
          parameter Integer
          condition { MyJsTree.find_all_by_parent_id(ruta.my_js_tree_id).count == 0 }
          consequence { ProcesoValidacion.new(:proceso_id => proceso.id, :error_message => "<span>ruta " + ruta.nombre.upcase + "</span> no tiene tareas validas", :tipo => "error").save! }
        end
      end

      route_rules.assert ruta.id

    end

    if(params[:publicar] == "false")

      respond_to do |format|
        format.html { render action: "validate_process", :layout => "actividads" }
        format.json { head :no_content }
      end

    end

  end

  def publicar_proceso

    validate_process

    proceso = Proceso.find(params[:proceso_id])

    if(params[:publicar] == "true")

      error_list = ProcesoValidacion.find_all_by_proceso_id(proceso.id)

      if(error_list.length > 0)

        respond_to do |format|
          format.html { render action: "validate_process", :layout => "actividads" }
          format.json { head :no_content }
        end

      else

        iniciar_proceso

        respond_to do |format|
          format.html { render action: "publicar_proceso", :layout => "actividads" }
          format.json { head :no_content }
        end

        proceso.estado = "publicado"
        proceso.save!

      end


    end
  end

  def iniciar_proceso

    proceso = Proceso.find(params[:proceso_id])

    Tarea.find_all_by_proceso_id(proceso.id).each do |tarea|

      task_rules = Rools::RuleSet.new do

        rule 'IsFirstTask' do
          parameter Integer
          condition   { is_first_task2(tarea) }
          consequence { tarea.update_attribute(:activada, 1) }
        end

        rule 'PredecessorsIsAprobed' do
          parameter Integer
          condition   { predecesoras_aprobadas2(tarea) }
          consequence { tarea.update_attribute(:activada, 1) }
        end

      end

      task_rules.assert tarea.id

    end

  end


end

def predecesoras_aprobadas2 tarea
  aprobadas = true
  TareaPresedencium.find_all_by_sucesora_id(tarea.id).each do |presedencia|

    if(presedencia.predecesora_id != nil)
      tarea = Tarea.find(presedencia.predecesora_id)
      if(tarea != nil && tarea.columna != 4) then
        aprobadas = false
      end
    end
  end

  return aprobadas
end

def is_first_task2 tarea
  return (TareaPresedencium.find_all_by_sucesora_id_and_predecesora_id(tarea.id, nil).count > 0)
end
