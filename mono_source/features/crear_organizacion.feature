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
# =  Crear una organizacion

####################################################################################################
# TODO:
####################################################################################################

Característica: Organizaciones
 Como usuario con rol administrador de procesos
 quiero crear una organizacion 
 De forma que pueda asignarle un nombre, una direccion de correo, un nit, un tipo.

# Pruebas de persitencia
# Creacion de usuarios validos
  Esquema del escenario: 
    Dado que he introducido una organizacion con nombre <nombre>
    Y es una organizacion con direccion <direccion>
    Y es una organizacion con nit <nit>
    Cuando se guarde la organizacion
    Entonces el resultado debe ser: <resultado>

  Ejemplos:
    | nombre		| direccion			| nit		| resultado	|
    | Casa Sanson	| arrayanes@yo.com	| 1234567	| KO |
    | Casa Sanson	| arrayanes@yo.com	| 1234568	| OK |

