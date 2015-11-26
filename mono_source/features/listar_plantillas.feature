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
# =  HU_TP_Visualizar plantillas en forma de lista
Característica: Plantilla
    Como usuario que gestiona recursos
    Yo quiero consultar una lista de plantillas
    De forma que vea qu� plantillas existen

##Escenario mostrar una lista de plantillas visitando la pagina
#  Esquema del escenario: Listar plantillas
#    Dado que en plantillas estoy en la pagina <pagina>
#    Y en plantillas he introducido <plantilla_1>
#    Entonces se espera en plantillas ver <resultado1>
#
#  Ejemplos:
#    | pagina | plantilla_1 | resultado1 |
#    | /plantillas | plantilla No. 1 | plantilla No. 1 |

#Escenario mostrar una lista de plantillas desde menu desde otra pagina
  Esquema del escenario: Listar plantillas
    Dado que en plantillas desde menu antes he introducido <plantilla_1>
    Y en plantillas desde menu estoy en la pagina <pagina>
    Y en plantillas desde menu uso la opcion de ver plantillas
    Entonces se espera en plantillas desde menu ver <resultado1>

  Ejemplos:
    | pagina | plantilla_1 | resultado1 |
    | /recursos | plantilla No. 1 | plantilla No. 1 |
