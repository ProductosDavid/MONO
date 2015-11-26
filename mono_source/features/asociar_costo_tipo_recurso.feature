#
#  MONO
#  Copyright (C) 2015  Universidad de los Andes
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#  
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#  
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# language: es
# =  HU_TP_Asociar Costo a Tipo de Recurso
Característica: Tipo de Recurso
Como usuario que gestiona recursos
quiero asociar un costo estimado a un tipo de recurso
de forma que pueda tener un estimado del costo de la plantilla diseñada

# ESTE ES UN ESCENARIO DE PRUEBAS DE INTERFAZ. NO DESCOMENTAR
  Esquema del escenario: 
    Dado que en asignar un costo a tipo de recurso gestiono un tipo de recurso en la pagina <pagina>
    Y en asignar un costo a tipo de recurso aplica la opcion nuevo_tipo_recurso
    Entonces en asignar un costo a tipo de recurso se espera en el tipo de recurso que aparezca la opcion <opcion>
  Ejemplos:
    | pagina | opcion |
    | /tipo_recursos | tipo_recurso[cost] |

  Esquema del escenario:
    Dado que en asignar un costo a tipo de recurso en esquema 2 gestiono un tipo de recurso en la pagina <pagina>
    Cuando en asignar un costo a tipo de recurso en esquema 2 agrego un costo <costo> al tipo de recurso
    Y en asignar un costo a tipo de recurso en esquema 2 aplico la opcion de guardar tipo de recurso
    Entonces en asignar un costo a tipo de recurso en esquema 2 se espera como resultado <resultado>
    #Y en asignar un costo a tipo de recurso en esquema 2 se espera en el tipo de recurso ver el costo <costo> agregado
  Ejemplos:
    | pagina | costo | resultado | texto |
    | /tipo_recursos | 10 | OK | 10 |
    #| /tipo_recursos | j | KO | test |

# ESTE ES UN ESCENARIO DE PRUEBAS DE INTERFAZ. NO DESCOMENTAR
#  Esquema del escenario:
#    Dado que en esquema 3 en asignar un costo a tipo de recurso gestiono un tipo de recurso en la pagina <pagina>
#    Cuando en asignar un costo a tipo de recurso agrego al tipo de recurso un contenido no numerico <costo>
#    Entonces en asignar un costo a tipo de recurso se espera que aparezca un <mensaje>.
#  Ejemplos:
#    | pagina | costo | mensaje |
#    | /tipo_recursos | J | El costo debe ser un valor numerico |
