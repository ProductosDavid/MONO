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
# =  Listar artefactos proyectos

####################################################################################################
# TODO:
# PROBAR COLUMNAS TIPO, IMAGEN
# PROBAR IMPLEMENTAR PRUEBAS DEFINIDAS EN LA HISTORIA
####################################################################################################

Característica: Listar Proyectos
    Como un usuario administrador de David
    quiero visualizar en forma de lista los artefactos de un proyecto 
    de forma que puede ver en una una lista su informacion como nombre, descripcion.
	
#Prueba de usuario
#Visualizar
  Esquema del escenario:
    Dado que en listar artefactos proyectos un usuario se encuentra en la ventana de <ventana>
    Cuando en listar artefactos proyectos ha creado el artefacto <artefacto>
    Entonces en listar artefactos proyectos se espera ver el resultado <resultado>

    Ejemplos:
    | ventana         	| artefacto     		| resultado	|
    | /proyectos		| imas_logo_large.jpeg  | OK		|
