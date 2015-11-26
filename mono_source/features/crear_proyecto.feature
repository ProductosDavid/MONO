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
# =  Crear un proyecto

####################################################################################################
# TODO:
# PROBAR CREAR CON CAMPOS TIPO, IMAGEN
####################################################################################################

Característica: Proyectos
 Como usuario con rol administrador de procesos
 quiero crear un proyecto 
 De forma que pueda asignarle un nombre, un tipo, una descripción.

# Pruebas de persitencia
# Creacion de proyectos validos
  Esquema del escenario: 
    Dado que he introducido un proyecto con nombre <nombre>
    Y para el proyecto he agregado descripcion <descripcion>
    Cuando se guarde el proyecto
    Entonces el resultado debe ser: <resultado>

  Ejemplos:
    | nombre	| descripcion 						| resultado	|
    | SBI		| Este es el proyecto de bocetos 	| OK |
    | REVISTA	| Este es el proyecto de reciclaje	| OK |
