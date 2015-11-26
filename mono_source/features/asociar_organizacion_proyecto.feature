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
# =  HU_TP_Asociar Empresas participantes a un Proyecto
Característica: Proyecto
Como usuario que gestiona proyectos
quiero asociar empresas participantes a un proyecto
de forma que pueda definir que empresas forman parte del desarrollo del proyecto

# Escenario No. 1
  Esquema del escenario:
    Dado que en asociar empresas participantes a un proyecto escenario 1 gestiono un proyecto en la pagina <pagina>
    Entonces en asociar empresas participantes a un proyecto escenario 1 que aparezca una lista de empresas y una opcion de asociar empresa
  Ejemplos:
    | pagina | opcion |
    | /proyectos | #empresas |

# Escenario No. 2
  Esquema del escenario:
    Dado que en asociar empresas participantes a un proyecto escenario 2 gestiono un proyecto en la pagina <pagina>
    Cuando en asociar empresas participantes a un proyecto escenario 2 asocio una empresa <empresa>
    Y en asociar empresas participantes a un proyecto escenario 2 guardo el proyecto
    Entonces en asociar empresas participantes a un proyecto escenario 2 se espera en guardar proyecto ver el resultado <resultado>
  Ejemplos:
    | pagina | empresa | resultado |
    | /proyectos | ENNOVA | OK |
    | /proyectos | ColGames | OK |
