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
module ReporteHelper

  def generar_resumen_tarea(tarea)
    # calcular horas de la tarea según horas_planeadas y duración en días
    horas_plan_tarea = (tarea.horas_planeadas.nil? ? 0 : tarea.horas_planeadas)*(tarea.duracion.nil? ? 0 : tarea.duracion)
    # calcular horas acumuladas durante la ejecución del proceso
    horas_real_tarea = (tarea.horas_acumuladas.nil? ? 0 : tarea.horas_acumuladas)
    # Acumulador de costo planeado por tarea
    costo_plan_tarea=0
    # Acumulador de costo ejectuadp por tarea
    costo_real_tarea=0
    # Se consulta al responsable de la tarea
    usuario = nil
    asignacion = TareaParticipante.find_by_tarea_id(tarea.id)
    if asignacion != nil
      # Si encontro una asignación de un trabajador a la tarea entonces guarda al usuario
      usuario = asignacion.usuario
      # Y calcula los costos de su mano de hora de acuerdo a las horas planeadas y reales
      costo_plan_tarea = (usuario.costo.nil? ? 0 : usuario.costo) * horas_plan_tarea
      costo_real_tarea = (usuario.costo.nil? ? 0 : usuario.costo) * horas_real_tarea
    end
    # Se consultan los recursos de la tarea
    recursos = []
    asignacion_recursos = TareaRecurso.find_all_by_tarea_id(tarea.id)
    if asignacion_recursos != nil
      # Si encuenta asignaciones de recurso a la tanrea, entonces guarda el conjunto de recursos asignado a la tarea.
      #recursos=asignacion_recursos
      recursos = []
      # Por cada recurso asignado a la tarea
      asignacion_recursos.each do |r|
        # Consulta la información del recurso
        recurso = r.recurso
        # Calcula el costo por unidad asignadas del recurso para la tarea
        costo_recurso = recurso.costo * r.unidades
        # Acumula el costo del recurso al costo planeado de la tarea
        costo_plan_tarea = costo_recurso + costo_plan_tarea
        usado = FALSE
        # Si el hay horas ejecutas, significa que el recurso debe estar en uso
        if (horas_real_tarea > 0)
          # Por consiguiente, se suma el costo del recurso a costo real de la tarea ya en ejecución.
          costo_real_tarea = costo_recurso + costo_real_tarea
          usado = TRUE
        end
        rec = [recurso,r.unidades,costo_recurso,usado]
        recursos.append(rec)
      end
    end

    # Crea un diccionario para consultar la información de la tarea. (Equivalente de un HashMap en Java)
    resumen={}
    resumen[:horas_plan] = horas_plan_tarea
    resumen[:horas_real] = horas_real_tarea
    resumen[:costo_plan] = costo_plan_tarea
    resumen[:costo_real] = costo_real_tarea
    resumen[:usuario] = usuario
    resumen[:recursos] = recursos
    # Retorna el dicionario con el resumen de la tarea.
    return resumen
  end

  def actualizar_trabajadores(trabajadores, nuevo, horas_plan, horas_real)
    if nuevo != nil
      if trabajadores.length > 0
        if trabajadores[nuevo.id] != nil
          actualizar = trabajadores[nuevo.id]
          actualizar[1] = actualizar[1]+horas_plan
          actualizar[2] = actualizar[2]+horas_real
          trabajadores[nuevo.id] = actualizar
        else
          trabajadores[nuevo.id] = [nuevo, horas_plan, horas_real]
        end
      else
        trabajadores[nuevo.id] = [nuevo, horas_plan, horas_real]
      end
    end
    return trabajadores
  end

  def actualizar_recursos(insumos, asignacion)

    if asignacion.length > 0
      asignacion.each do |a|
        r = a[0]
        if insumos.length >0
          if insumos[r.id] != nil
            actualizar = insumos[r.id]
            actualizar[1] = actualizar[1]+a[1]
            actualizar[2] = actualizar[2]+(a[3] == TRUE ? a[1] : 0)
            actualizar[3] = actualizar[3]+ a[2]
            actualizar[4] = actualizar[4]+(a[3] == TRUE ? a[2] : 0)
            insumos[r.id] = actualizar
          else
            # recurso=0, unidades=1, unidades_ejecutadas=2,costo planeado=3, costo_ejecutado=4
            insumos[r.id] = [r, a[1], a[3] == TRUE ? a[1] : 0, a[2], a[3] == TRUE ? a[2] : 0]
          end
        else
          # recurso=0, unidades=1, unidades_ejecutadas=2,costo planeado=3, costo_ejecutado=4
          insumos[r.id] = [r, a[1], a[3] == TRUE ? a[1] : 0, a[2], a[3] == TRUE ? a[2] : 0]
        end
      end
    end

    return insumos
  end

  def datos_mano_obra(trabajadores)
    datos = []
    for key in trabajadores.keys()
      trabajador = trabajadores[key]
      usuario = trabajador[0]
      # nombre completo[0], organización[1], rol[2], costo_mano_obra[3], horas_planeadas[4], horas_ejecutadas[5],costo_planeado[6], costo_ejecutado[7]
      fila = [usuario.nombre+" "+usuario.apellidos, usuario.organizacion.nombre, usuario.tipo_recurso.nombre, (usuario.costo.nil? ? 0 : usuario.costo), trabajador[1], trabajador[2], (usuario.costo.nil? ? 0 : usuario.costo)*trabajador[1], (usuario.costo.nil? ? 0 : usuario.costo)*trabajador[2]]
      datos.push(fila)
    end
    return datos
  end

  def datos_recursos(insumos)
    datos = []
    for key in insumos.keys()
      insumo = insumos[key]
      recurso = insumo[0]
      # recurso[0], organización[1], costo_unidad[2] , unidades[3], unidades_ejecutadas[4],costo planeado[5], costo_ejecutado[6]
      fila = [recurso.nombre, recurso.organizacion.nombre, recurso.costo, insumo[1], insumo[2],insumo[3],insumo[4]]
      datos.push(fila)
    end
    return datos
  end

  def datos_recursos_tarea(asignaciones)
    datos = ''
    if asignaciones.length > 0
      asignaciones.each do |a|
        r = a[0]
        datos = datos + (r.nombre + "(" + a[1].to_s+ "), ")
      end
    end
    return datos
  end

end
