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
# = Gestionar tiempo tareas

####################################################################################################
# TODO:
####################################################################################################

Característica: Usuarios
	Como usuario del sistema
	Y como persona que participa en proyectos
	Yo quiero gestionar el tiempo de una tarea asignada para mí
	De forma que visualice el tiempo planeado
	Y el tiempo real se asigne mediante opciones de aumentar o disminuir el tiempo estimado agregadas al campo de tarea junto al título de ésta

# Pruebas de persitencia
Esquema del escenario:
	Dado que en gestionar soy usuario <nombre>
	Cuando en gestionar estoy en la pagina <pagina>
	Y en gestionar consulto la tarea <tarea>
	Y la duracion <duracion_1>
	Y ahora la duracion es <duracion_2>
	Entonces se espera que se muestre la duracion <duracion_2>
	Y NO la duracion <duracion_2>

  Ejemplos:
    | nombre	| pagina	| tarea		| duracion_1	| duracion_2	|
    | juan		| proyectos	| dibujar	| 5				| 6				|
    | leidy		| proyectos	| modelar	| 6				| 7				|

