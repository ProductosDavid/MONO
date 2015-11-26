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
	Como usuario del sistema y de razuna
	Yo quiero usar razuna
	De forma que con mi usuario y clave de CMS entro a razuna transparentemente

# Pruebas de persitencia
Esquema del escenario:
	Dado que en autenticarme en razuna soy el usuario <nombre>
	Y en autenticarme en razuna tengo clave <clave>
	Cuando en autenticarme en razuna entro
	Entonces en autenticarme en razuna se espera el resultado <resultado>

  Ejemplos:
    | nombre		| clave		| resultado |
    | Administrator	| m6c6r3n6d	| OK |
    | admindavid	| 123456	| OK |
    | juan			| Test1		| KO |
