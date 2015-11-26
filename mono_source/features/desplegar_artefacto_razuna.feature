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
# PROBAR CON ARTEFACTOS Y CON ARTEFACTOS YA EN DAVID
####################################################################################################

Característica: Usuarios
	Como usuario del sistema y de razuna
	Yo quiero crear un folder en razuna
	De forma que aparezca en mi sesion de razuna

# Pruebas de persitencia
Esquema del escenario:
	Dado que en desplegar artefactos soy el usuario <nombre>
	Cuando en desplegar artefactos consulto el artefacto <artefacto>
	Entonces en desplegar artefactos se espera el resultado <resultado>

  Ejemplos:
    | nombre	| artefacto		| resultado |
    | juan		| artefacto1	| OK |
    | juan		| artefacto2	| KO |
