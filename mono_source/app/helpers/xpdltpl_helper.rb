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


module XpdltplHelper

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

    def generate_xpdl_metamodel

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

        plantilla = Plantilla.find(params[:id_plantilla])


        _tipo_recursos = Array.new
        _tipo_artefactos = Array.new
        _act_tipoartefactos = Array.new
        _activities = Actividad.find_all_by_plantilla_id(plantilla.id)

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
           Package :id => plantilla.id, :name => plantilla.nombre, :vendor => "Software Mico", :created => Time.now.to_s, :version => "2.1" do

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

             WorkflowProcess :id => plantilla.id, :name => plantilla.nombre, :created => Time.now.to_s do

                _events = Evento.find_all_by_plantilla_id(plantilla.id)
                _events.each do |evento|

                   if evento.tipo == 1 then
                       Event :id => evento.id, :name => evento.nombre, :type => "StartEvent", :trigger => "None", :result => "None"
                   end
                   if evento.tipo == 2 then
                       Event :id => evento.id, :name => evento.nombre, :type => "EndEvent", :trigger => "None", :result => "None"
                   end

                end

                _activities = Actividad.find_all_by_plantilla_id(plantilla.id)
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

                _compuertas = Compuertu.find_all_by_plantilla_id(plantilla.id)
                _compuertas.each do |compuerta|

                  _type = compuerta.tipo == 2 ? "Parallel" : "Exclusive"

                  Gateway :id => compuerta.id, :name => compuerta.nombre, :routeType => _type, :splitType => _type do

                   # _tarea_compuerta = Tarea.find_by_compuerta_id(compuerta.id)
                   # _precedencias = TareaPresedencium.find_all_by_predecesora_id(_tarea_compuerta.id)
                   # _precedencias.each do |precendencia|
                   #   TransitionRef :id => precendencia.sucesora_id

                   # end
                  end

                end

              end
           end
        end

        File.open("public/XPDLModel.dsl","w") do |f|
          serializer = RGen::ModelBuilder::ModelSerializer.new(f, XPDLMetamodel.ecore)
          serializer.serialize(_model)
        end

        #Use template to generate xpdl

        outdir = "public/templates"
        templatedir = "public/templates"

        tc = RGen::TemplateLanguage::DirectoryTemplateContainer.new( XPDLMetamodel, outdir)
        tc.load(templatedir);

        tc.expand('xpdl_template::Root', :for => _model)

  end
end
