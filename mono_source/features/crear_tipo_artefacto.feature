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
# =  Crear un tipo de artefacto

####################################################################################################
# TODO:
####################################################################################################

Característica: Tipos de artefacto
 Como usuario con rol administrador de procesos
 quiero crear un tipo de recurso 
 De forma que pueda asignarle un nombre y una descripción.

# Pruebas de persitencia
# Creacion de tipos de recursos validos
  Esquema del escenario: 
    Dado que he introducido un tipo de artefacto con nombre <nombre>
    Y descripcion <descripcion>
    Cuando se guarde el tipo de artefacto
    Entonces el resultado debe ser: <resultado>

  Ejemplos:
    | nombre	| descripcion 			| resultado	|
    | Boceto	| Este es un boceto 	| OK |
    | Modelo 3D	| Este es un modelo 3D 	| OK |
    | Boceto	| Este es otro boceto|  | KO |  
