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
# =  HU_TP_Diseñar Panel de Control de Plantillas
Característica: Plantillas
Como usuario que gestiona procesos
quiero visualizar informacion consolidada de una plantilla
de forma que pueda ver las estadisticas más importantes de la plantilla

# Escenario No. 1
  Esquema del escenario:
    Dado que en disenar panel control plantillas gestiono plantillas en la pagina <pagina>
    Y en disenar panel control plantillas he creado una plantilla
    Cuando en disenar panel control plantillas consulto la plantilla
    Entonces en disenar panel control plantillas se espera que aparezca una vista con numero de actividades <actividades>
    Y en disenar panel control plantillas con numero de compuertas <compuertas>
    Y en disenar panel control plantillas con numero de recursos <recursos>
    Y en disenar panel control plantillas con tiempo <tiempo>
    Y en disenar panel control plantillas con costo <costo>

  Ejemplos:
    | pagina | actividades | compuertas | recursos | tiempo |  |
    | /plantillas | 1 | 1 | 1 | 1 | 1 |
