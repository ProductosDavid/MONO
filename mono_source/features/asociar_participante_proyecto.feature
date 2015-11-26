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
# =  Asociar Participante a un Proyecto
Característica: Proyecto
Como usuario que gestiona proyectos
quiero asociar participantes a un proyecto
de forma que pueda definir que participantes van a estar en los procesos del proyecto

####################################################################################################
# TODO:
# ESCRIBIR ESCENARIOS PARA ACUERDOS DE INTERFAZ
####################################################################################################
# Escenario No. 1
  Esquema del escenario:
    Dado que en asociar participantes a proyecto escenario 1 gestiono un proyecto en la pagina <pagina>
    Entonces en asociar participantes a actividades escenario 1 que aparezca una lista de participantes y una opcion de asociar un participante de la lista
  Ejemplos:
    | pagina | opcion |
    | /proyecto | Juan |

# Escenario No. 2
  Esquema del escenario:
    Dado que en asociar participantes a proyectos escenario 2 gestiono un proyecto en la pagina <pagina>
    Cuando en asociar participantes a proyectos escenario 2 asocio un participante <recurso>
    Y en asociar participantes a proyectos escenario 2 guardo el proyecto
    Entonces en asociar participantes a proyectos escenario 2 se espera en guardar proyecto ver el resultado <resultado>
  Ejemplos:
    | pagina | recurso | resultado |
    | /proyecto | Juan | OK |
    | /proyecto | Jose | OK |
