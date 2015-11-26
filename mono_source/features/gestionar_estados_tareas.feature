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
# = Gestionar estados tareas

####################################################################################################
# TODO:
####################################################################################################

Característica: Usuarios
	Como usuario del sistema
	Y como persona que participa en proyectos
	Yo quiero gestionar el estado de una tarea asignada para mí
	De forma que al hacer un cambio de estado la tarea quede con un estado nuevo diferente al anterior
	Y que el cambio se realice en la tabla Kanban del dashboard desplazando el campo de tarea de una columan a otra siguiendo la metodología
	Y se guarde en el sistema el cambio de estado que hice Pruebas de persitencia

Esquema del escenario:
	Dado que en gestionar estados soy usuario <nombre>
	Cuando en gestionar estados estoy en la pagina <pagina>
	Y en gestionar estados consulto la tarea <tarea>
	Y su estado es <estado_1_id>
	Y ahora su estado es <estado_2_id>
	Entonces se espera que se muestre el estado <estado_2>
	Y NO el estado <estado_1>
	Y quede registrado en un log de estados

  Ejemplos:
    | nombre	| pagina	| tarea		| estado_1							| estado_1_id	| estado_2							| estado_2_id	| 
    | juan		| proyectos	| dibujar	| Por iniciar con entrada			| 1				| En desarrollo con inicio a tiempo	| 5				|
    | leidy		| proyectos	| modelar	| En desarrollo con inicio a tiempo	| 5				| Terminada a tiempo				| 8				|

