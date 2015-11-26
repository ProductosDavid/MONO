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
# =  Ver tareas asignadas

####################################################################################################
# TODO:
####################################################################################################

Característica: Usuarios
	Como usuario del sistema
	Y como persona que participa en proyectos
	Yo quiero ver un panel de control o dashboard de mi flujo de trabajo
	De forma que vea mis tareas asignadas de proyectos de contenidos digitales
	Y vea mis tareas en los proyectos en que soy participante y responsable
	Y mis tareas estén en un estado de acuerdo a cómo voy con cada una
	Y gestione mis tareas de acuerdo a la metodología Kanban en las que muevo tarjetas de tareas entre columnas de estados

# Pruebas de persitencia
Esquema del escenario:
	Dado que soy usuario <nombre>
	Cuando estoy en la pagina <pagina>
	Entonces se espera que se muestre la tarea <tarea_1>
	Y la tarea <tarea_2>
	Y NO se muestre la tarea <tarea_3>
	Y NO se muestre la tarea <tarea_4>

  Ejemplos:
    | nombre	| pagina	| tarea_1	| tarea_2	| tarea_3	| tarea_4	|
    | juan		| proyectos	| tarea_1	| tarea_2	| tarea_3	| tarea_4	|
    | leidy		| proyectos	| tarea_1	| tarea_2	| tarea_3	| tarea_4	|
