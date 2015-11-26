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
# =  HU_TP_Pintar BPMN con flujo de ejemplo
Característica: Plantillas
Como usuario que gestiona procesos
quiero visualizar un diagrama BPM
de forma que pueda ver gráficamente el flujo diseñado.

# Escenario No. 1
  Esquema del escenario:
    Dado que en pintar bpm gestiono plantillas en la pagina <pagina>
    Y en pintar bpmhe creado una plantilla
    Cuando en pintar bpm abro la vista de disenno de proceso
    Entonces se espera que aparezca una vista con un diagrama BPM mostrando un proceso con todos sus elementos de acuerdo a la notacion BPMN
  Ejemplos:
    | pagina | opcion |
    | /plantillas | CostoTipoRec |
