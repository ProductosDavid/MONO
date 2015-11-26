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
# =  Listar actividades proyectos

####################################################################################################
# TODO:
# PROBAR INTERFAZ
####################################################################################################

Característica: Listar Proyectos
    Como un usuario administrador de David
    quiero determinar el tipo de control a actividades 
    de haga un seguimiento al proceso de acuerdo al tipo de control.
	
#Prueba de usuario
#Visualizar
  Esquema del escenario:
    Dado que en milestones tengo la actividad <actividad>
    Cuando elijo el tipo de control <tipo_control>
    Entonces en milestones se espera ver el resultado <resultado>

    Ejemplos:
    | actividad         	| tipo_control	| resultado	|
    | Actividad 1			| 1				| OK		|
