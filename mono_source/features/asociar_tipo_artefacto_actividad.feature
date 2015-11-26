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
# =  HU_TP_Asociar Tipos de Artefactos a una Actividad
Característica: Actividad
Como usuario que gestiona procesos
quiero asociar tipos de artefactos a una actividade
de forma que pueda definir que tipos de artefactos voy a necesitar para realizar dicha actividad

# Escenario No. 1
  Esquema del escenario:
    Dado que en asociar tipos de artefactos a actividades escenario 1 gestiono una actividad en la pagina <pagina>
    Entonces en asociar tipos de artefactos a actividades escenario 1 que aparezca una lista de tipos de artefactos y una opcion de asociar un tipo de artefacto de la lista
  Ejemplos:
    | pagina | opcion |
    | /tipo_artefactos | CostoTipoRec |

# Escenario No. 2
  Esquema del escenario:
    Dado que en asociar tipos de artefactos a actividades escenario 2 gestiono una actividad en la pagina <pagina>
    Cuando en asociar tipos de artefactos a actividades escenario 2 asocio un tipo de artefacto <tipo_artefacto>
    Y en asociar tipos de artefactos a actividades escenario 2 guardo la actividad
    Entonces en asociar tipos de artefactos a actividades escenario 2 se espera en guardar actividad ver el resultado <resultado>
  Ejemplos:
    | pagina | tipo_recurso | resultado |
    | /actividad | CostoTipoRec | OK |
    | /actividad | CostoTipoRec | KO |
