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
# = Asociar Artefactos (Assets) existentes a un Proyecto
Característica: Proyecto
Como artefacto que gestiona proyectos
quiero asociar artefactos participantes a un proyecto
de forma que cuente con artefactos que se utilizaran en el proyecto

# Escenario No. 1
  Esquema del escenario:
    Dado que en asociar artefactos a un proyecto escenario 1 gestiono un proyecto en la pagina <pagina>
    Entonces en asociar artefactos a un proyecto escenario 1 que aparezca una lista de artefactos y una opcion de asociar artefacto
  Ejemplos:
    | pagina | opcion |
    | /proyectos | #artefactos |

# Escenario No. 2
  Esquema del escenario:
    Dado que en asociar artefactos a un proyecto escenario 2 gestiono un proyecto en la pagina <pagina>
    Cuando en asociar artefactos a un proyecto escenario 2 asocio un artefacto <artefacto>
    Y en asociar artefactos a un proyecto escenario 2 guardo el proyecto
    Entonces en asociar artefactos a un proyecto escenario 2 se espera en guardar proyecto ver el resultado <resultado>
  Ejemplos:
    | pagina | artefacto | resultado |
    | /proyectos | iMac | OK |
    | /proyectos | JDK 7 | OK |
