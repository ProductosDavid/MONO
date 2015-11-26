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
# =  Listar proyectos

####################################################################################################
# TODO:
# PROBAR COLUMNAS TIPO, IMAGEN
# PROBAR IMPLEMENTAR PRUEBAS DEFINIDAS EN LA HISTORIA
####################################################################################################

Característica: Listar Proyectos
    Como un usuario administrador de David
    quiero visualizar en forma de lista los proyectos de la aplicación 
    de forma que puede ver en una una lista su informacion como nombre, tipo, descripcion.
	
#Prueba de usuario
#Visualizar
  Esquema del escenario:
    Dado que en proyectos un usuario se encuentra en la ventana de <ventana>
    Cuando en listar proyectos aplica la opcion <boton>
    Entonces en listar proyectos se espera ver una tabla que tiene una columna <columna1>
    Y con una opcion en listar proyectos <opcion1>

    Ejemplos:
    | ventana         	| boton           	| columna1 				| opcion1               |
    | /proyectos		| nuevo_proyecto  	| nombre		   		| Crear proyecto		|

####################################################################################################
# TODO:
# PROBAR COLUMNAS TIPO, IMAGEN
# VERIFICAR PASO COMENTADO PORQUE CREA EL PROYECTO PERO MUESTRA ERROR
####################################################################################################

#Prueba de usuario
#Visualizar un tipo de artefacto creado
  Esquema del escenario:
    Dado que en proyectos un usuario se encuentra en la ventana de <ventana>
    #Cuando crea un proyecto con nombre <nombre1>
    Y crea un proyecto con nombre <nombre2>
    Y en listar proyectos al regresar a la ventana <ventana>
    Entonces en listar proyectos se espera ver una lista con el valor <nombre1>
    Y el valor en listar proyectos <nombre2>

  Ejemplos:
    | ventana			| nombre1  	| nombre2	|
    | /proyectos 		| SBI	 	| REVISTA	|
