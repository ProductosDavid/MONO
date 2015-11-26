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
# =  Asociar Recursos a un Proyecto
Característica: Proyecto
Como usuario que gestiona proyectos
quiero asociar recursos a un proyecto
de forma que pueda definir que recursos van a usarse en el proyecto

####################################################################################################
# TODO:
# ESCRIBIR ESCENARIOS PARA ACUERDOS DE INTERFAZ
####################################################################################################


  #Escenario No. 3
  Esquema del escenario:
    Dado que existe un proyecto con nombre <nombreproy> descripcion <descripcionproy> perteneciente a una determinada empresa
    Cuando creo dos recursos uno con nombre <nomrec1> costo <cosrec1> unidades <unirec1> y el otro con nombre <nomrec2> costo <cosrec2> y unidades <unirec2>
    Entonces se espera que se puedan asociar esos dos recursos al proyecto con un resultado <resultado>
  Ejemplos:
    | nombreproy | descripcionproy | nomrec1 | cosrec1 | unirec1 | nomrec2 | cosrec2 | unirec2 | resultado |
    | El vendedor de periodicos | corto animado | papel | 30000 | 25 | licencia office | 1500000 | 11 | OK |
    | Run lucho Run | ciclismo nacional | portatil | 40000 | 10 | plan celular | 400000 | 15 | OK |

# Escenario No. 1
#  Esquema del escenario:
#    Dado que en asociar recursos a proyecto escenario 1 gestiono un proyecto en la pagina <pagina>
#    Entonces en asociar recursos a proyecto escenario 1 que aparezca una lista de roles y una opcion de asociar un recurso de la lista
#  Ejemplos:
#    | pagina | opcion |
#    | /proyecto | Equipo Mac |

# Escenario No. 2
#  Esquema del escenario:
#    Dado que en asociar recursos a proyectos escenario 2 gestiono un proyecto en la pagina <pagina>
#    Cuando en asociar recursos a proyectos escenario 2 asocio un recurso <recurso>
#    Y en asociar recursos a proyectos escenario 2 guardo el proyecto
#    Entonces en asociar recursos a proyectos escenario 2 se espera en guardar proyecto ver el resultado <resultado>
#  Ejemplos:
#    | pagina | recurso | resultado |
#    | /proyecto | Equipo Mac | OK |
#    | /proyecto | iMac | OK |
