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
# =  HU_TP_Crear Plantilla de proceso
# Crear tipo de plantilla
Dado /^que en procesos creo un proceso con nombre (.*) tipo de plantilla (.*) descripcion (.*)$/ do | nombre, tipo, descripcion |

    @proceso = Proceso.new(
      :nombre => nombre,
      :descripcion => descripcion,
      :tipo_plantilla_id => tipo,
      :proyecto_id => '10')
#  @myimagen = Image.new(
#    :image_file_name => imagen)
  #stub_paperclip_s3('image', 'imas_logo_large', 'jpg')
  #attach_file 'plantilla_imagen', 'C:/imas_logo_large.jpg'
end

Cuando /^en procesos se guarde el proceso/ do

    if (@proceso.save())
      @resultado = "OK"
    else
      @resultado = "KO"
    end
end

Entonces /^en procesos se espera ver (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end

Dado /^que en empresas existe una empresa con nombre (.*) nit (.*) descripcion (.*)$/ do | nombreemp, nitemp, descripcionemp |
  @empresa = Organizacion.new(
      :nit => nitemp,
      :nombre => nombreemp,
      :descripcion => descripcionemp
  )
end

Dado /^que tiene un proyecto asignado con nombre (.*) descripcion (.*)$/ do | nombreproy, descripcionproy |
  @empresa.save()
  @proyecto = Proyecto.new(
      :nombre => nombreproy,
      :descripcion => descripcionproy
  )
  @proyecto.organizacion_id = @empresa.id
end

Cuando /^contiene un proceso con nombre (.*) tipo de plantilla (.*) descripcion (.*)$/ do | nombreproc, tipo, descripcionproc |
  @proyecto.save()
  @proceso = Proceso.new(
      :nombre => nombreproc,
      :descripcion => descripcionproc,
      :tipo_plantilla_id => tipo
  )
  @proceso.proyecto_id = @proyecto.id
end

Entonces /^se espera un resultado (.*)$/ do | resultado |
  if (@proceso.save())
    @resultado = "OK"
  else
    @resultado = "KO"
  end

  if (@resultado != resultado)
    raise("Fallo")
  end
end
