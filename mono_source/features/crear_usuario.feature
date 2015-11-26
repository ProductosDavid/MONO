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
# =  Crear un usuario

####################################################################################################
# TODO:
# PROBAR CREAR CON CAMPOS ROL, IMAGEN
# VERIFICAR LOGIN REPETIDO PORQUE LA VALIDACION SE HACE DESDE LA INTERFAZ
####################################################################################################

Característica: Usuarios
 Como usuario con rol administrador de procesos
 quiero crear un usuario 
 De forma que pueda asignarle un nombre, un login.

# Pruebas de persitencia
# Creacion de usuarios validos
  Esquema del escenario: 
    Dado que he introducido un usuario con nombre <nombre>
    Y login <login>
    Y password <password>
    Cuando se guarde el usuario
    Entonces el resultado debe ser: <resultado>

  Ejemplos:
    | nombre			| login		| password	| resultado	|
    | Juan Manuel		| juan		| 123456	| KO |
    | Leidy Alexandra	| leidy35	| 123456	| OK |

