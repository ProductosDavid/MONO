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
# =  HU_TP_Crear un Tipo de Plantilla
Característica: Tipo de Plantilla
Como usuario que gestiona procesos
quiero crear un tipo de plantilla
de forma que sea identificado de forma unica, y sea consultado, editado y usado en gestion de plantillas

# Creacion de tipos de plantilla
  Esquema del escenario: 
    Dado que en tipos de plantillas creo un tipo de plantilla con nombre <nombre> y descripcion <descripcion>
    Cuando en tipos de plantillas se guarde el tipo de plantilla
    Entonces en tipos de plantillas se espera ver <resultado>
 
  Ejemplos:
    | nombre | descripcion | resultado |
    | tipo_1 | este es el tipo No. 1 | OK |
    | tipo_2 | | OK |
    | | este es el tipo No. 2 | KO |
    #| tipo_1 | este es el tipo No. 2 | KO |
    | tipo_2 | este es el tipo No. 2 | OK |

    # Tipo de plantilla OK
    # Tipo de plantilla OK sin descripcion
    # Tipo de plantilla sin nombre
    # Tipo de plantilla con nombre repetido
    # Tipo de plantilla OK
