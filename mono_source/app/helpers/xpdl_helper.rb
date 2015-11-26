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
require 'rgen/metamodel_builder'
require 'rgen/template_language.rb'
require 'rgen/model_builder'
require 'rgen/model_builder/model_serializer'
require 'rgen/serializer/xmi20_serializer'


module XpdlHelper

  module XPDLMetamodel
    extend RGen::MetamodelBuilder::ModuleExtension

    class Element < RGen::MetamodelBuilder::MMBase

    end

    class Package < Element

      has_attr 'id', Integer
      has_attr 'name', String
      has_attr 'vendor', String
      has_attr 'created', String
      has_attr 'version', String

    end


    class WorkflowProcess < Element
      has_attr 'id', Integer
      has_attr 'name', String
      has_attr 'created', String
    end

    class Participant < Element
      has_attr 'id', Integer
      has_attr 'name', String
    end

    class ParticipantType < Element
      has_attr 'type', String
    end

    class Activity < Element
      has_attr 'id', Integer
      has_attr 'name', String
    end

    class Event < Element
      has_attr 'id', Integer
      has_attr 'name', String
      has_attr 'type', String
      has_attr 'trigger', String
      has_attr 'result', String
    end

    class Implementation < Element

    end

    class Task < Element
      has_attr 'id', Integer
      has_attr 'name', String
    end

    class Performer < Element
      has_attr 'id', Integer
    end

    class Gateway < Element
      has_attr 'id', Integer
      has_attr 'name', String
      has_attr 'splitJoin', String
      has_attr 'splitType', String
      has_attr 'routeType', String
    end

    class TransitionRef < Element
      has_attr 'id', Integer
    end

    class Transition < Element
      has_attr 'id', Integer
      has_attr 'name', String
      has_attr 'from', Integer
      has_attr 'to', Integer
    end

    class Artifact < Element
      has_attr 'id', String
      has_attr 'name', String
    end

    class Association < Element
      has_attr 'id', Integer
      has_attr 'direction', String
      has_attr 'source', String
      has_attr 'target', Integer
    end

    Package.contains_many 'workflowProcesses', WorkflowProcess, 'container'
    Package.contains_many 'participants', Participant, 'container'
    Package.contains_many 'artifacts', Artifact, 'container'
    Package.contains_many 'associations', Association, 'container'
    WorkflowProcess.contains_many 'transitions', Transition, 'container'
    Participant.contains_many 'participantTypes', ParticipantType, 'container'
    WorkflowProcess.contains_many 'activities', Activity, 'container'
    WorkflowProcess.contains_many 'events', Event, 'container'
    WorkflowProcess.contains_many 'gateways', Gateway, 'container'
    Activity.contains_one_uni 'implementation', Implementation
    Implementation.contains_many 'tasks', Task, 'container'
    Activity.contains_many 'performers', Performer, 'container'
    Gateway.contains_many 'transitionRefs', TransitionRef, 'container'

  end

  #Si se cambia este metodo, se debe cambiar tambien el del helper de process_rules
  def ultima_Actividad_Ruta_Merge1(_ult_act_ruta_merge, nodo, mergeid, _actividades_merge)
    if (nodo.type == "tarea_simple")
      Actividad.where(:my_js_tree_id => nodo.id).each do |actividad|
        #puts 'actividad ' + actividad.id.to_s
        Tarea.where(:actividad_id => actividad.id).each do |tarea|
          #puts 'tarea ' + tarea.id.to_s
          _ult_act_ruta_merge.push(tarea.actividad_id.to_s + "-" + mergeid.to_s)
          _actividades_merge[tarea.actividad_id.to_s] = mergeid.to_s
          #_actividades_merge.push(tarea.actividad_id.to_s)
        end
      end
    end
    if (nodo.type == "compuerta_exclu")
      MyJsTree.where(:proceso_id => nodo.proceso_id, :parent_id => nodo.id, :type => "ruta").each do |ruta|
        _my_js_tree_ultimo_ruta = MyJsTree.where(:proceso_id => nodo.proceso_id, :parent_id => ruta.id).order(:position).last
        #puts "jstreeultimomerg " + _my_js_tree_ultimo_ruta.id.to_s
        ultima_Actividad_Ruta_Merge1(_ult_act_ruta_merge, _my_js_tree_ultimo_ruta, mergeid, _actividades_merge)
      end
    end
  end

    def generate_xpdl_metamodel

      _ult_act_ruta_merge = Array.new
      _actividades_merge = Hash.new
      Merge.where(:proceso_id => params[:id_proceso]).each do |merge|
        #puts "merge " + merge.id.to_s
        MergeCompuerta.where(:proceso_id => params[:id_proceso], :merge_id => merge.id).each do |mergecompuerta|
          #puts "mergecompuerta " + mergecompuerta.id.to_s
          Rutum.where(:proceso_id => params[:id_proceso], :id => mergecompuerta.ruta_id).each do |ruta|
            #puts "ruta " + ruta.my_js_tree_id.to_s
            _my_js_tree_ultimo_ruta = MyJsTree.where(:proceso_id => params[:id_proceso], :parent_id => ruta.my_js_tree_id.to_s).last
            #puts "jstreeultimo " + _my_js_tree_ultimo_ruta.id.to_s
            if(_my_js_tree_ultimo_ruta != nil)
              ultima_Actividad_Ruta_Merge1(_ult_act_ruta_merge, _my_js_tree_ultimo_ruta, merge.id, _actividades_merge)
            end
          end
        end
      end

        File.open("public/XPDLMetamodel.ecore","w") do |f|
          ser = RGen::Serializer::XMI20Serializer.new(f)
          ser.serialize(XPDLMetamodel.ecore)

        end

        File.open("public/XPDLMetamodel.dsl","w") do |f|
          serializer = RGen::ModelBuilder::ModelSerializer.new(f, XPDLMetamodel.ecore)
          serializer.serialize(XPDLMetamodel.ecore)
        end

        #include models to use
        a=TipoRecurso.first
        a=Actividad.first
        a=Tarea.first
        a=ActividadTiporecurso.first
        a=TareaPresedencium.first
        a=Evento.first
        a=Compuertu.first
        a=TareaParticipante.first
        a=ActividadTipoartefacto.first
        a=TipoArtefacto.first

        @proceso = Proceso.find(params[:id_proceso])
        proceso = @proceso

        _tipo_recursos = Array.new
        _tipo_artefactos = Array.new
        _act_tipoartefactos = Array.new
        _activities = Actividad.find_all_by_proceso_id(proceso.id)

        _activities.each do |actividad|
            _actividad_tiporecursos = ActividadTiporecurso.find_all_by_actividad_id(actividad.id)
            _actividad_tiporecursos.each do |actividad_tipo_recurso|
              if(!_tipo_recursos.include?(actividad_tipo_recurso.tipo_recurso) && actividad_tipo_recurso.tipo_recurso.unit == 1)
                _tipo_recursos.push(actividad_tipo_recurso.tipo_recurso)
              end
            end

            _actividad_tipoartefactos = ActividadTipoartefacto.find_all_by_actividad_id(actividad.id)
            _actividad_tipoartefactos.each do |actividad_tipo_artefacto|
              _act_tipoartefactos.push(actividad_tipo_artefacto)
              if(!_tipo_artefactos.include?(actividad_tipo_artefacto.tipo_artefacto))
                _tipo_artefactos.push(actividad_tipo_artefacto.tipo_artefacto)
              end
            end
        end

        _model = RGen::ModelBuilder.build(XPDLMetamodel) do
           Package :id => proceso.id, :name => proceso.nombre, :vendor => "Software Mico", :created => Time.now.to_s, :version => "2.1" do

             _tipo_recursos.each do |tipo_recurso|
               Participant :id => tipo_recurso.id, :name => tipo_recurso.nombre do
                 ParticipantType :type => tipo_recurso.nombre
               end
             end

             _tipo_artefactos.each do |tipo_artefacto|
               Artifact :id => "A" + tipo_artefacto.id.to_s, :name => tipo_artefacto.nombre
             end

             _act_tipoartefactos.each do |act_tipo_art|
               _direction = act_tipo_art.modo == "In" ? "To" : act_tipo_art.modo == "Out" ? "From" : "Both"
               Association :id => act_tipo_art.id, :direction => _direction, :source => "A" + act_tipo_art.tipo_artefacto_id.to_s, :target => act_tipo_art.actividad_id
             end

             WorkflowProcess :id => proceso.id, :name => proceso.nombre, :created => Time.now.to_s do

                _events = Evento.find_all_by_proceso_id(proceso.id)
                _events.each do |evento|

                   if evento.tipo == 1 then
                       Event :id => evento.id, :name => evento.nombre, :type => "StartEvent", :trigger => "None", :result => "None"
                   end
                   if evento.tipo == 2 then
                       Event :id => evento.id, :name => evento.nombre, :type => "EndEvent", :trigger => "None", :result => "None"
                   end

                end

                _activities = Actividad.find_all_by_proceso_id(proceso.id)
                _activities.each do |actividad|

                  Activity :id => actividad.id, :name => actividad.nombre do
                      Implementation do

                        _tareas = Tarea.find_all_by_actividad_id(actividad.id)
                        _tareas.each do |tarea|

                          Task :id => tarea.id, :name => tarea.nombre do

                          end

                        end

                      end

                      _actividad_tiporecursos = ActividadTiporecurso.find_all_by_actividad_id(actividad.id)
                      _actividad_tiporecursos.each do |actividad_tipo_recurso|

                        if(actividad_tipo_recurso.tipo_recurso.unit == 1)
                          Performer :id => actividad_tipo_recurso.tipo_recurso.id
                        end
                      end
                  end
                end

                _compuertas = Compuertu.find_all_by_proceso_id(proceso.id)
                _compuertas.each do |compuerta|

                  _type = compuerta.tipo == 2 ? "Parallel" : "Exclusive"

                  Gateway :id => compuerta.id, :name => compuerta.nombre, :splitJoin => "Split", :routeType => _type, :splitType => _type do

                    _tarea_compuerta = Tarea.find_by_compuerta_id(compuerta.id)
                    _precedencias = TareaPresedencium.find_all_by_predecesora_id(_tarea_compuerta.id)
                    _precedencias.each do |precendencia|
                      TransitionRef :id => precendencia.sucesora_id

                    end
                  end

                end

                _merges = Merge.find_all_by_proceso_id(proceso.id)
                _merges.each do |merge|

                  _type = "Exclusive"

                  Gateway :id => merge.id, :name => merge.nombre, :splitJoin => "Join", :routeType => _type, :splitType => _type do

                  end

                end

                _merge_to_fin = Array.new
                _precedencias = TareaPresedencium.find_all_by_proceso_id(proceso.id)
                _precedencias.each do |precedencia|
                  _from_id = nil
                  _to_id = nil
                  _tipo_compuerta = nil
                  _compuerta_jstree = nil

                  if(precedencia.predecesora_id == nil)
                    _from_id = Evento.find_by_proceso_id_and_tipo(proceso.id, 1).id
                  else
                    if(Tarea.find(precedencia.predecesora_id).actividad != nil)
                      _from_id = Tarea.find(precedencia.predecesora_id).actividad.id
                    else
                      _from_id = Tarea.find(precedencia.predecesora_id).compuertu.id
                      _tipo_compuerta = Tarea.find(precedencia.predecesora_id).compuertu.tipo
                      _compuerta_jstree = Tarea.find(precedencia.predecesora_id).compuertu.my_js_tree_id
                      if(_tipo_compuerta == 3)
                        _merge_id = Merge.where(:my_js_tree_id => (_compuerta_jstree + 1)).first.id
                      end
                      #_tipo_compuerta = 4
                    end
                  end

                  if(precedencia.sucesora_id == nil)
                    if (_actividades_merge.has_key?(_from_id.to_s))
                      _to_id = _actividades_merge[_from_id.to_s].to_i
                      next
                    else
                      _to_id = Evento.find_by_proceso_id_and_tipo(proceso.id, 2).id
                    end
                  else
                    if(Tarea.find(precedencia.sucesora_id).actividad != nil)
                      _to_id = Tarea.find(precedencia.sucesora_id).actividad.id
                      if(_tipo_compuerta == 3)
                        #puts "es tipo 3 " + _to_id.to_s()
                        #if not (_actividades_merge.has_key?(_to_id.to_s))
                        if not (_ult_act_ruta_merge.include?(_to_id.to_s() + "-" + _merge_id.to_s()))
                          #puts "esta en actividades merge " + _to_id.to_s()
                          if ( Merge.where(:my_js_tree_id => (_compuerta_jstree + 1)) != nil)
                            _to_jstree = Actividad.find(_to_id).my_js_tree
                            _to_jstree_position = _to_jstree.position
                            _to_jstree_parent_id = _to_jstree.parent_id
                            #puts "es join " + _to_id.to_s()
                            if(MyJsTree.where(:proceso_id => proceso.id, :parent_id => _to_jstree_parent_id, :position => (_to_jstree_position - 1), :type => "merge").all.length > 0 )
                              #puts "si es join " + _to_id.to_s()
                              _from_id = Merge.where(:my_js_tree_id => (_compuerta_jstree + 1)).first.id
                              if (_merge_to_fin.include?(_from_id.to_s))
                                #puts _from_id.to_s
                                _merge_to_fin.delete(_from_id.to_s)
                              end
                            end
                          end
                        else
                          #_valor_borrado = _actividades_merge[_to_id.to_s]
                          _valor_borrado = _merge_id.to_s()
                          if not (_merge_to_fin.include?(_valor_borrado.to_s))
                            _merge_to_fin.push(_valor_borrado.to_s)
                            #puts _valor_borrado
                          end
                        end
                      end
                    else
                      _to_id = Tarea.find(precedencia.sucesora_id).compuertu.id
                    end
                  end

                  Transition :id => precedencia.id, :name => "", :from => _from_id, :to => _to_id

                end

                if (Evento.find_by_proceso_id_and_tipo(proceso.id, 2) != nil)
                  _evento_fin_id = Evento.find_by_proceso_id_and_tipo(proceso.id, 2).id
                  _merge_to_fin.each do |value|
                    Transition :id => (value.to_s() + _evento_fin_id.to_s()).to_i, :name => "", :from => value.to_i, :to => _evento_fin_id
                  end
                end

                _ult_act_ruta_merge.each do |actividadfin|
                  #puts "actividadfin " + actividadfin.to_s
                  _from_id = actividadfin.to_s.split('-')[0]
                  _to_id = actividadfin.to_s.split('-')[1]
                  #puts "actividadfin " + _from_id

                  Transition :id => (_from_id.to_s() + _to_id.to_s()).to_i, :name => "", :from => _from_id.to_i, :to => _to_id.to_i
                end
                #puts "holaa"
                #sleep 5


              end
           end
        end

        File.open("public/XPDLModel.dsl","w") do |f|
          serializer = RGen::ModelBuilder::ModelSerializer.new(f, XPDLMetamodel.ecore)
          serializer.serialize(_model)
        end

        #Use template to generate xpdl

        outdir = "public/templates/" + params[:id_proceso]
        templatedir = "public/templates"

        tc = RGen::TemplateLanguage::DirectoryTemplateContainer.new( XPDLMetamodel, outdir)
        tc.load(templatedir);

        tc.expand('xpdl_template::Root', :for => _model)

  end
end
