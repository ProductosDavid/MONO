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
# =  HU_TP_Crear Plantilla de proceso
Característica: Tipo de Plantilla
Como usuario que gestiona procesos
quiero crear una plantilla de proceso
de forma que sea identificado de forma unica, y sea consultado, editado y usado en proyectos

# Creacion de plantillas
  Esquema del escenario: 
    Dado que en plantillas creo una plantilla con nombre <nombre> descripcion <descripcion> imagen de icono <imagen> tipo de plantilla <tipo>
    Cuando en plantillas se guarde la plantilla
    Entonces en plantillas se espera ver <resultado>
 
  Ejemplos:
    | nombre | descripcion | imagen | tipo | resultado |
    | plantilla_1 | esta es la plantilla No. 1 | imagen1.jpg | tipo_1 | OK |
    | plantilla_1 | | imagen1.jpg | tipo_1 | KO |
    | plantilla_1 | esta es la plantilla No. 1 | | tipo_1 | KO |
    | | esta es la plantilla No. 1 | imagen2.jpg | tipo_1 | KO |
    | plantilla_1 | esta es la plantilla No. 2 | imagen2.jpg | tipo_1 | KO |
    | plantilla_2 | esta es la plantilla No. 2 | imagen2.jpg | tipo_1 | OK |
    | plantilla_3 | esta es la plantilla No. 3 | imagen3.app | tipo_1 | KO |

    # Plantilla OK
    # Plantilla SIN DESCRIPCION
    # Plantilla SIN IMAGEN
    # Plantilla SIN NOMBRE
    # Plantilla REPETIDA
    # Plantilla OK
    # Plantilla CON IMAGEN INVALIDA
