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
class ReporteController < ApplicationController
  include ReporteHelper

  def procesos
    # Se busca el proceso
    @proceso = Proceso.find(params[:id_proceso])
    # Se consulta el proyecto al que pertenece
    @proyecto = @proceso.proyecto

    # Se define un acumulador para el número de horas planeadas del proceso
    @horas_plan_pros =0
    # Se define un acumulador para el número de horas reales del proceso
    @horas_real_pros =0
    # Se define un acumulador para el costo planeado del proceso
    @costo_plan_pros =0
    # Se define un acumulador para el costo real del proceso
    @costo_real_pros =0
    # Se consultan todas las tareas relacionadas con el proceso en la Base de datos.
    @tareas = @proceso.tareas

    ### Variables auxiliares ###
    trabajadores = {}
    insumos = {}

    ### Se definen los contenedores de cada tabla del proyecto (mano de obra,recursos,procesos, actividad) ###
    # Contenedor para mano obra
    @mano_proy = []
    # Contenedor para mano obra
    @recursos = []
    # Contenedor para mano obra
    @actividad = []

    @tareas.each do |tarea|
      resumen = generar_resumen_tarea(tarea)
      @horas_plan_pros = @horas_plan_pros + resumen[:horas_plan]
      @horas_real_pros = @horas_real_pros + resumen[:horas_real]
      @costo_plan_pros = @costo_plan_pros + resumen[:costo_plan]
      @costo_real_pros = @costo_real_pros + resumen[:costo_real]
      trabajadores = actualizar_trabajadores(trabajadores, resumen[:usuario], resumen[:horas_plan], resumen[:horas_real])
      insumos = actualizar_recursos(insumos, resumen[:recursos])
      if resumen[:usuario] != nil
        @actividad.push([tarea.nombre, @proceso.id, (resumen[:usuario].nombre + " " + resumen[:usuario].apellidos), datos_recursos_tarea(resumen[:recursos]), resumen[:horas_plan], resumen[:horas_real], resumen[:costo_plan], resumen[:costo_real]])
      end
    end

    @mano_proy = datos_mano_obra(trabajadores)
    @recursos = datos_recursos(insumos)

    render :layout => false
  end

  def proyecto
    # Se busca la información correspondiente al proyecto
    @proyecto = Proyecto.find(params[:id_proyecto])
    # Se consulta en la base de datos los procesos asociados al proyecto por su relación con dicha tabla
    @proceso = @proyecto.procesos

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
    @proceso.each do |proceso|
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


    render :layout => false
  end



end
