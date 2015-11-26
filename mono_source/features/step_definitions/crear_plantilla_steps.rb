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
Dado /^que en plantillas creo una plantilla con nombre (.*) descripcion (.*) imagen de icono (.*) tipo de plantilla (.*)$/ do | nombre, descripcion, imagen, tipo |

  # Validamos imagen.
  type = imagen.split(".")[1]
  if type == "jpg" || type == "bmp" || type == "png"
    @resultado = "OK"
  else
    @resultado = "KO"
  end

  if (@resultado == 'OK')
    @plantilla = Plantilla.new(
      :nombre => nombre,
      :descripcion => descripcion,
      :tipo_plantilla_id => tipo )
  end
#  @myimagen = Image.new(
#    :image_file_name => imagen)
  #stub_paperclip_s3('image', 'imas_logo_large', 'jpg')
  #attach_file 'plantilla_imagen', 'C:/imas_logo_large.jpg'
end

Cuando /^en plantillas se guarde la plantilla/ do

  if (@resultado == 'OK')
    if (@plantilla.save())
      @resultado = "OK"
    else
      @resultado = "KO"
    end
  end
end

Entonces /^en plantillas se espera ver (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo")
  end
end
