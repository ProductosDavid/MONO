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
# =  Listar tipos de artefactos

####################################################################################################
# TODO:
# PROBAR IMPLEMENTAR PRUEBAS DEFINIDAS EN LA HISTORIA
####################################################################################################

Característica: Listar Tipos de Artefactos
    Como un usuario con rol administrador de David
    quiero visualizar en forma de lista los tipos de artefactos que pueden crearse en la aplicación 
    de forma que puede ver en una una lista una columna su nombre y descripción
	Además los tipos de artefactos debe estar ordenados alfabéticamente por su nombre por defecto.
	
#Prueba de usuario
#Visualizar
  Esquema del escenario:
    Dado que en tipos de artefactos un usuario se encuentra en la ventana de <ventana>
    Cuando en listar tipos de artefactos aplica la opcion <boton>
    Entonces en listar tipos de artefactos se espera ver una tabla que tiene una columna <columna1>
    Y con una opcion en listar tipos de artefactos <opcion1>

    Ejemplos:
    | ventana         	| boton           	| columna1 				| opcion1               |
    | /tipo_artefactos  | tipo_artefactos  | Nombre tipo de artefacto   	| Crear tipo de artefacto |

####################################################################################################
# TODO:
####################################################################################################

#Prueba de usuario
#Visualizar un tipo de artefacto creado
  Esquema del escenario:
    Dado que en listar tipos de artefactos un usuario se encuentra en la ventana de <ventana>
    Cuando crea un tipo de artefacto con nombre <nombre1>
    Y crea otro tipo de artefacto con nombre <nombre2>
    Y en listar tipos de artefactos al regresar a la ventana <ventana>
    Entonces en listar tipos de artefactos se espera ver una lista con el valor <nombre1>
    Y el valor en listar tipos de artefactos <nombre2>

  Ejemplos:
    | ventana       		| nombre1  	| nombre2 |
    | /tipo_artefactos 		| Boceto 	| Archivo de sonido  |
